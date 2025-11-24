// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get helloWorld => 'Merhaba Dünya!';

  @override
  String get updateRequiredTitle => 'Güncelleme Gerekli';

  @override
  String get updateRequiredMessage =>
      'ON Network\'ün yeni ve geliştirilmiş bir sürümü mevcut. Kazanmaya devam etmek için uygulamayı güncellemelisiniz.';

  @override
  String get updateNowButton => 'Şimdi Güncelle';

  @override
  String get navHome => 'Ana Sayfa';

  @override
  String get navTeam => 'Takım';

  @override
  String get navMarketplace => 'Pazaryeri';

  @override
  String get navProfile => 'Profil';

  @override
  String get authWelcomeBack => 'Tekrar Hoş Geldiniz!';

  @override
  String get authCreateAccount => 'Hesabınızı Oluşturun';

  @override
  String get authEmail => 'E-posta';

  @override
  String get authErrorEmailEmpty => 'Lütfen bir e-posta adresi girin';

  @override
  String get authErrorEmailInvalid => 'Lütfen geçerli bir e-posta adresi girin';

  @override
  String get authPassword => 'Şifre';

  @override
  String get authErrorPasswordEmpty => 'Lütfen şifrenizi girin';

  @override
  String get authErrorPasswordLength => 'Şifre en az 6 karakter olmalıdır';

  @override
  String get authConfirmPassword => 'Şifreyi Onayla';

  @override
  String get authErrorConfirmPasswordEmpty => 'Lütfen şifrenizi onaylayın';

  @override
  String get authErrorPasswordsNoMatch => 'Şifreler eşleşmiyor';

  @override
  String get authUsername => 'Kullanıcı Adı';

  @override
  String get authUsernameHint => 'En az 3 karakter olmalıdır';

  @override
  String get authErrorUsernameLength =>
      'Kullanıcı adı en az 3 karakter olmalıdır.';

  @override
  String get authInviteCode => 'Davet Kodu (İsteğe bağlı)';

  @override
  String get authInviteCodeHint => 'örn: A41DB9X1';

  @override
  String get authAgeConfirmation =>
      '18 yaşında veya daha büyük olduğumu ve bu hizmeti yasal olarak kullanmaya uygun olduğumu beyan ederim.';

  @override
  String get authTermsConfirmationPrefix => 'Okudum ve kabul ediyorum: ';

  @override
  String get authTermsOfService => 'Hizmet Şartları';

  @override
  String get authTermsConfirmationMid => ' ve ';

  @override
  String get authPrivacyPolicy => 'Gizlilik Politikası';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'ON Network\'ü kullanmak için 18 yaşında veya daha büyük olmalısınız.';

  @override
  String get authErrorTerms =>
      'Hizmet Şartları ve Gizlilik Politikası\'nı kabul etmelisiniz.';

  @override
  String get authLogin => 'Giriş Yap';

  @override
  String get authRegister => 'Kayıt Ol';

  @override
  String get authSignInWithGoogle => 'Google ile Giriş Yap';

  @override
  String get authSignUpWithGoogle => 'Google ile Kayıt Ol';

  @override
  String get authSwitchToRegister => 'Hesabınız yok mu? Kayıt Olun';

  @override
  String get authSwitchToLogin => 'Zaten bir hesabınız var mı? Giriş Yapın';

  @override
  String get authForgotPassword => 'Şifremi Unuttum';

  @override
  String get authResetPassword => 'Şifreyi Sıfırla';

  @override
  String get authEnterEmailHint => 'E-postanızı girin';

  @override
  String get authCancel => 'İptal';

  @override
  String get authSendResetLink => 'Sıfırlama Bağlantısı Gönder';

  @override
  String get authResetLinkSent =>
      'Şifre sıfırlama bağlantısı e-postanıza gönderildi.';

  @override
  String get onboardingWelcomeTitle => 'ON Network\'e Hoş Geldiniz';

  @override
  String get onboardingWelcomeDesc =>
      'Artık yeni bir dijital ekosistemin Öncüsüsünüz. Yolculuğunuz bugün başlıyor.';

  @override
  String get onboardingMineTitle => 'Kazanmak için Dokunun';

  @override
  String get onboardingMineDesc =>
      'İnsan olduğunuzu kanıtlamak ve ON coinlerinizi kazanmak için her 24 saatte bir güç düğmesine dokunun.';

  @override
  String get onboardingTeamTitle => 'Takımınızı Kurun';

  @override
  String get onboardingTeamDesc =>
      'Arkadaşlarınızı takımınıza katılmaya davet edin. Ne kadar çok aktif üyeniz olursa, o kadar hızlı kazanırsınız.';

  @override
  String get onboardingStart => 'Hadi Başlayalım!';

  @override
  String get onboardingNext => 'İleri';

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
    return 'Veriler yüklenirken hata oluştu. Lütfen bağlantınızı kontrol edin ve tekrar deneyin.\nDetaylar: $error';
  }

  @override
  String get homeStatsBaseRate => 'Temel Hız';

  @override
  String get homeStatsBaseRateSubtitle => 'Mevcut temel hızınız';

  @override
  String get homeStatsBaseRateInfoTitle => 'Temel Hız';

  @override
  String get homeStatsBaseRateInfo =>
      'Bu sizin mevcut temel kazanma hızınızdır. Ağ büyüdükçe, yarılanma programına göre tüm kullanıcılar için küresel olarak azalır.';

  @override
  String get homeStatsEffectiveRate => 'Etkili Hız';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2X HIZ!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5X HIZ!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus takımdan ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Etkili Hız';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Mevcut toplam kazanma hızınız:\nTemel Hız + (Aktif Takım Üyeleri * Bonus Seviyeniz % * Temel Hız)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 Şu anda 2X Başlangıç Hızlandırmasındasınız!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost =>
      '\n\n⏱️ Reklam Hızlandırması Aktif!';

  @override
  String get homeStatsGlobalMined => 'Toplam Kazanılan';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Toplam Kazanılan';

  @override
  String get homeStatsGlobalMinedInfo =>
      'Dünya çapındaki tüm Öncüler tarafından 1 Milyar ON hedefine doğru kazanılan toplam ON coin miktarı.';

  @override
  String get homeStatsNextHalving => 'Sonraki Yarılanma';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Mevcut: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Kazanma Hızı Yarılanması';

  @override
  String get homeStatsNextHalvingInfo =>
      'Daha fazla Öncü katıldıkça temel kazanma hızı küresel olarak azalır. Kişisel temel hızınız buna göre güncellenir.\n\n**Faz 1: Öncüler (0 - 100k)**\n• 0 - 10k:    1.00 ON/sa\n• 10k - 20k:  0.95 ON/sa\n• 20k - 30k:  0.90 ON/sa\n• 30k - 40k:  0.85 ON/sa\n• 50k - 60k:  0.80 ON/sa\n• 60k - 70k:  0.75 ON/sa\n• 70k - 80k:  0.70 ON/sa\n• 80k - 90k:  0.65 ON/sa\n• 90k - 100k: 0.60 ON/sa\n• 90k - 100k: 0.55 ON/sa\n\n**Faz 2: Elçiler (100k - 1M)**\n• 100k - 200k: 0.45 ON/sa\n• 200k - 300k: 0.40 ON/sa\n• 300k - 400k: 0.34 ON/sa\n• 400k - 500k: 0.28 ON/sa\n• 500k - 600k: 0.21 ON/sa\n• 600k - 700k: 0.15 ON/sa\n• 700k - 800k: 0.10 ON/sa\n• 800k - 900k: 0.06 ON/sa\n• 900k - 1M:   0.03 ON/sa\n\n**Faz 3: Muhafızlar (1M+)**\n• 1M - 2M: 0.01 ON/sa\n• 2M+ :    0.005 ON/sa (Nihai Miras Oranı)\n\nEtkili hızınız, mevcut kademenize (Standart %25, Bronz %27, Gümüş %30, Altın %35) göre aktif takım üyesi başına SİZİN mevcut Temel Hızınıza uygulanan bonusla artar.';

  @override
  String get homeStatsMainnet => 'Ana Ağ';

  @override
  String get homeStatsMainnetInfoTitle => 'Ana Ağ Geri Sayımı';

  @override
  String get homeStatsMainnetInfo =>
      'Bu, Ana Ağ (Mainnet) lansmanımız için planlanan tarihtir. Bu noktada, ON coin dağıtımı (kazanma) duracak ve ON Pazaryeri tam olarak faaliyete geçecektir.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return '$rate ON/sa hızla $boost kazanılıyor, $count aktif üye ile';
  }

  @override
  String get homeMiningStatusClaim =>
      'Son seans kazancını almak ve yenisini başlatmak için dokun!';

  @override
  String get homeMiningStatusStart => 'Kazanmaya başlamak için düğmeye dokun!';

  @override
  String get homeMiningButtonActive => 'AKTİF';

  @override
  String get homeMiningStarterBoost =>
      'Başlangıç Hızlandırması Aktif! (2X Hız)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Reklam Hızlandırması aktif: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return '1.5X Hız için Reklam İzle ($count kaldı)';
  }

  @override
  String get homeMiningAdLoading => 'Hızlandırma Reklamı Yükleniyor...';

  @override
  String get homeMiningAdLoadingShort => 'Reklam hızlandırması yükleniyor...';

  @override
  String get homeMiningAdLimit =>
      'Günlük reklam hızlandırma sınırına ulaşıldı.';

  @override
  String get homeActivateSnackbar => 'Kazanma oturumu etkinleştiriliyor...';

  @override
  String get homeActivatedSnackbar =>
      'Kazanma oturumu etkinleştirildi! Son oturumdan elde edilen kazançlar eklendi.';

  @override
  String get homeDialogOK => 'Tamam';

  @override
  String get teamScreenTitle => 'Takımın';

  @override
  String get teamRefreshTooltip => 'Takımı Yenile';

  @override
  String get teamRefreshSnackbar => 'Takım verileri yenileniyor...';

  @override
  String get teamErrorInviteCode => 'Davet kodu yüklenemedi';

  @override
  String teamInviteCode(String code) {
    return 'Davet Kodun: $code';
  }

  @override
  String get teamErrorLoading =>
      'Takım üyeleri yüklenemedi.\nLütfen bağlantınızı kontrol edin.';

  @override
  String teamYourContribution(String rate) {
    return 'Katkınız: +$rate ON/saat';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Bonus Seviyeniz: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Sonraki Hedef: $goal';
  }

  @override
  String get teamNextGoalMax => 'Maksimum Seviyeye Ulaşıldı!';

  @override
  String teamNextGoalBronze(Object count) {
    return 'Bronz (%27) için $count üye daha';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return 'Gümüş (%30) için $count üye daha';
  }

  @override
  String teamNextGoalGold(Object count) {
    return 'Altın (%35) için $count üye daha';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Mevcut Takım Üyeleri: $total ($active aktif)';
  }

  @override
  String get teamInviteButton => 'Yeni Üye Davet Et';

  @override
  String get teamEmptyTitle => 'Takımın boş.';

  @override
  String get teamEmptyDescription =>
      'Takımını kurmak ve kazanma hızını artırmak için arkadaşlarını kodunla davet et!';

  @override
  String get teamMemberActive => 'Şu An Aktif';

  @override
  String get teamMemberInactive => 'Pasif';

  @override
  String get teamMemberTapToRemind => 'Hatırlatmak için dokun';

  @override
  String get teamMemberTooltipReport => 'Kullanıcıyı Bildir';

  @override
  String get teamMemberTooltipRemind => 'Kullanıcıya Hatırlat';

  @override
  String teamRemindSnackbar(String username) {
    return '$username adlı kullanıcıya hatırlatma gönderiliyor...';
  }

  @override
  String teamRemindError(String error) {
    return 'Hatırlatma gönderilemedi: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return '$username adlı kullanıcıya hatırlatma gönderildi!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return '$username Adlı Kullanıcıyı Bildir';
  }

  @override
  String get teamReportDialogContent =>
      'Bu kullanıcıyı uygunsuz içerik (örn. kullanıcı adı veya profil resmi) nedeniyle bildirmek istediğinizden emin misiniz?\n\nBu, inceleme için moderasyon ekibimize bir bildirim gönderecektir.';

  @override
  String get teamReportDialogButton => 'Bildir';

  @override
  String teamReportSnackbar(String username) {
    return '$username için bildirim gönderiliyor...';
  }

  @override
  String get teamReportSuccess =>
      'Bildirim gönderildi. Ekibimiz kısa süre içinde inceleyecektir.';

  @override
  String teamReportError(String error) {
    return 'Bildirim gönderilemedi: $error';
  }

  @override
  String get teamShareTitle => 'Davetini Paylaş';

  @override
  String get teamShareSubtitle => 'Davetini nasıl paylaşmak istersin?';

  @override
  String get teamShareImageButton => 'Resim Kartı Olarak Paylaş';

  @override
  String get teamShareTextButton => 'Düz Metin Olarak Paylaş';

  @override
  String get teamShareImageGenerating => 'Davet kartınız oluşturuluyor...';

  @override
  String teamShareImageError(String error) {
    return 'Kart paylaşılırken hata oluştu: $error. Bunun yerine metin olarak paylaşılıyor.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'ON Network ile dijital ağların geleceğini inşa ediyorum. Seni de takımımda görmek istiyorum! 🔥\n\nKatıldığında alacağın hoş geldin hediyen:\n✅ Anında 1 ÜCRETSİZ ON Coin\n✅ 24 Saatlik 2X Hızlandırma\n\nBaşlamak için davet kodumu kullan: $code\n\nYerini almak için şimdi katıl:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'ON Network\'teki takımıma katıl! Kodumu kullan: $code\n\nŞimdi katıl:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username seni katılmaya davet ediyor';
  }

  @override
  String get inviteCardTitle => 'YOLCULUĞUN BURADA BAŞLIYOR!';

  @override
  String get inviteCardUseCode => 'DAVET KODUMU KULLAN';

  @override
  String get inviteCardGiftTitle => 'HEMEN KATIL VE HOŞ GELDİN HEDİYENİ AL:';

  @override
  String get inviteCardGift1 => 'Anında 1 ÜCRETSİZ ON Coin';

  @override
  String get inviteCardGift2 => '24 Saatlik 2X Hız Yükseltmesi';

  @override
  String get inviteCardButton => 'KATILMAK VE ON\'UNU ALMAK İÇİN DOKUN!';

  @override
  String get marketplaceTitle => 'Pazaryeri: Yakında';

  @override
  String get marketplaceDescription =>
      'Kazandığınız ON coinleri kullanarak mal ve hizmet alıp satabileceğiniz merkeziyetsiz bir pazar yeri inşa ediyoruz.\n\nKazanmaya devam edin ve bakiyenizi oluşturun!';

  @override
  String get marketplaceCommunity => 'TOPLULUĞA KATILIN';

  @override
  String get marketplaceTooltipTelegram => 'Telegram\'a katılın';

  @override
  String get marketplaceTooltipTwitter => 'Bizi X\'te (Twitter) takip edin';

  @override
  String get marketplaceTooltipInstagram => 'Bizi Instagram\'da takip edin';

  @override
  String get marketplaceTooltipTikTok => 'Bizi TikTok\'ta izleyin';

  @override
  String get marketplaceTooltipWebsite => 'Web sitemizi ziyaret edin';

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get profileUsername => 'Kullanıcı Adı';

  @override
  String get profileErrorUsernameLength =>
      'Kullanıcı adı en az 4 karakter olmalıdır';

  @override
  String get profileErrorUsernameTaken =>
      'Bu kullanıcı adı zaten alınmış. Lütfen başka bir tane deneyin.';

  @override
  String get profileUsernameUpdated => 'Kullanıcı adı güncellendi!';

  @override
  String get profileImageUploadFailed => 'Resim yüklemesi başarısız oldu.';

  @override
  String get profileImageUploadSuccess => 'Profil resmi güncellendi!';

  @override
  String profileErrorImageSave(String error) {
    return 'Resim URL\'si kaydedilemedi: $error';
  }

  @override
  String get profileSectionCommunity => 'Topluluk';

  @override
  String profileInviteCode(String code) {
    return 'Davet Kodun: $code';
  }

  @override
  String get profileShare => 'Paylaşmak için dokun';

  @override
  String get profileCopyCode => 'Kodu Kopyala';

  @override
  String get profileCopyCodeSubtitle => 'Davet kodunuzu panoya kopyalayın';

  @override
  String get profileCopyCodeSuccess => 'Davet kodu panoya kopyalandı!';

  @override
  String get profileTelegram => 'Telegram\'a Katılın';

  @override
  String get profileTelegramSubtitle =>
      'Haberleri alın ve toplulukla sohbet edin';

  @override
  String get profileTwitter => 'Bizi X\'te (Twitter) Takip Edin';

  @override
  String get profileTwitterSubtitle => 'Duyurulardan haberdar olun';

  @override
  String get profileInstagram => 'Bizi Instagram\'da Takip Edin';

  @override
  String get profileInstagramSubtitle => 'Yolculuğumuzu görün';

  @override
  String get profileTikTok => 'Bizi TikTok\'ta İzleyin';

  @override
  String get profileTikTokSubtitle => 'En son güncellemeler ve klipler';

  @override
  String get profileWebsite => 'Web Sitemizi Ziyaret Edin';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Ayarlar & Güvenlik';

  @override
  String get profileNotifSettings => 'Bildirim Ayarları';

  @override
  String get profileNotifSettingsSubtitle =>
      'Uygulama bildirimlerinizi yönetin';

  @override
  String get profileChangePassword => 'Şifre Değiştir';

  @override
  String get profileChangePasswordSubtitle =>
      'Şifre sıfırlama e-postası gönder';

  @override
  String get profileChangePasswordSuccess =>
      'Şifre sıfırlama e-postası gönderildi. Gelen kutunuzu kontrol edin!';

  @override
  String get profileSectionAbout => 'Hakkında';

  @override
  String get profileProjectInfo => 'Proje Bilgisi & Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Vizyonumuzu ve yol haritamızı öğrenin';

  @override
  String get profileTerms => 'Hizmet Şartları';

  @override
  String get profileTermsSubtitle => 'Şartlar ve koşullarımızı okuyun';

  @override
  String get profilePrivacy => 'Gizlilik Politikası';

  @override
  String get profilePrivacySubtitle =>
      'Verilerinizi nasıl işlediğimizi öğrenin';

  @override
  String get profileSectionDanger => 'Tehlikeli Bölge';

  @override
  String get profileDeleteAccount => 'Hesabı Sil';

  @override
  String get profileDeleteAccountSubtitle =>
      'Hesabınızı ve tüm verilerinizi kalıcı olarak silin';

  @override
  String get profileDeleteAccountDialogTitle => 'Gerçekten emin misiniz?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Bu işlem geri alınamaz.\n\nON coin bakiyeniz ve takım bağlantılarınız da dahil olmak üzere tüm verileriniz kalıcı olarak silinecektir. Bu işlem geri alınamaz.';

  @override
  String get profileDeleteAccountDialogButton => 'Hesabımı Sil';

  @override
  String get profileDeleteAccountSuccess => 'Hesap kalıcı olarak silindi.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Hesap silinirken hata oluştu: $error';
  }

  @override
  String get profileSignOut => 'Çıkış Yap';

  @override
  String profileSignOutError(String error) {
    return 'Çıkış yapılırken hata oluştu: $error';
  }

  @override
  String get settingsTitle => 'Bildirim Ayarları';

  @override
  String get settingsMiningTitle => 'Kazanma Oturumu Hatırlatıcıları';

  @override
  String get settingsMiningSubtitle =>
      '24 saatlik oturumunuz sona erdiğinde bildirim alın.';

  @override
  String get settingsTeamTitle => 'Takım Hatırlatıcıları';

  @override
  String get settingsTeamSubtitle =>
      'Takım üyelerinizin kazanmayı başlatmanız için sizi \"dürtmesine\" izin verin.';

  @override
  String get settingsAdBoostTitle => 'Reklam Hızlandırma Hatırlatıcıları';

  @override
  String get settingsAdBoostSubtitle =>
      '1.5X Reklam Hızlandırmanız sona erdiğinde bildirim alın.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Ayarlar güncellenemedi: $error';
  }

  @override
  String get projectInfoTitle => 'Vizyonumuz';

  @override
  String get projectInfoSection1Title => 'ON Network Nedir?';

  @override
  String get projectInfoSection1Content =>
      'ON Network, gelecek için tasarlanmış merkeziyetsiz bir dijital ekosistemdir. Her 24 saatte bir düğmeye dokunarak, bir insan Öncü olarak varlığınızı doğruluyor ve ağın güvenliğine ve büyümesine katkıda bulunuyorsunuz. Karşılığında, ağımızın yerel dijital para birimi olan ON kazanırsınız.';

  @override
  String get projectInfoSection2Title => 'ON Coin\'in İşlevi';

  @override
  String get projectInfoSection2Content =>
      'Kazandığınız ON Coin\'ler şu anda sizin gibi erken dönem Öncülere dağıtılıyor. Ağ büyüdükçe, ON\'un birincil amacı gelecekteki Pazaryeri\'ndeki işlemleri kolaylaştırmak ve ağ işlevlerini desteklemek olacaktır. Ağ büyüdükçe kazanma oranı azalır, bu da topluluğun oluşturulmasına erken katılımı ödüllendirir.';

  @override
  String get projectInfoSection3Title => 'Yol Haritamız';

  @override
  String get projectInfoRoadmap1Title => 'Faz 1: Öncüler (Şu an buradasınız)';

  @override
  String get projectInfoRoadmap1Content =>
      'Ağı 0\'dan 1 milyon Öncüye büyütmek. Etkileşim yoluyla ON coin dağıtmak.';

  @override
  String get projectInfoRoadmap2Title => 'Faz 2: Pazaryeri';

  @override
  String get projectInfoRoadmap2Content =>
      'Üyelerin kazandıkları ON Coin\'leri kullanarak mal ve hizmet alışverişi yapabilecekleri ON Pazaryeri\'ni başlatmak.';

  @override
  String get projectInfoRoadmap3Title => 'Faz 3: Ana Ağ & Borsa';

  @override
  String get projectInfoRoadmap3Content =>
      'Tamamen merkeziyetsiz bir blok zincirine (Ana Ağ) geçiş yapmak ve ON işlevselliğini büyük kripto para platformlarında (uyumluluğa tabi olarak) etkinleştirmek.';

  @override
  String get settingsLangTitle => 'Dil';

  @override
  String get settingsLangSubtitle => 'Uygulama dilini değiştir';

  @override
  String get marketplaceTooltipEmail => 'Destekle İletişime Geç';

  @override
  String get profileEmail => 'Destekle İletişime Geç';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Bizi Facebook\'ta takip edin';

  @override
  String get marketplaceTooltipYoutube => 'YouTube kanalımıza abone olun';

  @override
  String get profileFacebook => 'Bizi Facebook\'ta takip edin';

  @override
  String get profileFacebookSubtitle => 'Güncellemelerimizi ve topluluğu görün';

  @override
  String get profileYoutube => 'YouTube kanalımıza abone olun';

  @override
  String get profileYoutubeSubtitle =>
      'Proje güncellemelerini ve eğitimleri izleyin';
}
