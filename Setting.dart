import 'package:flutter/material.dart';

//Ayarar sayfası
class FavoritePage extends StatelessWidget {
  final String mealName;

  FavoritePage(this.mealName);

  // Yemeği silen metod
  void deleteMeal(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('$mealName adlı yemek silindi!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90CAF9),
      //Kullanıcı bilgilerini içeren Container
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //color: Color(0xffBBDEFB),
              height: 100,
              child: ListTile(
                leading: CircleAvatar(
                  child: Icon(Icons.person),
                  radius: 25,
                ),
                title: Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Halime GİLDAN",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
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
            //Favorilere eklenen yemeğin gösterilme işlemi
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Favori Yemeğiniz:',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () {
                    // Silme işlevselliğini çağır
                    deleteMeal(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.delete, color: Colors.blue),
                      SizedBox(width: 8),
                      Text(
                        'Sil',
                        style: TextStyle(fontSize: 18, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text(
              mealName,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        //Çıkış işlemi
        padding: EdgeInsets.only(left: 16, top: 16, right: 16),
        child: GestureDetector(
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.exit_to_app,
                size: 30,
              ),
              SizedBox(height: 10),
              //Sayfanın altında bulunan Person, Search, Home iconları
              Row(
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
            ],
          ),
        ),
      ),
    );
  }
}
