// lib/features/home/services/stats_service.dart

import 'package:cloud_firestore/cloud_firestore.dart';

class StatsService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Toplam kullanıcı sayısını dinler.
  Stream<DocumentSnapshot<Map<String, dynamic>>> getUserCounterStream() {
    return _firestore.collection('app_stats').doc('user_counter').snapshots();
  }

  // Toplam kazılmış ON miktarını dinler. (YENİ EKLENDİ)
  Stream<DocumentSnapshot<Map<String, dynamic>>> getGlobalCounterStream() {
    return _firestore.collection('app_stats').doc('global_counter').snapshots();
  }
}