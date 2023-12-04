import 'package:flutter/material.dart';
import 'Login_Page.dart';

class RegisterPage extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var kullaniciAdiController = TextEditingController();
  var mailController = TextEditingController();
  var sifreController = TextEditingController();
  var tekrarSifreController = TextEditingController();

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
          //Sayfanın ortasına Container eklendi
          child: Container(
            //Opaklık ayarlandı
            color: Colors.white.withOpacity(0.3),
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Container içine Form eklendi
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: kullaniciAdiController,
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
                        //Form Validation yapıldı
                        validator: (input) {
                          if (input?.isEmpty ?? true) {
                            return 'Kullanıcı adı boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: mailController,
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
                        //Form Validation yapıldı
                        validator: (input) {
                          if (input?.isEmpty ?? true) {
                            return 'E-Mail boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: sifreController,
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
                        //Form Validation yapıldı
                        validator: (input) {
                          if (input?.isEmpty ?? true) {
                            return 'Şifre boş bırakılamaz';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: tekrarSifreController,
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
                          color: Colors.white,
                        ),
                        //Form Validation yapıldı
                        validator: (input) {
                          if (input?.isEmpty ?? true) {
                            return 'Şifre tekrarı boş bırakılamaz';
                          }
                          if (input != sifreController.text) {
                            return 'Şifreler uyuşmuyor';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //Kayıt butonu oluşturuldu
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(
                                  kullaniciAdi: kullaniciAdiController.text,
                                  mail: mailController.text,
                                  sifre: sifreController.text,
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



