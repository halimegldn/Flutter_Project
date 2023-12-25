import 'package:flutter/material.dart';
import 'Setting.dart';

//Paylaşma sayfası
class SharePage extends StatelessWidget {
  final String mealName;

  SharePage(this.mealName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CAF9),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Yemek Adı: $mealName'),
            SizedBox(height: 16),
            //Paylaşma işlemi için mail ve not girme işlemi
            TextField(
              decoration: InputDecoration(
                labelText: 'Mail Adresi',
                filled: true,
                fillColor: Color(0xFFBBDEFB),
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Not',
                filled: true,
                fillColor: Color(0xFFBBDEFB),
                contentPadding: EdgeInsets.all(16.0),
              ),
              style: TextStyle(fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Paylaşma işlemleri burada gerçekleştirilebilir.
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFBBDEFB),
                padding: EdgeInsets.all(18.0),
              ),
              child: Text(
                'Paylaş',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
      //Sayfanın altında bulunan Setting, Home, Search iconları
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        color: Color(0xFF90CAF9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                Navigator.pop(context); // Anasayfaya dön
              },
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Search ikonuna tıklandığında yapılacak işlemler buraya eklenebilir
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        FavoritePage(''), // Favori sayfasına git
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
