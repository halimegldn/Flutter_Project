import 'package:flutter/material.dart';
import 'Page1.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

//Yemek türü sayfası
class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> selectedTypes = [];
  //checkbox ile yemeklerin tür adları ve radio butonlar oluşturuldu
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90A4AE),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text('Çorba'),
            value: selectedTypes.contains('Çorba'),
            onChanged: (value) => _onTypeSelected('Çorba', value ?? false),
          ),
          CheckboxListTile(
            title: Text('Salata'),
            value: selectedTypes.contains('Salata'),
            onChanged: (value) => _onTypeSelected('Salata', value ?? false),
          ),
          CheckboxListTile(
            title: Text('Ana Yemek'),
            value: selectedTypes.contains('Ana Yemek'),
            onChanged: (value) => _onTypeSelected('Ana Yemek', value ?? false),
          ),
          CheckboxListTile(
            title: Text('Tatlı'),
            value: selectedTypes.contains('Tatlı'),
            onChanged: (value) => _onTypeSelected('Tatlı', value ?? false),
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

  //Yemek türü aranıyor
  void _onTypeSelected(String type, bool selected) {
    setState(() {
      if (selected) {
        selectedTypes.add(type);
      } else {
        selectedTypes.remove(type);
      }
    });
  }

  //Firebase meals tablasonda arama işlemi yapılıyor
  void _onSearchButtonPressed(BuildContext context) async {
    if (selectedTypes.isNotEmpty) {
      var snapshot = await FirebaseFirestore.instance
          .collection('meals')
          .where('yemek_turu', whereIn: selectedTypes)
          .get();

      List<DocumentSnapshot> meals = snapshot.docs;
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealListPage(meals),
        ),
      );
    } else {
      print('Lütfen en az bir yemek türü seçin.');
    }
  }
}
