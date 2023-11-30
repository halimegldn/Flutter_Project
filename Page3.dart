import 'package:flutter/material.dart';

class Sayfa3 extends StatefulWidget {
  @override
  _Sayfa3State createState() => _Sayfa3State();
}

class _Sayfa3State extends State<Sayfa3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78909C),
      //Container oluşturuldu
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 90),
            Align(
              alignment: Alignment.centerRight,
              child: TextField(
                keyboardType: TextInputType.number,
                //text style özellikleri belirlendi
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  labelText: 'Kalori Girin',
                  labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                  // Arkaplan rengi
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            //Arama butonu özellikleri
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF535252),
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
      ),
    );
  }
}
