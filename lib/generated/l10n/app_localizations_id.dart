// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Indonesian (`id`).
class AppLocalizationsId extends AppLocalizations {
  AppLocalizationsId([String locale = 'id']) : super(locale);

  @override
  String get helloWorld => 'Halo Dunia!';

  @override
  String get updateRequiredTitle => 'Pembaruan Diperlukan';

  @override
  String get updateRequiredMessage =>
      'Versi ON Network yang baru dan lebih baik telah tersedia. Anda harus memperbarui aplikasi untuk terus menghasilkan.';

  @override
  String get updateNowButton => 'Perbarui Sekarang';

  @override
  String get navHome => 'Beranda';

  @override
  String get navTeam => 'Tim';

  @override
  String get navMarketplace => 'Market';

  @override
  String get navProfile => 'Profil';

  @override
  String get authWelcomeBack => 'Selamat Datang Kembali!';

  @override
  String get authCreateAccount => 'Buat Akun Anda';

  @override
  String get authEmail => 'Email';

  @override
  String get authErrorEmailEmpty => 'Silakan masukkan email';

  @override
  String get authErrorEmailInvalid =>
      'Silakan masukkan alamat email yang valid';

  @override
  String get authPassword => 'Kata Sandi';

  @override
  String get authErrorPasswordEmpty => 'Silakan masukkan kata sandi Anda';

  @override
  String get authErrorPasswordLength => 'Kata sandi minimal harus 6 karakter';

  @override
  String get authConfirmPassword => 'Konfirmasi Kata Sandi';

  @override
  String get authErrorConfirmPasswordEmpty =>
      'Silakan konfirmasi kata sandi Anda';

  @override
  String get authErrorPasswordsNoMatch => 'Kata sandi tidak cocok';

  @override
  String get authUsername => 'Nama Pengguna';

  @override
  String get authUsernameHint => 'Minimal harus 3 karakter';

  @override
  String get authErrorUsernameLength =>
      'Nama pengguna minimal harus 3 karakter.';

  @override
  String get authInviteCode => 'Kode Undangan (Opsional)';

  @override
  String get authInviteCodeHint => 'cth: A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'Saya berusia 18 tahun atau lebih dan secara hukum berhak menggunakan layanan ini.';

  @override
  String get authTermsConfirmationPrefix =>
      'Saya telah membaca dan menyetujui ';

  @override
  String get authTermsOfService => 'Ketentuan Layanan';

  @override
  String get authTermsConfirmationMid => ' dan ';

  @override
  String get authPrivacyPolicy => 'Kebijakan Privasi';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'Anda harus berusia 18 tahun atau lebih untuk menggunakan ON Network.';

  @override
  String get authErrorTerms =>
      'Anda harus menyetujui Ketentuan Layanan dan Kebijakan Privasi.';

  @override
  String get authLogin => 'Masuk';

  @override
  String get authRegister => 'Daftar';

  @override
  String get authSignInWithGoogle => 'Masuk dengan Google';

  @override
  String get authSignUpWithGoogle => 'Daftar dengan Google';

  @override
  String get authSwitchToRegister => 'Belum punya akun? Daftar';

  @override
  String get authSwitchToLogin => 'Sudah punya akun? Masuk';

  @override
  String get authForgotPassword => 'Lupa Kata Sandi?';

  @override
  String get authResetPassword => 'Atur Ulang Kata Sandi';

  @override
  String get authEnterEmailHint => 'Masukkan email Anda';

  @override
  String get authCancel => 'Batal';

  @override
  String get authSendResetLink => 'Kirim Tautan Atur Ulang';

  @override
  String get authResetLinkSent =>
      'Tautan atur ulang kata sandi telah dikirim ke email Anda.';

  @override
  String get onboardingWelcomeTitle => 'Selamat Datang di ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Anda sekarang adalah Perintis di ekosistem digital baru. Perjalanan Anda dimulai hari ini.';

  @override
  String get onboardingMineTitle => 'Ketuk untuk Menambang';

  @override
  String get onboardingMineDesc =>
      'Ketuk tombol daya setiap 24 jam untuk membuktikan bahwa Anda manusia dan dapatkan koin ON Anda.';

  @override
  String get onboardingTeamTitle => 'Bangun Tim Anda';

  @override
  String get onboardingTeamDesc =>
      'Undang teman Anda untuk bergabung dengan tim Anda. Semakin banyak anggota aktif yang Anda miliki, semakin cepat Anda menghasilkan.';

  @override
  String get onboardingStart => 'Mari Mulai!';

  @override
  String get onboardingNext => 'Lanjut';

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
    return 'Gagal memuat data. Periksa koneksi Anda dan coba lagi.\nDetail: $error';
  }

  @override
  String get homeStatsBaseRate => 'Tarif Dasar';

  @override
  String get homeStatsBaseRateSubtitle => 'Kecepatan dasar Anda saat ini';

  @override
  String get homeStatsBaseRateInfoTitle => 'Tarif Dasar';

  @override
  String get homeStatsBaseRateInfo =>
      'Ini adalah kecepatan penghasilan dasar Anda saat ini. Ini akan berkurang secara global untuk semua pengguna seiring pertumbuhan jaringan, sesuai dengan jadwal halving.';

  @override
  String get homeStatsEffectiveRate => 'Tarif Efektif';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (BOOST 2X!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (BOOST 1.5X!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus dari tim ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Tarif Efektif';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Total kecepatan penghasilan Anda saat ini:\nTarif Dasar + (Anggota Tim Aktif * % Tier Bonus Anda * Tarif Dasar)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 Anda sedang dalam 2X Starter Boost!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost => '\n\n⏱️ Boost Iklan Aktif!';

  @override
  String get homeStatsGlobalMined => 'Dunia Tertambang';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Dunia Tertambang';

  @override
  String get homeStatsGlobalMinedInfo =>
      'Jumlah total koin ON yang diperoleh oleh semua Perintis di seluruh dunia menuju tujuan awal 1 Miliar ON.';

  @override
  String get homeStatsNextHalving => 'Halving Berikutnya';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Saat ini: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Halving Tarif Penghasilan';

  @override
  String get homeStatsNextHalvingInfo =>
      'Tarif penghasilan dasar berkurang secara global seiring bertambahnya Perintis yang bergabung. Tarif dasar pribadi Anda akan diperbarui sesuai.\n\n**Fase 1: Perintis (0 - 100k)**\n• 0 - 10k:    1.00 ON/jam\n• 10k - 20k:  0.95 ON/jam\n• 20k - 30k:  0.90 ON/jam\n• 30k - 40k:  0.85 ON/jam\n• 50k - 60k:  0.80 ON/jam\n• 60k - 70k:  0.75 ON/jam\n• 70k - 80k:  0.70 ON/jam\n• 80k - 90k:  0.65 ON/jam\n• 90k - 100k: 0.60 ON/jam\n• 90k - 100k: 0.55 ON/jam\n\n**Fase 2: Duta (100k - 1M)**\n• 100k - 200k: 0.45 ON/jam\n• 200k - 300k: 0.40 ON/jam\n• 300k - 400k: 0.34 ON/jam\n• 400k - 500k: 0.28 ON/jam\n• 500k - 600k: 0.21 ON/jam\n• 600k - 700k: 0.15 ON/jam\n• 700k - 800k: 0.10 ON/jam\n• 800k - 900k: 0.06 ON/jam\n• 900k - 1M:   0.03 ON/jam\n\n**Fase 3: Penjaga (1M+)**\n• 1M - 2M: 0.01 ON/jam\n• 2M+ :    0.005 ON/jam (Tarif Warisan Akhir)\n\nTarif efektif Anda meningkat dengan anggota tim aktif berdasarkan tier Anda saat ini (Standar 25%, Perunggu 27%, Perak 30%, Emas 35%) diterapkan pada Tarif Dasar Anda saat ini per anggota aktif.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Hitung Mundur Mainnet';

  @override
  String get homeStatsMainnetInfo =>
      'Ini adalah tanggal yang dijadwalkan untuk peluncuran Mainnet kami. Pada titik ini, distribusi (penghasilan) koin ON akan berhenti dan ON Marketplace akan beroperasi penuh.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Menghasilkan $rate ON/jam$boost dengan $count anggota aktif';
  }

  @override
  String get homeMiningStatusClaim =>
      'Ketuk tombol untuk klaim penghasilan sesi terakhir & mulai baru!';

  @override
  String get homeMiningStatusStart => 'Ketuk tombol untuk mulai menghasilkan!';

  @override
  String get homeMiningButtonActive => 'AKTIF';

  @override
  String get homeMiningStarterBoost => 'Starter Boost Aktif! (Kecepatan 2X)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Boost Iklan aktif selama: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Tonton Iklan untuk 1.5X Boost (tersisa $count)';
  }

  @override
  String get homeMiningAdLoading => 'Memuat Iklan Boost...';

  @override
  String get homeMiningAdLoadingShort => 'Boost iklan sedang dimuat...';

  @override
  String get homeMiningAdLimit => 'Batas boost iklan harian tercapai.';

  @override
  String get homeActivateSnackbar => 'Mengaktifkan sesi penghasilan...';

  @override
  String get homeActivatedSnackbar =>
      'Sesi penghasilan diaktifkan! Penghasilan dari sesi terakhir ditambahkan.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Tim Anda';

  @override
  String get teamRefreshTooltip => 'Segarkan Tim';

  @override
  String get teamRefreshSnackbar => 'Menyegarkan data tim...';

  @override
  String get teamErrorInviteCode => 'Tidak dapat memuat kode undangan';

  @override
  String teamInviteCode(String code) {
    return 'Kode Undangan Anda: $code';
  }

  @override
  String get teamErrorLoading =>
      'Tidak dapat memuat anggota tim.\nSilakan periksa koneksi Anda.';

  @override
  String teamYourContribution(String rate) {
    return 'Kontribusi Anda: +$rate ON/jam';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Tier Bonus Anda: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Tujuan Berikutnya: $goal';
  }

  @override
  String get teamNextGoalMax => 'Tier Maksimal Tercapai!';

  @override
  String teamNextGoalBronze(Object count) {
    return '$count anggota lagi untuk Perunggu (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return '$count anggota lagi untuk Perak (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return '$count anggota lagi untuk Emas (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Anggota Tim Saat Ini: $total ($active aktif)';
  }

  @override
  String get teamInviteButton => 'Undang Anggota Baru';

  @override
  String get teamEmptyTitle => 'Tim Anda kosong.';

  @override
  String get teamEmptyDescription =>
      'Undang teman menggunakan kode Anda untuk membangun tim dan meningkatkan tarif penambangan Anda!';

  @override
  String get teamMemberActive => 'Sedang Aktif';

  @override
  String get teamMemberInactive => 'Tidak Aktif';

  @override
  String get teamMemberTapToRemind => 'Ketuk untuk Mengingatkan';

  @override
  String get teamMemberTooltipReport => 'Laporkan Pengguna';

  @override
  String get teamMemberTooltipRemind => 'Ingatkan Pengguna';

  @override
  String teamRemindSnackbar(String username) {
    return 'Mengirim pengingat ke $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Gagal mengirim pengingat: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Pengingat terkirim ke $username!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Laporkan $username';
  }

  @override
  String get teamReportDialogContent =>
      'Apakah Anda yakin ingin melaporkan pengguna ini karena konten yang tidak pantas (mis., nama pengguna atau gambar profil)?\n\nIni akan mengirimkan pemberitahuan ke tim moderasi kami untuk ditinjau.';

  @override
  String get teamReportDialogButton => 'Laporkan';

  @override
  String teamReportSnackbar(String username) {
    return 'Mengirimkan laporan untuk $username...';
  }

  @override
  String get teamReportSuccess =>
      'Laporan terkirim. Tim kami akan segera meninjaunya.';

  @override
  String teamReportError(String error) {
    return 'Gagal mengirimkan laporan: $error';
  }

  @override
  String get teamShareTitle => 'Bagikan Undangan Anda';

  @override
  String get teamShareSubtitle =>
      'Bagaimana Anda ingin membagikan undangan Anda?';

  @override
  String get teamShareImageButton => 'Bagikan sebagai Kartu Gambar';

  @override
  String get teamShareTextButton => 'Bagikan sebagai Teks';

  @override
  String get teamShareImageGenerating => 'Membuat kartu undangan Anda...';

  @override
  String teamShareImageError(String error) {
    return 'Gagal membagikan kartu: $error. Membagikan sebagai teks saja.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Saya sedang membangun masa depan jaringan digital dengan ON Network. Saya ingin Anda ada di tim saya! 🔥\n\nHadiah selamat datang untuk Anda:\n✅ 1 Koin ON GRATIS Langsung\n✅ 24 Jam 2X Speed Boost\n\nGunakan kode undangan saya untuk memulai: $code\n\nBergabung sekarang dan klaim tempat Anda:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Bergabunglah dengan tim saya di ON Network! Gunakan kode saya: $code\n\nBergabung sekarang:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username mengundang Anda untuk bergabung';
  }

  @override
  String get inviteCardTitle => 'PERJALANAN ANDA DIMULAI DI SINI!';

  @override
  String get inviteCardUseCode => 'GUNAKAN KODE UNDANGAN SAYA';

  @override
  String get inviteCardGiftTitle =>
      'GABUNG SEKARANG DAN DAPATKAN HADIAH SELAMAT DATANG:';

  @override
  String get inviteCardGift1 => '1 Koin ON GRATIS Langsung';

  @override
  String get inviteCardGift2 => '24 Jam 2X Speed Boost';

  @override
  String get inviteCardButton => 'KETUK UNTUK BERGABUNG & KLAIM ON ANDA!';

  @override
  String get marketplaceTitle => 'Marketplace: Segera Hadir';

  @override
  String get marketplaceDescription =>
      'Kami sedang membangun marketplace terdesentralisasi di mana Anda akan dapat membeli dan menjual barang dan jasa menggunakan koin ON yang Anda peroleh.\n\nTerus menambang dan kumpulkan saldo Anda!';

  @override
  String get marketplaceCommunity => 'GABUNG KOMUNITAS';

  @override
  String get marketplaceTooltipTelegram => 'Bergabunglah dengan Telegram kami';

  @override
  String get marketplaceTooltipTwitter => 'Ikuti kami di X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Ikuti kami di Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Tonton kami di TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Kunjungi Website kami';

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get profileUsername => 'Nama Pengguna';

  @override
  String get profileErrorUsernameLength =>
      'Nama pengguna minimal harus 4 karakter';

  @override
  String get profileErrorUsernameTaken =>
      'Nama pengguna ini sudah dipakai. Silakan coba yang lain.';

  @override
  String get profileUsernameUpdated => 'Nama pengguna diperbarui!';

  @override
  String get profileImageUploadFailed => 'Unggah gambar gagal.';

  @override
  String get profileImageUploadSuccess => 'Gambar profil diperbarui!';

  @override
  String profileErrorImageSave(String error) {
    return 'Gagal menyimpan URL gambar: $error';
  }

  @override
  String get profileSectionCommunity => 'Komunitas';

  @override
  String profileInviteCode(String code) {
    return 'Kode Undangan Anda: $code';
  }

  @override
  String get profileShare => 'Ketuk untuk membagikan';

  @override
  String get profileCopyCode => 'Salin Kode';

  @override
  String get profileCopyCodeSubtitle => 'Salin kode undangan Anda ke clipboard';

  @override
  String get profileCopyCodeSuccess => 'Kode undangan disalin ke clipboard!';

  @override
  String get profileTelegram => 'Gabung Telegram kami';

  @override
  String get profileTelegramSubtitle =>
      'Dapatkan berita dan obrolan dengan komunitas';

  @override
  String get profileTwitter => 'Ikuti kami di X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Tetap up-to-date dengan pengumuman';

  @override
  String get profileInstagram => 'Ikuti kami di Instagram';

  @override
  String get profileInstagramSubtitle => 'Lihat perjalanan kami';

  @override
  String get profileTikTok => 'Tonton kami di TikTok';

  @override
  String get profileTikTokSubtitle => 'Pembaruan dan klip terbaru';

  @override
  String get profileWebsite => 'Kunjungi Website Kami';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Pengaturan & Keamanan';

  @override
  String get profileNotifSettings => 'Pengaturan Notifikasi';

  @override
  String get profileNotifSettingsSubtitle => 'Kelola notifikasi aplikasi Anda';

  @override
  String get profileChangePassword => 'Ubah Kata Sandi';

  @override
  String get profileChangePasswordSubtitle =>
      'Kirim email atur ulang kata sandi';

  @override
  String get profileChangePasswordSuccess =>
      'Email atur ulang kata sandi terkirim. Periksa kotak masuk Anda!';

  @override
  String get profileSectionAbout => 'Tentang';

  @override
  String get profileProjectInfo => 'Info Proyek & Whitepaper';

  @override
  String get profileProjectInfoSubtitle => 'Pelajari visi dan roadmap kami';

  @override
  String get profileTerms => 'Ketentuan Layanan';

  @override
  String get profileTermsSubtitle => 'Baca syarat dan ketentuan kami';

  @override
  String get profilePrivacy => 'Kebijakan Privasi';

  @override
  String get profilePrivacySubtitle => 'Bagaimana kami menangani data Anda';

  @override
  String get profileSectionDanger => 'Zona Berbahaya';

  @override
  String get profileDeleteAccount => 'Hapus Akun';

  @override
  String get profileDeleteAccountSubtitle =>
      'Hapus akun Anda dan semua data secara permanen';

  @override
  String get profileDeleteAccountDialogTitle =>
      'Apakah Anda benar-benar yakin?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Tindakan ini tidak dapat dibatalkan.\n\nSemua data Anda, termasuk saldo koin ON dan koneksi tim, akan dihapus secara permanen. Ini tidak bisa dibatalkan.';

  @override
  String get profileDeleteAccountDialogButton => 'Hapus Akun Saya';

  @override
  String get profileDeleteAccountSuccess => 'Akun dihapus secara permanen.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Gagal menghapus akun: $error';
  }

  @override
  String get profileSignOut => 'Keluar';

  @override
  String profileSignOutError(String error) {
    return 'Gagal keluar: $error';
  }

  @override
  String get settingsTitle => 'Pengaturan Notifikasi';

  @override
  String get settingsMiningTitle => 'Pengingat Sesi Penambangan';

  @override
  String get settingsMiningSubtitle =>
      'Dapatkan notifikasi saat sesi 24 jam Anda berakhir.';

  @override
  String get settingsTeamTitle => 'Pengingat Tim';

  @override
  String get settingsTeamSubtitle =>
      'Izinkan anggota tim Anda untuk \"ping\" Anda untuk mulai menambang.';

  @override
  String get settingsAdBoostTitle => 'Pengingat Boost Iklan';

  @override
  String get settingsAdBoostSubtitle =>
      'Dapatkan notifikasi saat Boost Iklan 1.5X Anda berakhir.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Gagal memperbarui pengaturan: $error';
  }

  @override
  String get projectInfoTitle => 'Visi Kami';

  @override
  String get projectInfoSection1Title => 'Apa itu ON Network?';

  @override
  String get projectInfoSection1Content =>
      'ON Network adalah ekosistem digital terdesentralisasi yang dirancang untuk masa depan. Dengan mengetuk tombol setiap 24 jam, Anda memvalidasi kehadiran Anda sebagai Perintis manusia dan berkontribusi pada keamanan dan pertumbuhan jaringan. Sebagai imbalannya, Anda mendapatkan ON, mata uang digital asli jaringan kami.';

  @override
  String get projectInfoSection2Title => 'Utilitas Koin ON';

  @override
  String get projectInfoSection2Content =>
      'Koin ON yang Anda peroleh saat ini didistribusikan ke Perintis awal seperti Anda. Seiring pertumbuhan jaringan, tujuan utama ON adalah untuk memfasilitasi transaksi di Marketplace masa depan dan mendukung fungsi jaringan. Tarif penghasilan menurun seiring pertumbuhan jaringan, memberi penghargaan pada partisipasi awal dalam membangun komunitas.';

  @override
  String get projectInfoSection3Title => 'Roadmap Kami';

  @override
  String get projectInfoRoadmap1Title => 'Fase 1: Perintis (Anda di sini)';

  @override
  String get projectInfoRoadmap1Content =>
      'Menumbuhkan jaringan dari 0 hingga 1 juta Perintis. Mendistribusikan koin ON melalui keterlibatan.';

  @override
  String get projectInfoRoadmap2Title => 'Fase 2: Marketplace';

  @override
  String get projectInfoRoadmap2Content =>
      'Meluncurkan ON Marketplace di mana anggota dapat menukar barang dan jasa menggunakan Koin ON yang mereka peroleh.';

  @override
  String get projectInfoRoadmap3Title => 'Fase 3: Mainnet & Bursa';

  @override
  String get projectInfoRoadmap3Content =>
      'Transisi ke blockchain yang sepenuhnya terdesentralisasi (Mainnet) dan mengaktifkan fungsionalitas ON di platform cryptocurrency utama (tergantung kepatuhan).';

  @override
  String get settingsLangTitle => 'Bahasa';

  @override
  String get settingsLangSubtitle => 'Ubah bahasa aplikasi';

  @override
  String get marketplaceTooltipEmail => 'Hubungi Dukungan';

  @override
  String get profileEmail => 'Hubungi Dukungan';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Ikuti kami di Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Berlangganan YouTube kami';

  @override
  String get profileFacebook => 'Ikuti kami di Facebook';

  @override
  String get profileFacebookSubtitle => 'Lihat pembaruan dan komunitas kami';

  @override
  String get profileYoutube => 'Berlangganan YouTube kami';

  @override
  String get profileYoutubeSubtitle => 'Tonton pembaruan proyek dan tutorial';
}
