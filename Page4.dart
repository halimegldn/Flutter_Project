import 'package:flutter/material.dart';

class Sayfa4 extends StatefulWidget {
  @override
  _Sayfa4State createState() => _Sayfa4State();
}

class _Sayfa4State extends State<Sayfa4> {
  String selectedValue = 'Pişirme Süresi'; // Varsayılan değer

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF607D8B),
      padding: EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white, // Beyaz arkaplan
              borderRadius: BorderRadius.circular(10.0),
            ),
            //Dropdownlist yapısı oluşturuldu
            child: DropdownButton<String>(
              // Seçili değeri ve değerin değişimini takip etmek için kullanılır
              value: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue!;
                });
              },
              // Dropdown içerisindeki öğelerin listesi
              items: [
                'Pişirme Süresi',
                '15-30 DK',
                '30-45 DK',
                '45-60 DK',
                '60+ DK'
              ].map<DropdownMenuItem<String>>((String value) {
                // Her bir öğe için bir DropdownMenuItem oluşturuldu
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    padding: EdgeInsets.all(10), // İstediğiniz iç boşluk ayarı
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(
            height: 200,
          ),
          //Arama Butonu
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
      ),
    );
  }
}
