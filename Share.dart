import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CAF9),
      body: Padding(
        padding: EdgeInsets.fromLTRB(40, 120, 40, 50),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'E-Mail',
                filled: true,
                fillColor: Color(0xFFBBDEFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 36),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Not',
                filled: true,
                fillColor: Color(0xFFBBDEFB),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
            ),
            SizedBox(height: 50),
            // Gönderme butonu oluşturuldu.
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFFBBDEFB),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
              ),
              child: Text(
                'Gönder',
                style: TextStyle(fontSize: 20, color: Colors.black54),
              ),
              onPressed: () {
                //Butona tıklanınca yapılacak özellikler.
              },
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
      //Navigation için iconlar oluşturuldu.
      bottomNavigationBar: BottomNavigationBar(
        items: [
          //Ayarlara gitmek için oluşturulan icon.
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Person',
          ),
          //Anasayfaya gitmek için oluşturulan icon.
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
        ],
        backgroundColor: Color(0xFFBBDEFB),
      ),
    );
  }
}
