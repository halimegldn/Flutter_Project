import 'package:flutter/material.dart';

List<String> options = [
  'Kahvaltı',
  'Ana Yemek',
  'Tatlı',
  'Atıştırmalık',
  'Çorba'
];

class Sayfa2 extends StatefulWidget {
  @override
  _Sayfa2State createState() => _Sayfa2State();
}

class _Sayfa2State extends State<Sayfa2> {
  String currentOption = options[0]; // Default değeri atandı

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (String option in options)
        // Listile yapısı kullanılarak option ve radio butonları hizalandı
          ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 80, vertical: 10),
            title: Text(
              option,
              style: TextStyle(fontSize: 20),
            ),
            //Radio butonu oluşturuldu
            leading: Radio(
              value: option,
              groupValue: currentOption,
              onChanged: (value) {
                setState(() {
                  currentOption = value.toString();
                });
              },
            ),
          ),
        SizedBox(
          height: 25,
        ),
        //Arama butonu özellikleri
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: Color(
                0xFF535252), // Burada primary ile arka plan rengini belirliyoruz
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            padding: EdgeInsets.symmetric(
              vertical: 15.0,
              horizontal: 40.0,
            ),
          ),
          onPressed: () {
            // Butona tıklandığında yapılacak işlemler
          },
          child: Text('Ara', style: TextStyle(fontSize: 18)),
        ),
      ],
    );
  }
}
