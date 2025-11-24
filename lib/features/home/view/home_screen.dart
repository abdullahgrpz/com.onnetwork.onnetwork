// lib/features/home/view/home_screen.dart (LOKALİZASYON TAMAMLANDI - HATA DÜZELTİLDİ)

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:on_network/core/providers/localization_provider.dart';
import 'package:on_network/core/widgets/skeletons/home_screen_skeleton.dart';
import 'package:on_network/features/home/providers/home_providers.dart';
import 'package:on_network/features/home/widgets/activate_button.dart';
import 'package:on_network/features/home/widgets/countdown_timer.dart';
import 'package:on_network/features/home/widgets/stats_card.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_network/core/services/ad_service.dart';
import 'package:on_network/features/home/widgets/honeycomb_background.dart';
import 'package:on_network/navigation_shell.dart';
import 'package:on_network/core/widgets/skeletons/skeleton_box.dart';

// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool _isShowingAd = false;
  bool _isActivating = false;

  // Kazanma oturumunu aktive etme fonksiyonu
  Future<void> _handleActivation() async {
    // YENİ: l10n nesnesini al (snackbar için)
    final l10n = AppLocalizations.of(context)!;

    setState(() {
      _isActivating = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // GÜNCELLENDİ: Metin l10n'den geliyor
        content: Text(l10n.homeActivateSnackbar),
        duration: const Duration(seconds: 2)));

    String? error;
    try {
      error = await ref.read(userServiceProvider).activateMining();
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() {
          _isActivating = false;
        });
      }
    }

    if (mounted) {
      if (error == null) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          // GÜNCELLENDİ: Metin l10n'den geliyor
          content: Text(l10n.homeActivatedSnackbar),
          backgroundColor: Colors.green,
          duration: const Duration(seconds: 3),
        ));
        ref.invalidate(teamMembersProvider);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(error),
          backgroundColor: Colors.red,
          duration: const Duration(seconds: 3),
        ));
      }
    }
  }

  // Bilgi diyaloglarını gösteren fonksiyon
  // GÜNCELLENDİ: l10n nesnesini alıyor
  void _showInfoDialog(BuildContext context, String title, String content) {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        title: Text(title, style: const TextStyle(color: Color(0xFF00D1FF))),
        content: Text(content, style: const TextStyle(color: Colors.white)),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            // GÜNCELLENDİ: Metin l10n'den geliyor
            child: Text(l10n.homeDialogOK, style: const TextStyle(color: Color(0xFF00D1FF))),
          ),
        ],
      ),
    );
  }

  // Yarılanma bilgisini gösteren diyalog
  // GÜNCELLENDİ: l10n nesnesini alıyor
  void _showHalvingInfoDialog(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    // GÜNCELLENDİ: Hard-coded metin l10n'den geliyor
    final String halvingInfo = l10n.homeStatsNextHalvingInfo;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).cardColor,
        // GÜNCELLENDİ: Metin l10n'den geliyor
        title: Text(l10n.homeStatsNextHalvingInfoTitle,
            style: const TextStyle(color: Color(0xFF00D1FF))),
        content: SingleChildScrollView(
          child: Text(halvingInfo,
              style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            // GÜNCELLENDİ: Metin l10n'den geliyor
            child: Text(l10n.homeDialogOK, style: const TextStyle(color: Color(0xFF00D1FF))),
          ),
        ],
      ),
    );
  }

  // Kompakt istatistik kartı
  Widget _buildCompactStat({
    required BuildContext context,
    required String title,
    required String value,
    String? subtitle,
    required double progress,
    Color? progressColor,
    VoidCallback? onInfoTap,
  }) {
    // Bu widget'da değişiklik yok, metinleri zaten parametre olarak alıyor
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(color: Colors.white70, fontSize: 10),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (onInfoTap != null)
                InkWell(
                  onTap: onInfoTap,
                  borderRadius: BorderRadius.circular(8),
                  child:
                  const Icon(Icons.info_outline, size: 14, color: Colors.white54),
                ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 2),
            Text(
              subtitle,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.6), fontSize: 10, fontWeight: FontWeight.bold),
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 4),
          ] else ...[
            const SizedBox(height: 8),
          ],
          LinearProgressIndicator(
            value: progress.clamp(0.0, 1.0),
            backgroundColor: Theme.of(context).cardColor.withOpacity(0.6),
            valueColor: AlwaysStoppedAnimation<Color>(
                progressColor ?? Theme.of(context).primaryColor),
            minHeight: 3,
            borderRadius: BorderRadius.circular(2),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini en üste al
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0D0D2E),
      body: SafeArea(
        child: Consumer(
          builder: (context, ref, child) {
            final asyncUserData = ref.watch(userDataStreamProvider);
            final asyncGlobalCounter = ref.watch(globalCounterStreamProvider);
            final asyncUserCounter = ref.watch(userCounterStreamProvider);
            final asyncTeamMembers = ref.watch(teamMembersProvider);

            final bool isLoading = (asyncUserData.isLoading ||
                asyncGlobalCounter.isLoading ||
                asyncUserCounter.isLoading ||
                asyncTeamMembers.isLoading) &&
                !(asyncUserData.hasValue ||
                    asyncUserData.hasError);
            if (isLoading) {
              return const HomeScreenSkeleton();
            }

            final bool hasError = asyncUserData.hasError ||
                asyncGlobalCounter.hasError ||
                asyncUserCounter.hasError ||
                asyncTeamMembers.hasError;
            if (hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    // GÜNCELLENDİ: Hata metni l10n'den geliyor (ve değişken alıyor)
                    l10n.homeErrorLoading(
                        (asyncUserData.error ?? asyncGlobalCounter.error ?? asyncUserCounter.error ?? asyncTeamMembers.error ?? 'Unknown error').toString() // .toString() eklenmeli
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.red),
                  ),
                ),
              );
            }
            return child!;
          },

          child: Stack(
            children: [
              const HoneycombBackground(),
              Padding(
                padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 1. Üst Bar
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.power_settings_new_sharp,
                                  color: Color(0xFF00D1FF), size: 28),
                              const SizedBox(width: 8),
                              Text(
                                  l10n.homeScreenTitle,
                                  style: const TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                            ],
                          ),
                          // --- DİL MENÜSÜ VE PROFİL (GÜNCELLENDİ) ---
                          Row(
                            children: [
                              Consumer( // Consumer içine aldık
                                builder: (context, ref, child) {
                                  final currentLocale = ref.watch(localeProvider);
                                  return PopupMenuButton<Locale?>(
                                    // İSTEK 2: İKON DEĞİŞTİ
                                    icon: const Icon(FontAwesomeIcons.globe, color: Colors.white, size: 22),
                                    onSelected: (Locale? locale) {
                                      ref.read(localeProvider.notifier).state = locale;
                                    },
                                    // GÜNCELLENDİ: Tüm diller ve Tik İşareti (CheckedPopupMenuItem)
                                    itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale?>>[
                                      CheckedPopupMenuItem<Locale?>(
                                        value: null,
                                        // İSTEK 1: TİK İŞARETİ KONTROLÜ
                                        checked: currentLocale == null,
                                        child: Text(l10n.navHome == "Home" ? "System Default" : "Sistem Dili"), // Basit bir yerelleştirme
                                      ),
                                      const PopupMenuDivider(),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('en'),
                                        checked: currentLocale?.languageCode == 'en',
                                        child: Text(l10n.homeLangEnglish),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('tr'),
                                        checked: currentLocale?.languageCode == 'tr',
                                        child: Text(l10n.homeLangTurkish),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('id'),
                                        checked: currentLocale?.languageCode == 'id',
                                        child: Text(l10n.homeLangIndonesian),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('vi'),
                                        checked: currentLocale?.languageCode == 'vi',
                                        child: Text(l10n.homeLangVietnamese),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('es'),
                                        checked: currentLocale?.languageCode == 'es',
                                        child: Text(l10n.homeLangSpanish),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('hi'),
                                        checked: currentLocale?.languageCode == 'hi',
                                        child: Text(l10n.homeLangHindi),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('pt'),
                                        checked: currentLocale?.languageCode == 'pt',
                                        child: Text(l10n.homeLangPortuguese),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('ar'),
                                        checked: currentLocale?.languageCode == 'ar',
                                        child: Text(l10n.homeLangArabic),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('ru'),
                                        checked: currentLocale?.languageCode == 'ru',
                                        child: Text(l10n.homeLangRussian),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('de'),
                                        checked: currentLocale?.languageCode == 'de',
                                        child: Text(l10n.homeLangGerman),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('fr'),
                                        checked: currentLocale?.languageCode == 'fr',
                                        child: Text(l10n.homeLangFrench),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('ja'),
                                        checked: currentLocale?.languageCode == 'ja',
                                        child: Text(l10n.homeLangJapanese),
                                      ),
                                      CheckedPopupMenuItem<Locale?>(
                                        value: const Locale('ko'),
                                        checked: currentLocale?.languageCode == 'ko',
                                        child: Text(l10n.homeLangKorean),
                                      ),
                                    ],
                                  );
                                },
                              ),
                              const SizedBox(width: 4),
                              Consumer(
                                builder: (context, ref, child) {
                                  final profileImageUrl = ref.watch(
                                      userDataStreamProvider.select((asyncData) =>
                                      (asyncData.value?.data() as Map<String,
                                          dynamic>?)?['profileImageUrl']
                                      as String?));

                                  return GestureDetector(
                                    onTap: () {
                                      ref
                                          .read(navigationShellIndexProvider.notifier)
                                          .state = 3;
                                    },
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: Theme.of(context).cardColor,
                                      backgroundImage: profileImageUrl != null
                                          ? NetworkImage(profileImageUrl)
                                          : null,
                                      child: profileImageUrl == null
                                          ? const Icon(Icons.person,
                                          size: 20, color: Color(0xFF00D1FF))
                                          : null,
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // 2. İstatistik Kartları (Base Rate ve Effective Rate)
                      Consumer(
                        builder: (context, ref, child) {
                          final asyncUserData = ref.watch(userDataStreamProvider);
                          final asyncTeamMembers = ref.watch(teamMembersProvider);
                          final userData = (asyncUserData.value?.data()
                          as Map<String, dynamic>?) ??
                              {};
                          final teamMembers = asyncTeamMembers.value ?? [];

                          final baseMiningRate =
                              (userData['base_mining_rate'] as num?)?.toDouble() ??
                                  0.0;
                          final activeMembersCount =
                              teamMembers.where((m) => m.isActive).length;
                          final double currentBonusPercentage =
                              (userData['current_bonus_percentage'] as num?)
                                  ?.toDouble() ??
                                  0.25;
                          final teamBonusRate = activeMembersCount *
                              currentBonusPercentage *
                              baseMiningRate;
                          final effectiveMiningRate =
                              baseMiningRate + teamBonusRate;

                          final bool isOnStarterBoost =
                              userData['is_on_starter_boost'] ?? false;
                          final Timestamp? starterBoostExpires =
                          userData['starter_boost_expires'];
                          bool isStarterBoostCurrentlyActive = false;
                          if (isOnStarterBoost &&
                              starterBoostExpires != null &&
                              DateTime.now()
                                  .isBefore(starterBoostExpires.toDate())) {
                            isStarterBoostCurrentlyActive = true;
                          }
                          final Timestamp? adBoostExpiryTime =
                          userData['adBoostExpiryTime'];
                          bool isAdBoostCurrentlyActive = false;
                          if (adBoostExpiryTime != null &&
                              DateTime.now()
                                  .isBefore(adBoostExpiryTime.toDate())) {
                            isAdBoostCurrentlyActive = true;
                          }

                          return Row(
                            children: [
                              Expanded(
                                child: StatsCard(
                                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                                  title: l10n.homeStatsBaseRate,
                                  value:
                                  '${baseMiningRate.toStringAsFixed(2)} ON/hr',
                                  subtitle: l10n.homeStatsBaseRateSubtitle,
                                  progress: baseMiningRate > 0 ? 1 : 0,
                                  progressColor: const Color(0xFF00D1FF),
                                  onInfoTap: () => _showInfoDialog(
                                    context,
                                    l10n.homeStatsBaseRateInfoTitle,
                                    l10n.homeStatsBaseRateInfo,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: StatsCard(
                                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                                  title: l10n.homeStatsEffectiveRate +
                                      (isStarterBoostCurrentlyActive
                                          ? l10n.homeStatsEffectiveRateBoost2x
                                          : (isAdBoostCurrentlyActive
                                          ? l10n.homeStatsEffectiveRateBoost1_5x
                                          : '')),
                                  value:
                                  '${effectiveMiningRate.toStringAsFixed(2)} ON/hr',
                                  // GÜNCELLENDİ: Dinamik alt yazı metni l10n'den geliyor
                                  subtitle: l10n.homeStatsEffectiveRateSubtitle(
                                      teamBonusRate.toStringAsFixed(2),
                                      (currentBonusPercentage * 100).toStringAsFixed(0)
                                  ),
                                  progress: effectiveMiningRate > 0 ? 1 : 0,
                                  progressColor: isStarterBoostCurrentlyActive
                                      ? Colors.deepPurpleAccent
                                      : (isAdBoostCurrentlyActive
                                      ? Colors.amber.shade700
                                      : (effectiveMiningRate >
                                      baseMiningRate
                                      ? Colors.green
                                      : const Color(0xFF00D1FF))),
                                  onInfoTap: () => _showInfoDialog(
                                    context,
                                    // GÜNCELLENDİ: Metinler l10n'den geliyor
                                    l10n.homeStatsEffectiveRateInfoTitle,
                                    l10n.homeStatsEffectiveRateInfo +
                                        (isStarterBoostCurrentlyActive
                                            ? l10n.homeStatsEffectiveRateInfoStarterBoost
                                            : '') +
                                        (isAdBoostCurrentlyActive
                                            ? l10n.homeStatsEffectiveRateInfoAdBoost
                                            : ''),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      const SizedBox(height: 10),

                      // 3. Kompakt İstatistik Kartları (Global, Halving, Mainnet)
                      Consumer(
                        builder: (context, ref, child) {
                          final asyncGlobalCounter =
                          ref.watch(globalCounterStreamProvider);
                          final asyncUserCounter =
                          ref.watch(userCounterStreamProvider);
                          final asyncMainnetCountdown =
                          ref.watch(mainnetCountdownProvider);

                          final globalCounterData =
                              (asyncGlobalCounter.value?.data()
                              as Map<String, dynamic>?) ??
                                  {};
                          final userCounterData = (asyncUserCounter.value
                              ?.data() as Map<String, dynamic>?) ??
                              {};
                          final totalUsers =
                              userCounterData['total_users'] as int? ?? 0;
                          final totalONMined =
                              (globalCounterData['total_on_mined'] as num?)
                                  ?.toDouble() ??
                                  0.0;
                          final totalActiveMiners =
                              globalCounterData['total_active_miners'] as int? ?? 0;
                          final halvingInfo = getNextHalvingInfo(totalUsers);
                          final nextMilestoneTarget =
                          halvingInfo['targetCount'] as int;
                          final nextMilestoneDisplay =
                          halvingInfo['targetDisplay'] as String;

                          // GÜNCELLENDİ: Yerel ayarı kullanarak sayı formatla
                          final compactFormat = NumberFormat.compact(
                            locale: Localizations.localeOf(context).languageCode,
                          );

                          return Row(
                            children: [
                              Expanded(
                                child: _buildCompactStat(
                                  context: context,
                                  // GÜNCELLENDİ: Metin l10n'den geliyor
                                  title: l10n.homeStatsGlobalMined,
                                  value: compactFormat.format(totalONMined),
                                  progress: (totalONMined / 1000000000.0)
                                      .clamp(0.0, 1.0),
                                  progressColor:
                                  Theme.of(context).primaryColor,
                                  onInfoTap: () => _showInfoDialog(
                                    context,
                                    l10n.homeStatsGlobalMinedInfoTitle,
                                    l10n.homeStatsGlobalMinedInfo,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: _buildCompactStat(
                                  context: context,
                                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                                  title: l10n.homeStatsNextHalving,
                                  value: nextMilestoneDisplay,
                                  subtitle: l10n.homeStatsNextHalvingCurrent(
                                      compactFormat.format(totalUsers)
                                  ),
                                  progress: (totalUsers /
                                      (nextMilestoneTarget == -1
                                          ? totalUsers + 1
                                          : nextMilestoneTarget))
                                      .clamp(0.0, 1.0),
                                  progressColor: Colors.orangeAccent,
                                  onInfoTap: () =>
                                      _showHalvingInfoDialog(context),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: asyncMainnetCountdown.when(
                                  data: (remainingTime) {
                                    final projectStartDate =
                                    mainnetLaunchDate.subtract(
                                        const Duration(days: 437));
                                    final totalDuration = mainnetLaunchDate
                                        .difference(projectStartDate);
                                    final passedDuration = DateTime.now()
                                        .toUtc()
                                        .difference(projectStartDate);
                                    final progress = passedDuration.inSeconds /
                                        totalDuration.inSeconds;

                                    return _buildCompactStat(
                                      context: context,
                                      // GÜNCELLENDİ: Metin l10n'den geliyor
                                      title: l10n.homeStatsMainnet,
                                      value: formatMainnetCountdown(
                                          remainingTime),
                                      progress: progress.clamp(0.0, 1.0),
                                      progressColor: Colors.redAccent,
                                      onInfoTap: () => _showInfoDialog(
                                        context,
                                        l10n.homeStatsMainnetInfoTitle,
                                        l10n.homeStatsMainnetInfo,
                                      ),
                                    );
                                  },
                                  loading: () =>
                                  const SkeletonBox(height: 70),
                                  error: (err, stack) => _buildCompactStat(
                                      context: context,
                                      title: 'Error',
                                      value: '...',
                                      progress: 0),
                                ),
                              ),
                            ],
                          );
                        },
                      ),

                      // 4. Ana Eylem Alanı (Bakiye, Buton, Reklam)
                      Consumer(
                        builder: (context, ref, child) {
                          final asyncUserData =
                          ref.watch(userDataStreamProvider);
                          final liveMinedAmount =
                          ref.watch(liveMiningTimerProvider);
                          final adService = ref.watch(adServiceProvider);
                          final bool isAdReady = adService.isRewardedAdReady;
                          final activeMembersCount = ref.watch(
                              teamMembersProvider.select((asyncData) =>
                              (asyncData.value ?? [])
                                  .where((m) => m.isActive)
                                  .length));

                          final userData = (asyncUserData.value?.data()
                          as Map<String, dynamic>?) ??
                              {};

                          final lastActivationTimestamp =
                          userData['last_activation_time'] as Timestamp?;
                          final baseMiningRate =
                              (userData['base_mining_rate'] as num?)?.toDouble() ??
                                  0.0;
                          final double currentBonusPercentage =
                              (userData['current_bonus_percentage'] as num?)
                                  ?.toDouble() ??
                                  0.25;
                          final teamBonusRate = activeMembersCount *
                              currentBonusPercentage *
                              baseMiningRate;
                          final effectiveMiningRate =
                              baseMiningRate + teamBonusRate;

                          final isMiningActive = lastActivationTimestamp !=
                              null &&
                              DateTime.now().isBefore(lastActivationTimestamp
                                  .toDate()
                                  .add(const Duration(hours: 24)));

                          final bankedBalance =
                              (userData['coin_balance'] as num?)?.toDouble() ??
                                  0.0;
                          final displayBalance =
                              bankedBalance + liveMinedAmount;

                          final bool isOnStarterBoost =
                              userData['is_on_starter_boost'] ?? false;
                          final Timestamp? starterBoostExpires =
                          userData['starter_boost_expires'];
                          bool isStarterBoostCurrentlyActive = false;
                          if (isOnStarterBoost &&
                              starterBoostExpires != null &&
                              DateTime.now()
                                  .isBefore(starterBoostExpires.toDate())) {
                            isStarterBoostCurrentlyActive = true;
                          }
                          final int adsWatchedToday =
                              userData['adsWatchedToday'] ?? 0;
                          final Timestamp? adBoostExpiryTime =
                          userData['adBoostExpiryTime'];
                          bool isAdBoostCurrentlyActive = false;
                          Duration adBoostRemaining = Duration.zero;
                          if (adBoostExpiryTime != null &&
                              DateTime.now()
                                  .isBefore(adBoostExpiryTime.toDate())) {
                            isAdBoostCurrentlyActive = true;
                            adBoostRemaining = adBoostExpiryTime
                                .toDate()
                                .difference(DateTime.now());
                          }
                          final int maxAdsPerDay = 10;

                          // GÜNCELLENDİ: Dinamik metin için boost string'i
                          final String boostString = isStarterBoostCurrentlyActive
                              ? l10n.homeStatsEffectiveRateBoost2x
                              : (isAdBoostCurrentlyActive
                              ? l10n.homeStatsEffectiveRateBoost1_5x
                              : "");

                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(height: 32),
                              Text(
                                '${displayBalance.toStringAsFixed(6)} ON',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                // GÜNCELLENDİ: Durum metinleri l10n'den geliyor
                                isMiningActive
                                    ? l10n.homeMiningStatus(
                                    effectiveMiningRate.toStringAsFixed(2),
                                    boostString,
                                    activeMembersCount.toString()
                                )
                                    : bankedBalance > 0
                                    ? l10n.homeMiningStatusClaim
                                    : l10n.homeMiningStatusStart,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 14,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ActivateButton(
                                isMiningActive: isMiningActive,
                                isLoading: _isActivating,
                                onActivate: _handleActivation,
                                // GÜNCELLENDİ: Buton içi "ACTIVE" metni
                                activeText: l10n.homeMiningButtonActive,
                              ),
                              const SizedBox(height: 20),
                              isMiningActive
                                  ? const CountdownTimer()
                                  : const Text(
                                "24:00:00",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 28,
                                  fontWeight: FontWeight.w300,
                                  letterSpacing: 4,
                                ),
                              ),
                              const SizedBox(height: 20),

                              if (isStarterBoostCurrentlyActive ||
                                  isAdBoostCurrentlyActive)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                          isStarterBoostCurrentlyActive
                                              ? Icons.flash_on
                                              : Icons.timer,
                                          color: isStarterBoostCurrentlyActive
                                              ? Colors.deepPurpleAccent
                                              : Colors.amber.shade700,
                                          size: 16),
                                      const SizedBox(width: 4),
                                      Text(
                                        // GÜNCELLENDİ: Metinler l10n'den geliyor
                                        isStarterBoostCurrentlyActive
                                            ? l10n.homeMiningStarterBoost
                                            : l10n.homeMiningAdBoost(formatDuration(adBoostRemaining)),
                                        style: TextStyle(
                                            color: isStarterBoostCurrentlyActive
                                                ? Colors.deepPurpleAccent
                                                : Colors.amber.shade700,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12),
                                      ),
                                    ],
                                  ),
                                ),

                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40.0),
                                child: Column(
                                  children: [
                                    if (isMiningActive &&
                                        !_isShowingAd &&
                                        adsWatchedToday < maxAdsPerDay &&
                                        !isAdBoostCurrentlyActive)
                                      ElevatedButton.icon(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors
                                              .green.shade600
                                              .withOpacity(
                                              isAdReady ? 1.0 : 0.5),
                                          foregroundColor: Colors.white,
                                          minimumSize:
                                          const Size(double.infinity, 40),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                              BorderRadius.circular(12)),
                                        ),
                                        icon: isAdReady
                                            ? const Icon(
                                          Icons.slow_motion_video,
                                          size: 20,
                                        )
                                            : const SizedBox(
                                            width: 18,
                                            height: 18,
                                            child:
                                            CircularProgressIndicator(
                                                strokeWidth: 2,
                                                color: Colors.white)),
                                        // GÜNCELLENDİ: Metinler l10n'den geliyor
                                        label: Text(isAdReady
                                            ? l10n.homeMiningAdButton((maxAdsPerDay - adsWatchedToday).toString())
                                            : l10n.homeMiningAdLoading),
                                        onPressed: !isAdReady
                                            ? null
                                            : () {
                                          setState(
                                                  () {
                                                _isShowingAd = true;
                                              });
                                          adService.showRewardedAd(
                                              ref, context, () {
                                            if (mounted) {
                                              setState(() {
                                                _isShowingAd = false;
                                              });
                                              ref.invalidate(
                                                  userDataStreamProvider);
                                            }
                                          });
                                        },
                                      ),
                                    if (isMiningActive &&
                                        !_isShowingAd &&
                                        adsWatchedToday < maxAdsPerDay &&
                                        !isAdBoostCurrentlyActive &&
                                        !isAdReady)
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8.0),
                                        // GÜNCELLENDİ: Metin l10n'den geliyor
                                        child: Text(l10n.homeMiningAdLoadingShort,
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 12)),
                                      ),
                                    if (isMiningActive &&
                                        !_isShowingAd &&
                                        adsWatchedToday >= maxAdsPerDay &&
                                        !isAdBoostCurrentlyActive)
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 8.0),
                                        // GÜNCELLENDİ: Metin l10n'den geliyor
                                        child: Text(
                                            l10n.homeMiningAdLimit,
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 12)),
                                      ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                  height: 70), // Alttaki boşluk
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}