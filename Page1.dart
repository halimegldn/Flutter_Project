import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'share_page.dart';
import 'setting.dart';

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
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF535252),
              shape: RoundedRectangleBorder(),
              padding: EdgeInsets.all(18.0),
            ),
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

                return ListTile(
                  title: Text(mealData['isim'] ?? ''),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Container(
                        height: 180, // Resim yüksekliği ayarlanabilir
                        child: mealData['resim_url'] != null
                            ? Image.network(
                                mealData['resim_url'],
                                fit: BoxFit.cover,
                              )
                            : SizedBox.shrink(),
                      ),
                      SizedBox(height: 8),
                      Text('Kalori: ${mealData['kalori'] ?? ''}'),
                      Text('Malzemeler: ${mealData['malzemeler'] ?? ''}'),
                      Text('Tarif: ${mealData['tarif'] ?? ''}'),
                      Text('Yemek Türü: ${mealData['yemek_turu'] ?? ''}'),
                      Text(
                          'Pişirme Süresi: ${mealData['pisime_s'] ?? ''} dakika'),
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

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  List<String> selectedTypes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF90A4AE),

      // appBar: AppBar(
      //   title: Text('Yemek Türü Seç'),
      // ),
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

  void _onTypeSelected(String type, bool selected) {
    setState(() {
      if (selected) {
        selectedTypes.add(type);
      } else {
        selectedTypes.remove(type);
      }
    });
  }

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

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController calorieController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF78909C),
      body: Column(
        children: [
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: calorieController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Kalori Sınırı'),
            ),
          ),
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

  void _onSearchButtonPressed(BuildContext context) async {
    int enteredCalorie = int.tryParse(calorieController.text) ?? 0;

    var snapshot = await FirebaseFirestore.instance
        .collection('meals')
        .where('kalori', isLessThanOrEqualTo: enteredCalorie)
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

class FourthPage extends StatefulWidget {
  @override
  _FourthPageState createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  int selectedTime = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF607D8B),
      body: Column(
        children: [
          SizedBox(height: 16),
          DropdownButton<int>(
            value: selectedTime,
            items: [
              DropdownMenuItem(
                value: 15,
                child: Text('15-30 dakika'),
              ),
              DropdownMenuItem(
                value: 30,
                child: Text('30-45 dakika'),
              ),
              DropdownMenuItem(
                value: 45,
                child: Text('45-60 dakika'),
              ),
              DropdownMenuItem(
                value: 60,
                child: Text('60+ dakika'),
              ),
            ],
            onChanged: (value) {
              setState(() {
                selectedTime = value!;
              });
            },
          ),
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

  void _onSearchButtonPressed(BuildContext context) async {
    print("Selected Time: $selectedTime");
    var snapshot = await FirebaseFirestore.instance
        .collection('meals')
        .where('pisime_s', isGreaterThanOrEqualTo: 30, isLessThanOrEqualTo: 45)
        .get();

    List<DocumentSnapshot> meals = snapshot.docs;
    print("Number of meals matching the criteria: ${meals.length}");

    if (meals.isEmpty) {
      // Eğer hiç yemek bulunamadıysa kullanıcıya bilgi ver
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Uyarı'),
          content: Text('Belirtilen sürede yemek bulunamadı.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Tamam'),
            ),
          ],
        ),
      );
    } else {
      // Eğer yemek bulunduysa MealListPage'e yönlendir
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MealListPage(meals),
        ),
      );
    }
  }
}
