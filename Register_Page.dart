import 'package:flutter/material.dart';
import 'Login_Page.dart';

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
        // Sayfanın arka planına resim eklendi.
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/arkaplan.jpg"), //Burası Assets klasöründen alıyor resmii
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            color: Colors.white.withOpacity(0.3),  // Opaklık ayarlandı
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Kayıt için form yapıldı.
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
                          // Form textlerinin border özelliği ayarlandı.
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        // Form validation yapıldı.
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
                          // Form textlerinin border özelliği ayarlandı.
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                         // Form validation yapıldı.
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
                          // Form textlerinin border özelliği ayarlandı.
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                         // Form validation yapıldı.
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
                          // Form textlerinin border özelliği ayarlandı.
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.3),
                          ),
                        ),
                        style: TextStyle(
                          color: Colors.white, // yazılan input rengi 
                        ),
                         // Form validation yapıldı.
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
                      ), // Form Kayıt butonu
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
                        // Butona tıklanınca yapılacak işlemler.
                        onPressed: () {
                          if (formKey.currentState?.validate() ?? false) {
                            // Navigation ile başka sayfaya yönlendirme yapıldı.
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  kullaniciAdi: tfKullaniciAdi.text,
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