import 'package:flutter/material.dart';
import 'Page1.dart';

class LoginPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  // `mail` ve `sifre` parametreleri değişmez olarak tanımlandı
  final String mail;
  final String sifre;

  LoginPage({
    //required this.kullaniciAdi,
    required this.mail,
    required this.sifre,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Sayfanın arka planına resim eklendi
      body: Container(
        decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/arkaplan.jpg"),
        fit: BoxFit.cover,
      ),
    ),
        child: Center(
          // Sayfanın ortasına bir container eklendi
          child: Container(
            //Container opaklığı ayarlandı
            color: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.all(20.0),
            //Container içine form eklendi
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'E-Mail',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.3),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    //Form Validation yapıldı
                    validator: (tfgirdisi) {
                      if (tfgirdisi?.isEmpty ?? true) {
                        return 'E-Mail boş bırakılamaz';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.0),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Şifre',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.3),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    //Form Validation yapıldı
                    validator: (tfgirdisi) {
                      if (tfgirdisi?.isEmpty ?? true) {
                        return 'Şifre boş bırakılamaz';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  //Giriş Butonu oluşturuldu
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 18.0,
                        horizontal: 32.0,
                      ),
                    ),
                    child: Text('GİRİŞ'),
                    //Butona tıklandığında yapılacak işlemler
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Yönlendirme işlemi:
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}





