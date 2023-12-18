import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //Firebase bağlantısı
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    // print("Firebase bağlantısı başarılı!"); // Debug mesajı
  } catch (e) {
    print("Firebase bağlantı hatası: $e");
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Debug banner'ı kaldırma işlemi
      home: RegisterPage(),
    );
  }
}

//Register sayfası
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //Firebase sınıfından örnek oluşturma
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //Kullanıcı bilgilerini alma işlemi
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> _register() async {
    try {
      // Şifre kontrolü
      if (_passwordController.text != _confirmPasswordController.text) {
        print("Hata: Şifreler eşleşmiyor.");
        return;
      }

      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      print("Kullanıcı kaydı başarılı: ${userCredential.user!.uid}");

      // Kayıt işlemi başarılı olduktan sonra oturum açma sayfası
      _showLoginPage();
    } on FirebaseAuthException catch (e) {
      print("Kullanıcı kaydı hatası: ${e.message}");
    }
  }

  //Yönlendirme kodu
  void _showLoginPage() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null, // AppBar'ı kaldırdık
      body: Container(
        //Sayfanın arkaplan rengi
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUoboEK2anBgaa0WO30_LdzwocTOOr1QcMlSFbhACsXw&s'),
            fit: BoxFit.cover,
          ),
          color: Colors.black.withOpacity(0.3), // Opak beyaz arkaplan
        ),
        child: Center(
          //Form oluşturma işlemi
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _emailController,
                  style: TextStyle(
                      color: Colors.white), // Metin rengini beyaz yapma
                  decoration: InputDecoration(
                    labelText: 'E-posta',
                    labelStyle: TextStyle(
                        color: Colors.white), // Label rengini beyaz yapma
                  ),
                ),
                TextField(
                  controller: _passwordController,
                  style: TextStyle(
                      color: Colors.white), // Metin rengini beyaz yapma
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    labelStyle: TextStyle(
                        color: Colors.white), // Label rengini beyaz yapma
                  ),
                  obscureText: true,
                ),
                TextField(
                  controller: _confirmPasswordController,
                  style: TextStyle(
                      color: Colors.white), // Metin rengini beyaz yapma
                  decoration: InputDecoration(
                    labelText: 'Şifreyi Tekrar Girin',
                    labelStyle: TextStyle(
                        color: Colors.white), // Label rengini beyaz yapma
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 16.0),
                //Buton style özellikleri
                ElevatedButton(
                  onPressed: _register,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: 18.0,
                      horizontal: 32.0,
                    ), // Buton rengini siyah yapma
                  ),
                  child: Text('Kayıt Ol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
