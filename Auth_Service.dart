import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Kullanıcı giriş işlemi
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Giriş hatası durumunda hata mesajını yazdır
      print("Giriş hatası: ${e.message}");
      return null;
    }
  }

  // Kullanıcı kaydı işlemi
  Future<User?> register(String email, String password) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      // Kullanıcı kaydı hatası durumunda hata mesajını yazdır
      print("Kullanıcı kaydı hatası: ${e.message}");
      return null;
    }
  }

  // Kullanıcı çıkış işlemi
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
