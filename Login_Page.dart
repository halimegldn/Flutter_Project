import 'package:flutter/material.dart';
import 'sayfa1.dart';

class LoginPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  final String mail;
  final String sifre;

  LoginPage({,
    required this.mail,
    required this.sifre,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
         // Sayfanın arka planına resim eklendi.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/arkaplan.jpg"), //Burası Assets klasöründen alıyor resmii
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.black.withOpacity(0.2),  // Opaklık ayarlandı.
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Form oluşturuldu.
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'E-Mail',
                      hintStyle: TextStyle(
                        color: Colors.white,
                      ), //Text borderları ayarlandı.
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.3),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ), // Form Validation yapıldı.
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
                      //Text borderları ayarlandı.
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.3),
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ), // Form Validation yapıldı.
                    validator: (tfgirdisi) {
                      if (tfgirdisi?.isEmpty ?? true) {
                        return 'Şifre boş bırakılamaz';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
                  // Form Giriş Butonu 
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
                    // Butona tıklanınca yapılacak işlemler.
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                          // Navigation ile başka sayfaya yönlendirme yapıldı.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                MyApp(), // Sayfa1 yerine MyApp()'ı kullanın
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
