import 'package:flutter/material.dart';
import 'Page1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Pişme Süresi sayfası
class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int selectedTime = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF607D8B),
      body: Column(
        children: [
          //Dropdownlist oluşturma işlemi
          SizedBox(height: 16),
          DropdownButton<int>(
            value: selectedTime,
            items: [
              DropdownMenuItem(
                value: 15,
                child: Text('15-30 dakika'),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text('30-45 dakika'),
              ),
              DropdownMenuItem(
                value: 45,
                child: Text('45-60 dakika'),
              ),
              DropdownMenuItem(
                value: 60,
                child: Text('60+ dakika'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedTime = value!;
              });
            },
          ),
          //Arama butonu özellikleri
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF535252),
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(18.0),
            ),
            onPressed: () => _onSearchButtonPressed(context),
            child: Text('Ara'),
          ),
        ],
      ),
    );
  }

  //Firebase meals tablosunda arama işlemi
  void _onSearchButtonPressed(BuildContext context) async {
    print("Selected Time: $selectedTime");
    var snapshot = await FirebaseFirestore.instance
        .collection('meals')
        .where('pisime_s', isGreaterThanOrEqualTo: 30, isLessThanOrEqualTo: 45)
        .get();

    List<DocumentSnapshot> meals = snapshot.docs;
    print("Number of meals matching the criteria: ${meals.length}");

    if (meals.isEmpty) {
      // Eğer hiç yemek bulunamadıysa kullanıcıya bilgi ver
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Uyarı'),
          content: Text('Belirtilen sürede yemek bulunamadı.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    } else {
      // Eğer yemek bulunduysa MealListPage'e yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealListPage(meals),
        ),
      );
    }
  }
}
