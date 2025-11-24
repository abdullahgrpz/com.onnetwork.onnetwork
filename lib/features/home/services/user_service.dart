// lib/features/home/services/user_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_functions/cloud_functions.dart';

class UserService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>>? getUserDataStream() {
    User? user = _auth.currentUser;
    if (user == null) return null;
    return _firestore.collection('users').doc(user.uid).snapshots();
  }

  Future<String?> activateMining() async {
    try {
      final HttpsCallable callable = _functions.httpsCallable('activateMining');
      await callable.call();
      return null;
    } on FirebaseFunctionsException catch (e) {
      return e.message ?? "An unknown error occurred.";
    } catch (e) {
      return "An unexpected error occurred. Please try again.";
    }
  }

  // --- YENİ FONKSİYONU AŞAĞIYA EKLEYİN ---
  Future<void> updateNotificationSettings(Map<String, bool> settings) async {
    User? user = _auth.currentUser;
    if (user == null) {
      throw Exception("User not logged in.");
    }
    try {
      // Ayarları 'notification_settings' adında bir harita (map)
      // olarak Firestore'a yazıyoruz.
      await _firestore.collection('users').doc(user.uid).set(
        {
          'notification_settings': settings,
        },
        SetOptions(merge: true), // Diğer verileri ezmemesi için merge:true
      );
    } catch (e) {
      print("Error updating settings: $e");
      // Hatayı UI'ın yakalaması için yeniden fırlat
      rethrow;
    }
  }
// --- YENİ FONKSİYON BİTTİ ---
}