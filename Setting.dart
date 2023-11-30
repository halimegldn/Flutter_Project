import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<String> kutucuklar = ['Favori1', 'Favori2'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // Arka plan rengi
        backgroundColor: Color(0xFFBBDEFB),
        body: ListView(
          padding: EdgeInsets.fromLTRB(16, 56, 16, 16),
          children: <Widget>[
            Container(
              color: Color(0xffBBDEFB),
              height: 100,
              // Lisetei yapısı ile profil oluşturuldu.
              child: ListTile(
                leading: CircleAvatar(child: Icon(Icons.person), radius: 25),
                title: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halime GİLDAN",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "gldnhlm@gmail.com",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Favoriler',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            // Kaç tane Favorilere eklenmiş eleman var ise o kadar Card oluşturur.
            for (var kutucuk in kutucuklar)
              // Daha düzenli hale getirmek için Card yapısı kullanıldı.
              Card(
                color: Color(0xFFBBDEFB),
                margin: EdgeInsets.all(16),
                child: ListTile(
                  title: Text(kutucuk),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete),
                        color: Colors.black,
                        onPressed: () {
                          // Silme işlemi burada yapılacak
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.visibility),
                        color: Color(0xFF0277BD),
                        onPressed: () {
                          // Görüntüleme işlemi burada yapılacak
                        },
                      ),
                    ],
                  ),
                ),
              ),
            //Ayarlar için container oluşturuldu.
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ayarlar',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Şifre: 123456',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Çıkış Yap',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      SizedBox(width: 10), // Bir boşluk ekleyebilirsiniz
                      Icon(
                        Icons.exit_to_app,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
