import 'package:flutter/material.dart';
import 'sayfa1.dart';

class LoginPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  //final String kullaniciAdi;
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pixers.pics/pho_wat(s3:700/FO/22/58/88/62/0/700_FO225888620_c4dfb0a92674ddba576ab6272961bcb8,700,467,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,417,jpg)/duvar-resimleri-sukran-gunu-yemegi-arka-plan.jpg.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.start,
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
                    validator: (tfgirdisi) {
                      if (tfgirdisi?.isEmpty ?? true) {
                        return 'Şifre boş bırakılamaz';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20.0),
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
                    onPressed: () {
                      if (formKey.currentState?.validate() ?? false) {
                        // Kayıt işlemleri burada gerçekleştirilebilir.
                        // Yönlendirme işlemi:
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
