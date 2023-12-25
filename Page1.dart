import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Share_Page.dart';
import 'Setting.dart';
import 'Page2.dart';
import 'Page3.dart';
import 'Page4.dart';

class Page1 extends StatefulWidget {
  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFB0BEC5),
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
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
                  children: [
                    MealPage(),
                    SecondPage(),
                    ThirdPage(),
                    FourthPage(),
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

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<TextEditingController> malzemeControllers = [];

  //Başlangıçta 3 malzeme text i eklendi
  @override
  void initState() {
    super.initState();
    malzemeControllers.add(TextEditingController());
    malzemeControllers.add(TextEditingController());
    malzemeControllers.add(TextEditingController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB0BEC5),
      body: Column(
        children: [
          SizedBox(height: 16),
          //+ Butonu oluşturuldu
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF535252),
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(18.0),
            ),
            //+ Butonuna tıklanıldıkça text ekleme işlemi yapılıyor
            onPressed: () {
              setState(() {
                malzemeControllers.add(TextEditingController());
              });
            },

            child: Text(
              '+',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          for (int i = 0; i < malzemeControllers.length; i++)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: malzemeControllers[i],
                decoration: InputDecoration(labelText: 'Malzeme ${i + 1}'),
              ),
            ),
          //Arama butonu
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

  //Butona tıklanınca Firebase araması yapıyor
  void _onSearchButtonPressed(BuildContext context) async {
    List<String> ingredients = [];
    for (var controller in malzemeControllers) {
      ingredients.add(controller.text);
    }

    var snapshot = await _firestore
        .collection('meals')
        .where('malzemeler', arrayContainsAny: ingredients)
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

//Yemeklerin çıktı sayfası
class MealListPage extends StatelessWidget {
  final List<DocumentSnapshot> meals;

  MealListPage(this.meals);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFCC80),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: meals.length,
              itemBuilder: (context, index) {
                var mealData = meals[index].data() as Map<String, dynamic>;

                // Favori ve Paylaş ikonları ekleniyor
                Widget trailingWidget = Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.favorite_border),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                FavoritePage(mealData['isim']),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.share),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SharePage(mealData['isim']),
                          ),
                        );
                      },
                    ),
                  ],
                );

                // ...
                //Yemeklerin adları, resimler, türleri, malzemeleri, pişme süreleri ve tarifi gösteriliyor
                return ListTile(
                  title: Text(mealData['isim'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Container(
                        height:
                            200, // Yüksekliği ayarlanabilir (istediğiniz değeri girin)
                        child: mealData['resim_url'] != null
                            ? Image.network(
                                mealData['resim_url'],
                                fit: BoxFit
                                    .cover, // Resmi konteynıra tamamen sığdır
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(height: 8),
                      Text('Kalori: ${mealData['kalori'] ?? ''}'),
                      Text('Malzemeler: ${mealData['malzemeler'] ?? ''}'),
                      Text('Tarif: ${mealData['tarif'] ?? ''}'),
                      Text('Yemek Türü: ${mealData['yemek_turu'] ?? ''}'),
                      Text(
                        'Pişirme Süresi: ${mealData['pisime_s'] ?? ''} dakika',
                      ),
                    ],
                  ),
                  trailing: trailingWidget,
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            color: Color(0xFFFFCC80),
            child: Row(
              mainAxisAlignment: MainAxisAlignment
                  .spaceEvenly, // Center için spaceEvenly kullanılabilir.
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
        ],
      ),
    );
  }
}
