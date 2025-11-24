// lib/features/profile/view/settings_screen.dart (HATA DÜZELTİLDİ)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/core/providers/localization_provider.dart';
import 'package:on_network/features/home/providers/home_providers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// YENİ: Lokalizasyon importu eklendi
import 'package:on_network/generated/l10n/app_localizations.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  // Switch'lerin anlık durumunu tutmak için lokal değişkenler
  bool _miningReminders = true;
  bool _teamReminders = true;
  bool _adBoostReminders = true;

  bool _isLoading = false; // Kaydetme sırasında yükleniyor durumu
  bool _isInitialized = false; // Firestore'dan ilk verinin yüklendiğini takip et

  // Ayarları Firestore'a kaydetmek için yardımcı fonksiyon
  Future<void> _updateSettings(String key, bool value) async {
    // YENİ: l10n nesnesini al (hata mesajı için)
    final l10n = AppLocalizations.of(context)!;

    // UI'ı anında güncelle (Optimistic Update)
    setState(() {
      _isLoading = true;
      if (key == 'miningReminders') _miningReminders = value;
      if (key == 'teamReminders') _teamReminders = value;
      if (key == 'adBoostReminders') _adBoostReminders = value;
    });

    final userService = ref.read(userServiceProvider);
    try {
      // Servis fonksiyonunu çağırarak tüm ayar haritasını gönder
      await userService.updateNotificationSettings({
        'miningReminders': _miningReminders,
        'teamReminders': _teamReminders,
        'adBoostReminders': _adBoostReminders,
      });
    } catch (e) {
      // Hata durumunda değişikliği geri al
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            // GÜNCELLENDİ: Hata metni l10n'den geliyor
              content: Text(l10n.settingsErrorUpdate(e.toString())),
              backgroundColor: Colors.red
          ),
        );
        setState(() {
          if (key == 'miningReminders') _miningReminders = !value;
          if (key == 'teamReminders') _teamReminders = !value;
          if (key == 'adBoostReminders') _adBoostReminders = !value;
        });
      }
    } finally {
      if (mounted) {
        setState(() { _isLoading = false; });
      }
    }
  }

  // --- YENİ WIDGET: Dil Seçim Menüsü ---
  Widget _buildLanguageMenu(AppLocalizations l10n) {
    // Mevcut seçili dili provider'dan al
    final currentLocale = ref.watch(localeProvider);
    String currentLanguageName;

    // 'null' (sistem dili) veya mevcut locale'e göre dil adını belirle
    if (currentLocale == null) {
      currentLanguageName = l10n.navHome == "Home" ? "System Default" : "Sistem Dili"; // Basit yerelleştirme
    } else if (currentLocale.languageCode == 'tr') {
      currentLanguageName = l10n.homeLangTurkish;
    } else if (currentLocale.languageCode == 'id') {
      currentLanguageName = l10n.homeLangIndonesian;
    } else if (currentLocale.languageCode == 'vi') {
      currentLanguageName = l10n.homeLangVietnamese;
    } else if (currentLocale.languageCode == 'es') {
      currentLanguageName = l10n.homeLangSpanish;
    } else if (currentLocale.languageCode == 'hi') {
      currentLanguageName = l10n.homeLangHindi;
    } else if (currentLocale.languageCode == 'pt') {
      currentLanguageName = l10n.homeLangPortuguese;
    } else if (currentLocale.languageCode == 'ar') {
      currentLanguageName = l10n.homeLangArabic;
    } else if (currentLocale.languageCode == 'ru') {
      currentLanguageName = l10n.homeLangRussian;
    } else if (currentLocale.languageCode == 'de') {
      currentLanguageName = l10n.homeLangGerman;
    } else if (currentLocale.languageCode == 'fr') {
      currentLanguageName = l10n.homeLangFrench;
    } else if (currentLocale.languageCode == 'ja') {
      currentLanguageName = l10n.homeLangJapanese;
    } else if (currentLocale.languageCode == 'ko') {
      currentLanguageName = l10n.homeLangKorean;
    } else {
      currentLanguageName = l10n.homeLangEnglish;
    }

    return ListTile(
      title: Text(l10n.settingsLangTitle, style: const TextStyle(color: Colors.white)),
      subtitle: Text(l10n.settingsLangSubtitle, style: TextStyle(color: Colors.white.withOpacity(0.7))),
      // İSTEK 2: İKON DEĞİŞTİ
      leading: const Icon(FontAwesomeIcons.globe, color: Color(0xFF00D1FF), size: 22),
      trailing: PopupMenuButton<Locale?>(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              currentLanguageName,
              style: TextStyle(color: Colors.white.withOpacity(0.8), fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.arrow_drop_down, color: Colors.white70),
          ],
        ),
        onSelected: (Locale? locale) {
          ref.read(localeProvider.notifier).state = locale;
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale?>>[
          CheckedPopupMenuItem<Locale?>(
            value: null,
            // İSTEK 1: TİK İŞARETİ KONTROLÜ
            checked: currentLocale == null,
            child: Text(l10n.navHome == "Home" ? "System Default" : "Sistem Dili"),
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
      ),
    );
  }
  // --- YENİ WIDGET BİTTİ ---

  @override
  Widget build(BuildContext context) {
    // YENİ: l10n (lokalizasyon) nesnesini context'ten al
    final l10n = AppLocalizations.of(context)!;

    // Kullanıcının verisini izle
    final asyncUserData = ref.watch(userDataStreamProvider);

    return Scaffold(
      appBar: AppBar(
        // GÜNCELLENDİ: Metin l10n'den geliyor
        title: Text(l10n.settingsTitle),
        backgroundColor: Theme.of(context).cardColor,
      ),
      body: asyncUserData.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        // GÜNCELLENDİ: Hata metni l10n'den (homeErrorLoading) geliyor
        error: (err, stack) => Center(child: Text(l10n.homeErrorLoading(err.toString()))),
        data: (userDoc) {
          // Firestore'dan veriyi SADECE bir kez (veya yükleme yokken) yükle
          if (userDoc.exists && !_isInitialized) {
            final data = userDoc.data() as Map<String, dynamic>? ?? {};
            final settings = data['notification_settings'] as Map<String, dynamic>? ?? {};

            // Lokal state'i Firestore'daki veriyle (veya varsayılan 'true' ile) ayarla
            _miningReminders = settings['miningReminders'] ?? true;
            _teamReminders = settings['teamReminders'] ?? true;
            _adBoostReminders = settings['adBoostReminders'] ?? true;
            _isInitialized = true; // Verinin yüklendiğini işaretle
          }

          // Yükleme durumunda ekranı dondur
          return AbsorbPointer(
            absorbing: _isLoading,
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                // --- YENİ EKLENEN BÖLÜM ---
                _buildLanguageMenu(l10n),
                const Divider(color: Colors.white24, height: 24),
                // --- BİTTİ ---

                SwitchListTile(
                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                  title: Text(l10n.settingsMiningTitle, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(l10n.settingsMiningSubtitle, style: TextStyle(color: Colors.white.withOpacity(0.7))),
                  value: _miningReminders,
                  onChanged: (bool value) {
                    _updateSettings('miningReminders', value);
                  },
                  activeColor: const Color(0xFF00D1FF),
                ),
                SwitchListTile(
                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                  title: Text(l10n.settingsTeamTitle, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(l10n.settingsTeamSubtitle, style: TextStyle(color: Colors.white.withOpacity(0.7))),
                  value: _teamReminders,
                  onChanged: (bool value) {
                    _updateSettings('teamReminders', value);
                  },
                  activeColor: const Color(0xFF00D1FF),
                ),
                SwitchListTile(
                  // GÜNCELLENDİ: Metinler l10n'den geliyor
                  title: Text(l10n.settingsAdBoostTitle, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(l10n.settingsAdBoostSubtitle, style: TextStyle(color: Colors.white.withOpacity(0.7))),
                  value: _adBoostReminders,
                  onChanged: (bool value) {
                    _updateSettings('adBoostReminders', value);
                  },
                  activeColor: const Color(0xFF00D1FF),
                ),
                // Yükleniyor göstergesi
                if (_isLoading)
                  const Padding(
                    padding: EdgeInsets.only(top: 20.0),
                    child: Center(child: CircularProgressIndicator(color: Color(0xFF00D1FF))),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}