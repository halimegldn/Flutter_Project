import 'package:flutter/material.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Color(0xFFB0BEC5),
          body: Column(
            children: [
              //Sayfanın üst kısmında bulunan sekmeleri oluşturuldu
              TabBar(
                tabs: [
                  Tab(text: 'Malzeme'),
                  Tab(text: 'Yemek T'),
                  Tab(text: 'Kalori'),
                  Tab(text: 'Pişme S'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  //Her bir sekme ile ilişkilendirilmiş içerikleri görüntülendi
                  children: [
                    Sayfa1(),
                    Sayfa2(),
                    Sayfa3(),
                    Sayfa4(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Sayfa1 extends StatefulWidget {
  @override
  _Sayfa1State createState() => _Sayfa1State();
}

class _Sayfa1State extends State<Sayfa1> {
  List<TextEditingController> malzemeControllers = [];

  @override
  void initState() {
    super.initState();
    // Başlangıçta 2 malzeme texti eklendi
    malzemeControllers.add(TextEditingController());
    malzemeControllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFB0BEC5),
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          // + Butonu özellikleri
          Container(
            margin: EdgeInsets.fromLTRB(160, 20, 0, 20),
            //Buton style özellikleri
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF535252),
                shape: RoundedRectangleBorder(),
                padding: EdgeInsets.all(18.0),
              ),
              onPressed: () {
                //Butona tıklanınca yeni malzeme text i ekleniyor
                setState(() {
                  malzemeControllers.add(TextEditingController());
                });
              },
              child: Text(
                '+',
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),

          SizedBox(height: 20), // 20 birim boşluk ekledik

          //Girilecek malzeme sayısı kadar Malzeme texti ekleniyor
          for (int i = 0; i < malzemeControllers.length; i++)
            //Row ile yatay hizalama yapıldı
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    controller: malzemeControllers[i],
                    decoration: InputDecoration(
                      labelText: 'Malzeme',
                      labelStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                // Sil butonu
                IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    setState(() {
                      malzemeControllers.removeAt(i);
                    });
                  },
                ),
              ],
            ),
          SizedBox(height: 40),

          // Arama Butonu
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF535252),
              //Buton Border ayarlandı
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
