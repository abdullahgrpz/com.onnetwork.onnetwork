import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:device_info_plus/device_info_plus.dart'; // <--- YENİ EKLENDİ

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFunctions _functions = FirebaseFunctions.instance;
  final DeviceInfoPlugin _deviceInfo = DeviceInfoPlugin(); // <--- YENİ

  // Kullanıcı oturum durumunu dinleyen stream
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Mevcut kullanıcıyı getir
  User? get currentUser => _auth.currentUser;

  // --- YARDIMCI FONKSİYON: CİHAZ ID ALMA ---
  Future<String?> _getDeviceId() async {
    try {
      if (Platform.isAndroid) {
        final androidInfo = await _deviceInfo.androidInfo;
        return androidInfo.id; // Android ID
      } else if (Platform.isIOS) {
        final iosInfo = await _deviceInfo.iosInfo;
        return iosInfo.identifierForVendor; // iOS ID
      }
    } catch (e) {
      print("Cihaz ID alma hatası: $e");
    }
    return null;
  }
  // ----------------------------------------

  // E-posta/Şifre ile Kayıt Ol (GÜNCELLENDİ)
  Future<String?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String username,
    String? referralCode,
  }) async {
    try {
      // 1. Cihaz ID'sini al
      final deviceId = await _getDeviceId();

      // 2. Cloud Function'ı çağır (deviceId ile birlikte)
      final callable = _functions.httpsCallable('registerNewUser');
      
      // Cloud Function zaten Auth kullanıcısını oluşturuyor,
      // biz sadece sonucunu bekliyoruz.
      await callable.call(<String, dynamic>{
        'email': email,
        'password': password,
        'username': username,
        'referralCode': referralCode,
        'deviceId': deviceId, // <--- KRİTİK EKLEME
      });

      // 3. Otomatik giriş yap (Kullanıcı oluştuğu için)
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      return null; // Başarılı
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on FirebaseFunctionsException catch (e) {
      return e.message; // Cloud Function'dan gelen özel hata (örn: Cihaz kilitli)
    } catch (e) {
      return e.toString();
    }
  }

  // E-posta/Şifre ile Giriş Yap (Değişiklik Yok - Girişte kontrol etmiyoruz)
  Future<String?> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Google ile Giriş Yap (GÜNCELLENDİ)
  Future<String?> signInWithGoogle({String? referralCode}) async {
    try {
      // 1. Google Sign-In işlemini başlat
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return "Google sign in aborted";

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // 2. Firebase'e giriş yap
      await _auth.signInWithCredential(credential);

      // 3. Cihaz ID'sini al
      final deviceId = await _getDeviceId();

      // 4. Backend'e haber ver (Kayıt veya Giriş işlemini tamamlasın)
      final callable = _functions.httpsCallable('handleGoogleSignIn');
      await callable.call(<String, dynamic>{
        'referralCode': referralCode,
        'deviceId': deviceId, // <--- KRİTİK EKLEME
      });

      return null; // Başarılı
    } on FirebaseAuthException catch (e) {
      return e.message;
    } on FirebaseFunctionsException catch (e) {
      // Hile hatası gelirse (device-locked), kullanıcıyı çıkış yaptır
      await signOut(); 
      return e.message;
    } catch (e) {
      await signOut();
      return e.toString();
    }
  }

  // Çıkış Yap
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  // Şifre Sıfırlama
  Future<String?> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // Hesabı Sil
  Future<String?> deleteUserAccount() async {
    try {
      final callable = _functions.httpsCallable('deleteUserAccount');
      await callable.call();
      
      // Auth tarafında çıkış yapmaya gerek yok, deleteUserAccount hem veriyi hem auth kaydını siliyor.
      // Ama uygulama tarafında state'i temizlemek için signOut çağırabiliriz.
      await _googleSignIn.signOut();
      await _auth.signOut();
      
      return null;
    } on FirebaseFunctionsException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }
}