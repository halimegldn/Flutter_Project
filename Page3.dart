import 'package:flutter/material.dart';
import 'Page1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Kalori sayfası
class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78909C),
      body: Column(
        children: [
          SizedBox(height: 16),
          //Kalori girmek için text oluşturma işlemi
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: calorieController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kalori Sınırı'),
            ),
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

  //Firebase meals tablosunda kalori değeri girilen aralığın altında olan yemekleri arama işlemi
  void _onSearchButtonPressed(BuildContext context) async {
    int enteredCalorie = int.tryParse(calorieController.text) ?? 0;

    var snapshot = await FirebaseFirestore.instance
        .collection('meals')
        .where('kalori', isLessThanOrEqualTo: enteredCalorie)
        .get();

    List<DocumentSnapshot> meals = snapshot.docs;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MealListPage(meals),
      ),
    );
  }
}
