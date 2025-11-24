// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get helloWorld => 'Hallo Welt!';

  @override
  String get updateRequiredTitle => 'Aktualisierung erforderlich';

  @override
  String get updateRequiredMessage =>
      'Eine neue, verbesserte Version von ON Network ist verfügbar. Du musst die App aktualisieren, um weiterhin verdienen zu können.';

  @override
  String get updateNowButton => 'Jetzt aktualisieren';

  @override
  String get navHome => 'Startseite';

  @override
  String get navTeam => 'Team';

  @override
  String get navMarketplace => 'Marktplatz';

  @override
  String get navProfile => 'Profil';

  @override
  String get authWelcomeBack => 'Willkommen zurück!';

  @override
  String get authCreateAccount => 'Erstelle dein Konto';

  @override
  String get authEmail => 'E-Mail';

  @override
  String get authErrorEmailEmpty => 'Bitte gib eine E-Mail-Adresse ein';

  @override
  String get authErrorEmailInvalid =>
      'Bitte gib eine gültige E-Mail-Adresse ein';

  @override
  String get authPassword => 'Passwort';

  @override
  String get authErrorPasswordEmpty => 'Bitte gib dein Passwort ein';

  @override
  String get authErrorPasswordLength =>
      'Passwort muss mindestens 6 Zeichen lang sein';

  @override
  String get authConfirmPassword => 'Passwort bestätigen';

  @override
  String get authErrorConfirmPasswordEmpty => 'Bitte bestätige dein Passwort';

  @override
  String get authErrorPasswordsNoMatch => 'Passwörter stimmen nicht überein';

  @override
  String get authUsername => 'Benutzername';

  @override
  String get authUsernameHint => 'Muss mindestens 3 Zeichen lang sein';

  @override
  String get authErrorUsernameLength =>
      'Benutzername muss mindestens 3 Zeichen lang sein.';

  @override
  String get authInviteCode => 'Einladungscode (Optional)';

  @override
  String get authInviteCodeHint => 'z.B. A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'Ich bin 18 Jahre oder älter und rechtlich befugt, diesen Dienst zu nutzen.';

  @override
  String get authTermsConfirmationPrefix => 'Ich habe die ';

  @override
  String get authTermsOfService => 'Nutzungsbedingungen';

  @override
  String get authTermsConfirmationMid => ' und die ';

  @override
  String get authPrivacyPolicy => 'Datenschutzrichtlinie';

  @override
  String get authTermsConfirmationSuffix => ' gelesen und stimme ihnen zu.';

  @override
  String get authErrorAge =>
      'Du musst 18 Jahre oder älter sein, um das ON Network zu nutzen.';

  @override
  String get authErrorTerms =>
      'Du musst den Nutzungsbedingungen und der Datenschutzrichtlinie zustimmen.';

  @override
  String get authLogin => 'Anmelden';

  @override
  String get authRegister => 'Registrieren';

  @override
  String get authSignInWithGoogle => 'Mit Google anmelden';

  @override
  String get authSignUpWithGoogle => 'Mit Google registrieren';

  @override
  String get authSwitchToRegister => 'Kein Konto? Registrieren';

  @override
  String get authSwitchToLogin => 'Schon ein Konto? Anmelden';

  @override
  String get authForgotPassword => 'Passwort vergessen?';

  @override
  String get authResetPassword => 'Passwort zurücksetzen';

  @override
  String get authEnterEmailHint => 'Gib deine E-Mail-Adresse ein';

  @override
  String get authCancel => 'Abbrechen';

  @override
  String get authSendResetLink => 'Link zum Zurücksetzen senden';

  @override
  String get authResetLinkSent =>
      'Link zum Zurücksetzen des Passworts an deine E-Mail gesendet.';

  @override
  String get onboardingWelcomeTitle => 'Willkommen bei ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Du bist jetzt ein Pionier in einem neuen digitalen Ökosystem. Deine Reise beginnt heute.';

  @override
  String get onboardingMineTitle => 'Tippen zum Minen';

  @override
  String get onboardingMineDesc =>
      'Tippe alle 24 Stunden auf den Power-Button, um zu beweisen, dass du ein Mensch bist und deine ON-Coins zu verdienen.';

  @override
  String get onboardingTeamTitle => 'Baue dein Team auf';

  @override
  String get onboardingTeamDesc =>
      'Lade deine Freunde ein, deinem Team beizutreten. Je mehr aktive Mitglieder du hast, desto schneller verdienst du.';

  @override
  String get onboardingStart => 'Los geht\'s!';

  @override
  String get onboardingNext => 'Weiter';

  @override
  String get homeScreenTitle => 'ON Network';

  @override
  String get homeLangEnglish => 'English';

  @override
  String get homeLangTurkish => 'Türkçe';

  @override
  String get homeLangIndonesian => 'Bahasa Indonesia';

  @override
  String get homeLangVietnamese => 'Tiếng Việt';

  @override
  String get homeLangSpanish => 'Español';

  @override
  String get homeLangHindi => 'हिन्दी';

  @override
  String get homeLangPortuguese => 'Português';

  @override
  String get homeLangArabic => 'العربية';

  @override
  String get homeLangRussian => 'Русский';

  @override
  String get homeLangGerman => 'Deutsch';

  @override
  String get homeLangFrench => 'Français';

  @override
  String get homeLangJapanese => '日本語';

  @override
  String get homeLangKorean => '한국어';

  @override
  String homeErrorLoading(String error) {
    return 'Fehler beim Laden der Daten. Bitte prüfe deine Verbindung und versuche es erneut.\nDetails: $error';
  }

  @override
  String get homeStatsBaseRate => 'Basisrate';

  @override
  String get homeStatsBaseRateSubtitle => 'Deine aktuelle Basisgeschwindigkeit';

  @override
  String get homeStatsBaseRateInfoTitle => 'Basisrate';

  @override
  String get homeStatsBaseRateInfo =>
      'Dies ist deine aktuelle Basis-Verdienstgeschwindigkeit. Sie sinkt global für alle Benutzer, wenn das Netzwerk wächst, gemäß dem Halving-Zeitplan.';

  @override
  String get homeStatsEffectiveRate => 'Effektive Rate';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2X BOOST!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5X BOOST!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus vom Team ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Effektive Rate';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Deine aktuelle Gesamt-Verdienstgeschwindigkeit:\nBasisrate + (Aktive Teammitglieder * Dein Bonus-Level % * Basisrate)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 Du hast derzeit einen 2X Starter-Boost!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost => '\n\n⏱️ Werbe-Boost Aktiv!';

  @override
  String get homeStatsGlobalMined => 'Global Gemined';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Global Gemined';

  @override
  String get homeStatsGlobalMinedInfo =>
      'Die Gesamtmenge der ON-Coins, die von allen Pionieren weltweit auf dem Weg zum ursprünglichen Ziel von 1 Milliarde ON verdient wurden.';

  @override
  String get homeStatsNextHalving => 'Nächstes Halving';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Aktuell: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Verdienst-Halving';

  @override
  String get homeStatsNextHalvingInfo =>
      'Die Basis-Verdienstrate sinkt global, je mehr Pioniere beitreten. Deine persönliche Basisrate wird entsprechend aktualisiert.\n\n**Phase 1: Pioniere (0 - 100k)**\n• 0 - 10k:    1.00 ON/Std\n• 10k - 20k:  0.95 ON/Std\n• 20k - 30k:  0.90 ON/Std\n• 30k - 40k:  0.85 ON/Std\n• 50k - 60k:  0.80 ON/Std\n• 60k - 70k:  0.75 ON/Std\n• 70k - 80k:  0.70 ON/Std\n• 80k - 90k:  0.65 ON/Std\n• 90k - 100k: 0.60 ON/Std\n• 90k - 100k: 0.55 ON/Std\n\n**Phase 2: Botschafter (100k - 1M)**\n• 100k - 200k: 0.45 ON/Std\n• 200k - 300k: 0.40 ON/Std\n• 300k - 400k: 0.34 ON/Std\n• 400k - 500k: 0.28 ON/Std\n• 500k - 600k: 0.21 ON/Std\n• 600k - 700k: 0.15 ON/Std\n• 700k - 800k: 0.10 ON/Std\n• 800k - 900k: 0.06 ON/Std\n• 900k - 1M:   0.03 ON/Std\n\n**Phase 3: Wächter (1M+)**\n• 1M - 2M: 0.01 ON/Std\n• 2M+ :    0.005 ON/Std (Finale Rate)\n\nDeine effektive Rate steigt mit aktiven Teammitgliedern basierend auf deinem aktuellen Level (Standard 25%, Bronze 27%, Silber 30%, Gold 35%), angewendet auf DEINE aktuelle Basisrate pro aktivem Mitglied.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Mainnet-Countdown';

  @override
  String get homeStatsMainnetInfo =>
      'Dies ist das geplante Datum für unseren Mainnet-Start. Zu diesem Zeitpunkt wird die Verteilung (Verdienen) der ON-Coins gestoppt und der ON-Marktplatz wird voll funktionsfähig sein.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Verdiene $rate ON/Std.$boost mit $count aktiven Mitglied(ern)';
  }

  @override
  String get homeMiningStatusClaim =>
      'Tippe, um Einnahmen der letzten Sitzung zu beanspruchen & neue zu starten!';

  @override
  String get homeMiningStatusStart =>
      'Tippe auf den Button, um mit dem Verdienen zu beginnen!';

  @override
  String get homeMiningButtonActive => 'AKTIV';

  @override
  String get homeMiningStarterBoost =>
      'Starter-Boost Aktiv! (2X Geschwindigkeit)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Werbe-Boost aktiv für: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Video für 1.5X Boost ansehen ($count übrig)';
  }

  @override
  String get homeMiningAdLoading => 'Lade Boost-Werbung...';

  @override
  String get homeMiningAdLoadingShort => 'Werbe-Boost lädt...';

  @override
  String get homeMiningAdLimit => 'Tägliches Limit für Werbe-Boosts erreicht.';

  @override
  String get homeActivateSnackbar => 'Aktiviere Verdienst-Sitzung...';

  @override
  String get homeActivatedSnackbar =>
      'Verdienst-Sitzung aktiviert! Einnahmen der letzten Sitzung hinzugefügt.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Dein Team';

  @override
  String get teamRefreshTooltip => 'Team aktualisieren';

  @override
  String get teamRefreshSnackbar => 'Teamdaten werden aktualisiert...';

  @override
  String get teamErrorInviteCode =>
      'Einladungscode konnte nicht geladen werden';

  @override
  String teamInviteCode(String code) {
    return 'Dein Einladungscode: $code';
  }

  @override
  String get teamErrorLoading =>
      'Teammitglieder konnten nicht geladen werden.\nBitte prüfe deine Verbindung.';

  @override
  String teamYourContribution(String rate) {
    return 'Dein Beitrag: +$rate ON/Stunde';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Dein Bonus-Level: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Nächstes Ziel: $goal';
  }

  @override
  String get teamNextGoalMax => 'Maximales Level erreicht!';

  @override
  String teamNextGoalBronze(Object count) {
    return '$count weiteres Mitglied für Bronze (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return '$count weitere(s) Mitglied(er) für Silber (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return '$count weitere(s) Mitglied(er) für Gold (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Aktuelle Teammitglieder: $total ($active aktiv)';
  }

  @override
  String get teamInviteButton => 'Neue Mitglieder einladen';

  @override
  String get teamEmptyTitle => 'Dein Team ist leer.';

  @override
  String get teamEmptyDescription =>
      'Lade Freunde mit deinem Code ein, um dein Team aufzubauen und deine Mining-Rate zu erhöhen!';

  @override
  String get teamMemberActive => 'Jetzt aktiv';

  @override
  String get teamMemberInactive => 'Inaktiv';

  @override
  String get teamMemberTapToRemind => 'Tippen, um zu erinnern';

  @override
  String get teamMemberTooltipReport => 'Benutzer melden';

  @override
  String get teamMemberTooltipRemind => 'Benutzer erinnern';

  @override
  String teamRemindSnackbar(String username) {
    return 'Sende Erinnerung an $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Fehler beim Senden der Erinnerung: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Erinnerung an $username gesendet!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return '$username melden';
  }

  @override
  String get teamReportDialogContent =>
      'Bist du sicher, dass du diesen Benutzer wegen unangemessener Inhalte (z.B. Benutzername oder Profilbild) melden möchtest?\n\nDies sendet eine Benachrichtigung an unser Moderationsteam zur Überprüfung.';

  @override
  String get teamReportDialogButton => 'Melden';

  @override
  String teamReportSnackbar(String username) {
    return 'Bericht für $username wird übermittelt...';
  }

  @override
  String get teamReportSuccess =>
      'Bericht übermittelt. Unser Team wird ihn in Kürze prüfen.';

  @override
  String teamReportError(String error) {
    return 'Fehler beim Übermitteln des Berichts: $error';
  }

  @override
  String get teamShareTitle => 'Teile deine Einladung';

  @override
  String get teamShareSubtitle => 'Wie möchtest du deine Einladung teilen?';

  @override
  String get teamShareImageButton => 'Als Bildkarte teilen';

  @override
  String get teamShareTextButton => 'Als reinen Text teilen';

  @override
  String get teamShareImageGenerating => 'Erstelle deine Einladungskarte...';

  @override
  String teamShareImageError(String error) {
    return 'Fehler beim Teilen der Karte: $error. Teile stattdessen als Text.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Ich baue die Zukunft digitaler Netzwerke mit ON Network. Ich will dich in meinem Team! 🔥\n\nHier ist dein Willkommensgeschenk für den Beitritt:\n✅ 1 GRATIS ON-Coin sofort\n✅ 24-Stunden 2X Geschwindigkeits-Boost\n\nVerwende meinen Einladungscode, um zu starten: $code\n\nTritt jetzt bei und sichere dir deinen Platz:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Tritt meinem Team im ON Network bei! Verwende meinen Code: $code\n\nJetzt beitreten:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username lädt dich ein';
  }

  @override
  String get inviteCardTitle => 'DEINE REISE BEGINNT HIER!';

  @override
  String get inviteCardUseCode => 'VERWENDE MEINEN EINLADUNGSCODE';

  @override
  String get inviteCardGiftTitle =>
      'TRITT JETZT BEI UND ERHALTE DEIN WILLKOMMENSGESCHENK:';

  @override
  String get inviteCardGift1 => '1 GRATIS ON-Coin sofort';

  @override
  String get inviteCardGift2 => '24-Stunden 2X Geschwindigkeits-Boost';

  @override
  String get inviteCardButton => 'TIPPEN, BEITRETEN & DEIN ON ABHOLEN!';

  @override
  String get marketplaceTitle => 'Marktplatz: Demnächst verfügbar';

  @override
  String get marketplaceDescription =>
      'Wir bauen einen dezentralen Marktplatz, auf dem du Waren und Dienstleistungen mit deinen verdienten ON-Coins kaufen und verkaufen kannst.\n\nBleib am Minen und baue dein Guthaben auf!';

  @override
  String get marketplaceCommunity => 'TRITT DER COMMUNITY BEI';

  @override
  String get marketplaceTooltipTelegram => 'Tritt unserem Telegram bei';

  @override
  String get marketplaceTooltipTwitter => 'Folge uns auf X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Folge uns auf Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Sieh uns auf TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Besuche unsere Website';

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get profileUsername => 'Benutzername';

  @override
  String get profileErrorUsernameLength =>
      'Benutzername muss mindestens 4 Zeichen lang sein';

  @override
  String get profileErrorUsernameTaken =>
      'Dieser Benutzername ist bereits vergeben. Bitte versuche einen anderen.';

  @override
  String get profileUsernameUpdated => 'Benutzername aktualisiert!';

  @override
  String get profileImageUploadFailed => 'Bild-Upload fehlgeschlagen.';

  @override
  String get profileImageUploadSuccess => 'Profilbild aktualisiert!';

  @override
  String profileErrorImageSave(String error) {
    return 'Speichern der Bild-URL fehlgeschlagen: $error';
  }

  @override
  String get profileSectionCommunity => 'Community';

  @override
  String profileInviteCode(String code) {
    return 'Dein Einladungscode: $code';
  }

  @override
  String get profileShare => 'Tippen zum Teilen';

  @override
  String get profileCopyCode => 'Code kopieren';

  @override
  String get profileCopyCodeSubtitle =>
      'Kopiere deinen Einladungscode in die Zwischenablage';

  @override
  String get profileCopyCodeSuccess =>
      'Einladungscode in die Zwischenablage kopiert!';

  @override
  String get profileTelegram => 'Tritt unserem Telegram bei';

  @override
  String get profileTelegramSubtitle =>
      'Erhalte Neuigkeiten und chatte mit der Community';

  @override
  String get profileTwitter => 'Folge uns auf X (Twitter)';

  @override
  String get profileTwitterSubtitle =>
      'Bleibe auf dem Laufenden mit Ankündigungen';

  @override
  String get profileInstagram => 'Folge uns auf Instagram';

  @override
  String get profileInstagramSubtitle => 'Sieh unsere Reise';

  @override
  String get profileTikTok => 'Sieh uns auf TikTok';

  @override
  String get profileTikTokSubtitle => 'Neueste Updates und Clips';

  @override
  String get profileWebsite => 'Besuche unsere Website';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Einstellungen & Sicherheit';

  @override
  String get profileNotifSettings => 'Benachrichtigungseinstellungen';

  @override
  String get profileNotifSettingsSubtitle =>
      'Verwalte deine App-Benachrichtigungen';

  @override
  String get profileChangePassword => 'Passwort ändern';

  @override
  String get profileChangePasswordSubtitle =>
      'Sende eine E-Mail zum Zurücksetzen des Passworts';

  @override
  String get profileChangePasswordSuccess =>
      'E-Mail zum Zurücksetzen des Passworts gesendet. Prüfe deinen Posteingang!';

  @override
  String get profileSectionAbout => 'Über';

  @override
  String get profileProjectInfo => 'Projekt-Info & Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Erfahre mehr über unsere Vision und Roadmap';

  @override
  String get profileTerms => 'Nutzungsbedingungen';

  @override
  String get profileTermsSubtitle =>
      'Lies unsere Allgemeinen Geschäftsbedingungen';

  @override
  String get profilePrivacy => 'Datenschutzrichtlinie';

  @override
  String get profilePrivacySubtitle => 'Wie wir deine Daten behandeln';

  @override
  String get profileSectionDanger => 'Gefahrenzone';

  @override
  String get profileDeleteAccount => 'Konto löschen';

  @override
  String get profileDeleteAccountSubtitle =>
      'Lösche dein Konto und alle Daten endgültig';

  @override
  String get profileDeleteAccountDialogTitle => 'Bist du dir absolut sicher?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Diese Aktion ist unumkehrbar.\n\nAlle deine Daten, einschließlich deines ON-Coin-Guthabens und deiner Teamverbindungen, werden dauerhaft gelöscht. Dies kann nicht rückgängig gemacht werden.';

  @override
  String get profileDeleteAccountDialogButton => 'Mein Konto löschen';

  @override
  String get profileDeleteAccountSuccess => 'Konto dauerhaft gelöscht.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Fehler beim Löschen des Kontos: $error';
  }

  @override
  String get profileSignOut => 'Abmelden';

  @override
  String profileSignOutError(String error) {
    return 'Fehler beim Abmelden: $error';
  }

  @override
  String get settingsTitle => 'Benachrichtigungseinstellungen';

  @override
  String get settingsMiningTitle => 'Mining-Sitzungs-Erinnerungen';

  @override
  String get settingsMiningSubtitle =>
      'Werde benachrichtigt, wenn deine 24-Stunden-Sitzung endet.';

  @override
  String get settingsTeamTitle => 'Team-Erinnerungen';

  @override
  String get settingsTeamSubtitle =>
      'Erlaube deinen Teammitgliedern, dich anzupingen, um mit dem Minen zu beginnen.';

  @override
  String get settingsAdBoostTitle => 'Werbe-Boost-Erinnerungen';

  @override
  String get settingsAdBoostSubtitle =>
      'Werde benachrichtigt, wenn dein 1.5X Werbe-Boost abläuft.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Fehler beim Aktualisieren der Einstellungen: $error';
  }

  @override
  String get projectInfoTitle => 'Unsere Vision';

  @override
  String get projectInfoSection1Title => 'Was ist ON Network?';

  @override
  String get projectInfoSection1Content =>
      'ON Network ist ein dezentrales digitales Ökosystem, das für die Zukunft konzipiert wurde. Indem du alle 24 Stunden auf den Button tippst, bestätigst du deine Anwesenheit als menschlicher Pionier und trägst zur Sicherheit und zum Wachstum des Netzwerks bei. Im Gegenzug verdienst du ON, die native digitale Währung unseres Netzwerks.';

  @override
  String get projectInfoSection2Title => 'ON-Coin-Nutzen';

  @override
  String get projectInfoSection2Content =>
      'Die ON-Coins, die du verdienst, werden derzeit an frühe Pioniere wie dich verteilt. Wenn das Netzwerk wächst, wird der Hauptzweck von ON darin bestehen, Transaktionen auf dem zukünftigen Marktplatz zu erleichtern und Netzwerkfunktionen zu unterstützen. Die Verdienstrate sinkt, wenn das Netzwerk wächst, um die frühe Teilnahme am Aufbau der Community zu belohnen.';

  @override
  String get projectInfoSection3Title => 'Unsere Roadmap';

  @override
  String get projectInfoRoadmap1Title => 'Phase 1: Pioniere (Du bist hier)';

  @override
  String get projectInfoRoadmap1Content =>
      'Das Netzwerk von 0 auf 1 Million Pioniere erweitern. ON-Coins durch Engagement verteilen.';

  @override
  String get projectInfoRoadmap2Title => 'Phase 2: Marktplatz';

  @override
  String get projectInfoRoadmap2Content =>
      'Start des ON-Marktplatzes, auf dem Mitglieder Waren und Dienstleistungen mit ihren verdienten ON-Coins austauschen können.';

  @override
  String get projectInfoRoadmap3Title => 'Phase 3: Mainnet & Exchange';

  @override
  String get projectInfoRoadmap3Content =>
      'Übergang zu einer vollständig dezentralen Blockchain (Mainnet) und Ermöglichung der ON-Funktionalität auf großen Kryptowährungsplattformen (vorbehaltlich der Einhaltung von Vorschriften).';

  @override
  String get settingsLangTitle => 'Sprache';

  @override
  String get settingsLangSubtitle => 'Anwendungssprache ändern';

  @override
  String get marketplaceTooltipEmail => 'Support kontaktieren';

  @override
  String get profileEmail => 'Support kontaktieren';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Folge uns auf Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Abonniere unseren YouTube-Kanal';

  @override
  String get profileFacebook => 'Folge uns auf Facebook';

  @override
  String get profileFacebookSubtitle =>
      'Sieh dir unsere Updates und Community an';

  @override
  String get profileYoutube => 'Abonniere unseren YouTube-Kanal';

  @override
  String get profileYoutubeSubtitle =>
      'Sieh dir Projektupdates und Tutorials an';
}
