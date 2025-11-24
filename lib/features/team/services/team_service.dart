// lib/features/team/services/team_service.dart (TAMAMI DÜZELTİLDİ)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:on_network/features/team/models/team_member_model.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/foundation.dart'; // Hata ayıklama için eklendi

class TeamService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFunctions _functions = FirebaseFunctions.instance;

  // --- Fonksiyon 1: getTeamMembersStream (Mevcut kodunuz, dokunulmadı) ---
  Stream<List<TeamMember>> getTeamMembersStream() {
    User? currentUser = _auth.currentUser;
    if (currentUser == null) {
      return Stream.value([]); // Boş bir stream döndür, provider bunu yönetecek
    }

    try {
      // Doğrudan cache alt koleksiyonunu .get() YERİNE .snapshots() ile DİNLE
      final cacheStream = _firestore
          .collection('users')
          .doc(currentUser.uid)
          .collection('team_members_cache')
          .snapshots(); // <-- KRİTİK DEĞİŞİKLİK

      // Gelen QuerySnapshot stream'ini List<TeamMember> stream'ine dönüştür
      return cacheStream.map((cacheSnapshot) {
        if (cacheSnapshot.docs.isEmpty) {
          return <TeamMember>[]; // Boş liste
        }

        // Gelen veriyi List<TeamMember> modeline dönüştür
        List<TeamMember> team = cacheSnapshot.docs.map((doc) {
          final data = doc.data(); // Bu artık cache dökümanı

          // Modelin beklediği veriyi cache'den doldur
          return TeamMember(
            uid: doc.id,
            username: data['username'] ?? '...',
            profileImageUrl: data['profileImageUrl'], // null olabilir
            handle: data['handle'] ?? '@...', // Cache'den geliyor olmalı
            isActive: data['is_active'] ?? false, // Cache'den geliyor (VE ARTIK CANLI GÜNCELLENİYOR)
            contribution: 0.25, // Bu hala OK, list_item'da dinamik hesaplanıyor
          );
        }).toList();

        return team;
      });
    } catch (e) {
      // Hata ayıklama için konsola yazdır
      debugPrint("getTeamMembersStream (Stream) Hata: $e");
      return Stream.value([]); // Hata durumunda boş liste stream'i döndür
    }
  }

  // --- Fonksiyon 2: remindMember (Mevcut kodunuz, dokunulmadı) ---
  Future<String?> remindMember(String targetUserId) async {
    try {
      final HttpsCallable callable =
      _functions.httpsCallable('sendReminderNotification');
      await callable.call(<String, dynamic>{
        'targetUserId': targetUserId,
      });
      return null; // Başarılı
    } on FirebaseFunctionsException catch (e) {
      return e.message ?? "An error occurred.";
    } catch (e) {
      return "An unexpected error occurred.";
    }
  }

  // --- YENİ FONKSİYON (DÜZELTİLDİ: Artık class'ın içinde) ---
  Future<String?> reportUser(String targetUserId, String reason) async {
    try {
      final HttpsCallable callable =
      _functions.httpsCallable('reportUser');

      // --- DÜZELTME BURADA ---
      await callable.call(<String, dynamic>{
        'reportedUserId': targetUserId, // 'targetUserId' -> 'reportedUserId' olarak değiştirildi
        'reason': reason,
      });
      // --- DÜZELTME BİTTİ ---

      return null; // Başarılı
    } on FirebaseFunctionsException catch (e) {
      return e.message ?? "An error occurred.";
    } catch (e) {
      return "An unexpected error occurred.";
    }
  }
// --- YENİ FONKSİYON BİTTİ ---

} // <-- TeamService Class'ının kapanış parantezi