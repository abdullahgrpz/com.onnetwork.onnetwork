// lib/features/home/providers/home_providers.dart (Canlı Sayaç Güncellendi)

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/features/home/services/stats_service.dart';
import 'package:on_network/features/home/services/user_service.dart';
import 'package:on_network/features/team/models/team_member_model.dart';
import 'package:on_network/features/team/services/team_service.dart';
import 'package:on_network/core/services/storage_service.dart';
import 'dart:async';



// Servis provider'ları
final userServiceProvider = Provider((ref) => UserService());
final statsServiceProvider = Provider((ref) => StatsService());
final teamServiceProvider = Provider((ref) => TeamService());
final storageServiceProvider = Provider((ref) => StorageService());

// Veri stream provider'ları
final userDataStreamProvider = StreamProvider.autoDispose<DocumentSnapshot>((ref) {
  final userService = ref.watch(userServiceProvider);
  // Kullanıcı çıkış yaptığında null dönebilir, bu durumu ele alalım.
  final stream = userService.getUserDataStream();
  if (stream == null) {
    // Kullanıcı yoksa veya bir hata oluştuysa boş bir stream döndür
    // veya uygun bir hata yönetimi yap. Şimdilik boş stream.
    print("userDataStreamProvider: Kullanıcı girişi yapılmamış veya stream alınamadı.");
    return Stream.value(
        _EmptyDocumentSnapshot() // Boş bir snapshot döndürerek null hatasını önle
    );
  }
  return stream;
});
final globalCounterStreamProvider = StreamProvider.autoDispose<DocumentSnapshot>((ref) {
  final statsService = ref.watch(statsServiceProvider);
  return statsService.getGlobalCounterStream();
});
final userCounterStreamProvider = StreamProvider.autoDispose<DocumentSnapshot>((ref) {
  final statsService = ref.watch(statsServiceProvider);
  return statsService.getUserCounterStream();
});
final teamMembersProvider = StreamProvider.autoDispose<List<TeamMember>>((ref) {
  final teamService = ref.watch(teamServiceProvider);
  // getTeamMembers() yerine getTeamMembersStream() çağır
  return teamService.getTeamMembersStream();
});


// Geri sayım provider'ı ve Notifier'ı
final countdownProvider = StateNotifierProvider.autoDispose<CountdownNotifier, Duration>((ref) {
  final asyncUserData = ref.watch(userDataStreamProvider);
  DateTime? endTime;
  // .asData ile null kontrolü yaparak kullanmak daha güvenli
  final data = asyncUserData.asData?.value.data() as Map<String, dynamic>?;
  if (data != null) {
    final lastActivationTimestamp = data['last_activation_time'] as Timestamp?;
    if (lastActivationTimestamp != null) {
      final activationTime = lastActivationTimestamp.toDate();
      final deadline = activationTime.add(const Duration(hours: 24));
      // Güvenlik: Eğer 'now' deadline'dan sonraysa endTime null kalmalı
      if (DateTime.now().isBefore(deadline)) {
        endTime = deadline;
      }
    }
  }
  return CountdownNotifier(endTime);
});

class CountdownNotifier extends StateNotifier<Duration> {
  Timer? _timer;
  final DateTime? _endTime;

  CountdownNotifier(this._endTime) : super(Duration.zero) {
    _startTimer();
  }

  void _startTimer() {
    _timer?.cancel(); // Önceki timer'ı iptal et
    if (_endTime == null) {
      state = Duration.zero; // Bitiş zamanı yoksa sıfırla
      return;
    }

    // Başlangıç durumunu ayarla
    final now = DateTime.now();
    if (now.isBefore(_endTime!)) {
      state = _endTime!.difference(now);
    } else {
      state = Duration.zero;
      return; // Süre dolmuşsa timer başlatma
    }

    // Periyodik timer'ı başlat
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      final currentNow = DateTime.now();
      if (currentNow.isBefore(_endTime!)) {
        state = _endTime!.difference(currentNow);
      } else {
        state = Duration.zero;
        timer.cancel(); // Süre dolunca timer'ı durdur
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}


// === CANLI KAZANÇ SAYACI PROVIDER'I (YAKLAŞIM C - MALİYETSİZ DİNAMİK) ===

final liveMiningTimerProvider = StateNotifierProvider.autoDispose<LiveMiningTimerNotifier, double>((ref) {
  // userDataStreamProvider'ın mevcut durumunu İZLE (watch)
  final asyncUserData = ref.watch(userDataStreamProvider);
  // Notifier'a sadece mevcut veriyi (veya null) constructor'da ver.
  return LiveMiningTimerNotifier(asyncUserData.asData?.value);
});

// Canlı kazanç sayacını yöneten GÜNCELLENMİŞ sınıf
class LiveMiningTimerNotifier extends StateNotifier<double> {
  Timer? _timer;
  final DocumentSnapshot? _initialUserData; // Notifier oluşturulduğundaki veri
  DateTime? _sessionStartTime;
  Map<String, dynamic>? _userDataMap; // Veriyi map olarak sakla

  LiveMiningTimerNotifier(this._initialUserData) : super(0.0) {
    if (_initialUserData != null && _initialUserData!.exists) {
      // Veriyi map'e çevir ve timer'ı başlat
      _userDataMap = _initialUserData!.data() as Map<String, dynamic>?;
      _configureTimer(_userDataMap);
    } else {
      // Veri yoksa veya boşsa, state 0 kalır, timer başlamaz.
      print("LiveMiningTimerNotifier: Başlangıç verisi alınamadı.");
    }
  }

  // Timer'ı ve state'i temizleyen fonksiyon
  void _stopAndResetTimer() {
    _timer?.cancel();
    _timer = null;
    // State'i sadece sıfır değilse sıfırla (gereksiz rebuild önler)
    if (state != 0.0) {
      state = 0.0;
    }
    _sessionStartTime = null;
    _userDataMap = null; // Map'i de temizle
  }

  // Gelen kullanıcı verisine göre timer'ı yapılandıran fonksiyon
  void _configureTimer(Map<String, dynamic>? data) {
    _stopAndResetTimer(); // Her zaman önce durdur ve sıfırla

    if (data == null) {
      print("LiveMiningTimerNotifier: Configure için veri alınamadı.");
      return;
    }

    try {
      final bool isActive = data['is_active'] ?? false;
      final Timestamp? lastActivationTimestamp = data['last_activation_time'];

      // Sadece aktifse ve başlama zamanı varsa devam et
      if (isActive && lastActivationTimestamp != null) {
        _sessionStartTime = lastActivationTimestamp.toDate();
        final deadline = _sessionStartTime!.add(const Duration(hours: 24));
        final now = DateTime.now();

        // Eğer süre zaten dolmuşsa başlatma
        if (now.isAfter(deadline)) {
          print("LiveMiningTimerNotifier: Oturum süresi zaten dolmuş.");
          return;
        }

        // Timer'ı başlat (daha sık çalışabilir, örn: 100ms)
        _timer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
          final currentNow = DateTime.now();

          // Süre dolduysa veya bu Notifier dispose edildiyse durdur
          if (currentNow.isAfter(deadline)) {
            _stopAndResetTimer();
            return;
          }

          // Geçen süreyi hesapla (başlangıçtan şu ana kadar)
          final elapsedMilliseconds = currentNow.difference(_sessionStartTime!).inMilliseconds;
          if (elapsedMilliseconds < 0) return; // Negatif süre olamaz

          // O AN GEÇERLİ OLMASI GEREKEN hızı hesapla
          final currentEffectiveRatePerHour = _calculateCurrentEffectiveRate(data, currentNow);
          if (currentEffectiveRatePerHour <= 0) {
            // Eğer hız sıfırsa (örn. boost bitti ve base rate 0 ise), sayacı sıfırla
            if (state != 0.0) state = 0.0;
            return;
          }
          final double effectiveRatePerMillisecond = currentEffectiveRatePerHour / 3600000.0;

          // Birikmiş kazancı GÜNCEL hızla ve geçen süreyle hesapla
          final newAmount = elapsedMilliseconds * effectiveRatePerMillisecond;

          // State'i sadece anlamlı bir değişiklik varsa güncelle (performans için)
          // Küçük ondalık farkları için sürekli rebuild tetiklememek adına bir eşik değeri
          const double threshold = 0.000001;
          if ((state - newAmount).abs() > threshold) {
            state = newAmount;
          }
        });
      } else {
        print("LiveMiningTimerNotifier: Kullanıcı aktif değil veya başlama zamanı yok.");
      }
    } catch (e) {
      print("LiveMiningTimerNotifier hata: $e");
      _stopAndResetTimer(); // Hata durumunda sıfırla
    }
  }

  // Verilen veri ve **O ANKİ ZAMANA GÖRE** anlık efektif hızı hesaplayan fonksiyon
  double _calculateCurrentEffectiveRate(Map<String, dynamic> data, DateTime now) {
    final double baseRate = (data['base_mining_rate'] as num?)?.toDouble() ?? 0.0;
    // Takım bonusu Firestore'dan okunuyor, burada tekrar hesaplamaya gerek yok.
    final double bonusRate = (data['active_team_bonus_rate'] as num?)?.toDouble() ?? 0.0;
    double effectiveRatePerHour = baseRate + bonusRate;

    // 1. Starter Boost'u kontrol et
    final bool isOnStarterBoost = data['is_on_starter_boost'] ?? false;
    final Timestamp? starterBoostExpires = data['starter_boost_expires'];
    bool starterBoostActiveNow = false;
    if (isOnStarterBoost && starterBoostExpires != null && now.isBefore(starterBoostExpires.toDate())) {
      starterBoostActiveNow = true;
      effectiveRatePerHour *= 2.0; // 2X Hız
    }

    // 2. Eğer Starter Boost aktif DEĞİLSE, Ad Boost'u kontrol et
    if (!starterBoostActiveNow) {
      final Timestamp? adBoostExpiry = data['adBoostExpiryTime'];
      if (adBoostExpiry != null && now.isBefore(adBoostExpiry.toDate())) {
        effectiveRatePerHour *= 1.5; // 1.5X Hız
      }
    }

    // Negatif hız döndürmediğimizden emin olalım
    return effectiveRatePerHour < 0 ? 0 : effectiveRatePerHour;
  }


  @override
  void dispose() {
    print("LiveMiningTimerNotifier dispose ediliyor."); // Test için log
    _timer?.cancel();
    super.dispose();
  }
}

// === DİĞER YARDIMCI FONKSİYONLAR ===

// Süreyi formatlamak için yardımcı fonksiyon
String formatDuration(Duration duration) {
  if (duration.isNegative) return "00:00:00";
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(duration.inHours);
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));
  return "$hours:$minutes:$seconds";
}

// Sonraki yarılanma bilgisini hesaplayan fonksiyon
Map<String, dynamic> getNextHalvingInfo(int totalUsers) {
  int nextMilestone;
  double rateAtTarget;

  if (totalUsers < 10000) { nextMilestone = 10000; rateAtTarget = 0.95; }
  else if (totalUsers < 20000) { nextMilestone = 20000; rateAtTarget = 0.90; }
  else if (totalUsers < 30000) { nextMilestone = 30000; rateAtTarget = 0.85; }
  else if (totalUsers < 40000) { nextMilestone = 40000; rateAtTarget = 0.80; }
  else if (totalUsers < 50000) { nextMilestone = 50000; rateAtTarget = 0.75; }
  else if (totalUsers < 60000) { nextMilestone = 60000; rateAtTarget = 0.70; }
  else if (totalUsers < 70000) { nextMilestone = 70000; rateAtTarget = 0.65; }
  else if (totalUsers < 80000) { nextMilestone = 80000; rateAtTarget = 0.60; }
  else if (totalUsers < 90000) { nextMilestone = 90000; rateAtTarget = 0.55; }
  else if (totalUsers < 100000) { nextMilestone = 100000; rateAtTarget = 0.45; }
  else if (totalUsers < 200000) { nextMilestone = 200000; rateAtTarget = 0.40; }
  else if (totalUsers < 300000) { nextMilestone = 300000; rateAtTarget = 0.34; }
  else if (totalUsers < 400000) { nextMilestone = 400000; rateAtTarget = 0.28; }
  else if (totalUsers < 500000) { nextMilestone = 500000; rateAtTarget = 0.21; }
  else if (totalUsers < 600000) { nextMilestone = 600000; rateAtTarget = 0.15; }
  else if (totalUsers < 700000) { nextMilestone = 700000; rateAtTarget = 0.10; }
  else if (totalUsers < 800000) { nextMilestone = 800000; rateAtTarget = 0.06; }
  else if (totalUsers < 900000) { nextMilestone = 900000; rateAtTarget = 0.03; }
  else if (totalUsers < 1000000) { nextMilestone = 1000000; rateAtTarget = 0.01; }
  else if (totalUsers < 2000000) { nextMilestone = 2000000; rateAtTarget = 0.005; }
  else { nextMilestone = -1; rateAtTarget = 0.005; }

  String targetDisplay;
  if (nextMilestone == -1) {
    targetDisplay = "Final Rate Reached";
  } else if (nextMilestone >= 1000000) {
    targetDisplay = "${(nextMilestone / 1000000).toStringAsFixed(0)}M Pioneers";
  } else if (nextMilestone >= 1000) {
    targetDisplay = "${(nextMilestone / 1000).toStringAsFixed(0)}k Pioneers";
  } else {
    targetDisplay = "$nextMilestone Pioneers";
  }

  return {
    'targetCount': nextMilestone,
    'targetDisplay': targetDisplay,
    'rateAtTarget': rateAtTarget
  };
}
// Mainnet Geri Sayım Provider'ı
final mainnetLaunchDate = DateTime.utc(2026, 12, 31, 23, 59, 59);

// --- DÜZELTME BURADA ---
// '.autoDispose' kelimesi kaldırıldı.
final mainnetCountdownProvider = StreamProvider<Duration>((ref) {
// --- DÜZELTME BİTTİ ---
  return Stream.periodic(const Duration(seconds: 1), (computationCount) {
    final now = DateTime.now().toUtc();
    final remaining = mainnetLaunchDate.difference(now);
    return remaining.isNegative ? Duration.zero : remaining;
  });
});

// Kalan süreyi formatlayan yardımcı fonksiyon
String formatMainnetCountdown(Duration duration) {
  if (duration.isNegative || duration.inSeconds == 0) {
    return "LAUNCHED!";
  }

  final days = duration.inDays;
  final hours = duration.inHours.remainder(24);
  final minutes = duration.inMinutes.remainder(60);

  if (days > 0) {
    return "$days Days";
  } else {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    return "${twoDigits(hours)}:${twoDigits(minutes)}";
  }
}

// Boş DocumentSnapshot sınıfı (null hatalarını önlemek için)
class _EmptyDocumentSnapshot implements DocumentSnapshot {
  @override
  dynamic get(Object field) => null;
  @override
  String get id => '';
  @override
  SnapshotMetadata get metadata => _EmptySnapshotMetadata();
  @override
  DocumentReference<Object?> get reference => throw UnimplementedError();
  @override
  Map<String, dynamic>? data() => null;
  @override
  bool get exists => false;
  @override
  dynamic operator [](Object field) => null;
}
class _EmptySnapshotMetadata implements SnapshotMetadata {
  @override
  bool get hasPendingWrites => false;
  @override
  bool get isFromCache => true;
}