import 'package:flutter/material.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var tfKullaniciAdi = TextEditingController();
  var tfMail = TextEditingController();
  var tfSifre = TextEditingController();
  var tfTekrarSifre = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.pixers.pics/pho_wat(s3:700/FO/22/58/88/62/0/700_FO225888620_c4dfb0a92674ddba576ab6272961bcb8,700,467,cms:2018/10/5bd1b6b8d04b8_220x50-watermark.png,over,480,417,jpg)/duvar-resimleri-sukran-gunu-yemegi-arka-plan.jpg.jpg',
            ),
            //image: AssetImage("assets/arkaplan.jpg"), Burası Assets klasöründen alıyor resmii
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.white.withOpacity(0.3),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: tfKullaniciAdi,
                        decoration: InputDecoration(
                          hintText: 'Kullanıcı Adı',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi?.isEmpty ?? true) {
                            return 'Kullanıcı adı boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: tfMail,
                        decoration: InputDecoration(
                          hintText: 'E-Mail',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.3),
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
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: tfSifre,
                        decoration: InputDecoration(
                          hintText: 'Şifre',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.3),
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
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: tfTekrarSifre,
                        decoration: InputDecoration(
                          hintText: 'Şifreyi Tekrar Girin',
                          hintStyle: TextStyle(
                            color: Colors.white,
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white, // yazılan input
                        ),
                        validator: (tfgirdisi) {
                          if (tfgirdisi?.isEmpty ?? true) {
                            return 'Şifre tekrarı boş bırakılamaz';
                          }
                          if (tfgirdisi != tfSifre.text) {
                            return 'Şifreler uyuşmuyor';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
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
                        child: Text('KAYIT'),
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  //kullaniciAdi: tfKullaniciAdi.text,
                                  mail: tfMail.text,
                                  sifre: tfSifre.text,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
