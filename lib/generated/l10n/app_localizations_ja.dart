// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get helloWorld => 'こんにちは、世界！';

  @override
  String get updateRequiredTitle => 'アップデートが必要です';

  @override
  String get updateRequiredMessage =>
      'ON Networkの新しい改良版が利用可能です。収益を得続けるには、アプリをアップデートする必要があります。';

  @override
  String get updateNowButton => '今すぐアップデート';

  @override
  String get navHome => 'ホーム';

  @override
  String get navTeam => 'チーム';

  @override
  String get navMarketplace => 'マーケット';

  @override
  String get navProfile => 'プロフィール';

  @override
  String get authWelcomeBack => 'おかえりなさい！';

  @override
  String get authCreateAccount => 'アカウントを作成';

  @override
  String get authEmail => 'メールアドレス';

  @override
  String get authErrorEmailEmpty => 'メールアドレスを入力してください';

  @override
  String get authErrorEmailInvalid => '有効なメールアドレスを入力してください';

  @override
  String get authPassword => 'パスワード';

  @override
  String get authErrorPasswordEmpty => 'パスワードを入力してください';

  @override
  String get authErrorPasswordLength => 'パスワードは6文字以上である必要があります';

  @override
  String get authConfirmPassword => 'パスワードを確認';

  @override
  String get authErrorConfirmPasswordEmpty => 'パスワードを確認してください';

  @override
  String get authErrorPasswordsNoMatch => 'パスワードが一致しません';

  @override
  String get authUsername => 'ユーザー名';

  @override
  String get authUsernameHint => '3文字以上である必要があります';

  @override
  String get authErrorUsernameLength => 'ユーザー名は3文字以上である必要があります。';

  @override
  String get authInviteCode => '招待コード (任意)';

  @override
  String get authInviteCodeHint => '例: A41DB9X1';

  @override
  String get authAgeConfirmation => '私は18歳以上であり、法的に本サービスを利用する資格があります。';

  @override
  String get authTermsConfirmationPrefix => '私は';

  @override
  String get authTermsOfService => '利用規約';

  @override
  String get authTermsConfirmationMid => 'および';

  @override
  String get authPrivacyPolicy => 'プライバシーポリシー';

  @override
  String get authTermsConfirmationSuffix => 'を読み、同意します。';

  @override
  String get authErrorAge => 'ON Networkを利用するには18歳以上である必要があります。';

  @override
  String get authErrorTerms => '利用規約とプライバシーポリシーに同意する必要があります。';

  @override
  String get authLogin => 'ログイン';

  @override
  String get authRegister => '登録';

  @override
  String get authSignInWithGoogle => 'Googleでサインイン';

  @override
  String get authSignUpWithGoogle => 'Googleで登録';

  @override
  String get authSwitchToRegister => 'アカウントをお持ちではありませんか？ 登録';

  @override
  String get authSwitchToLogin => 'すでにアカウントをお持ちですか？ ログイン';

  @override
  String get authForgotPassword => 'パスワードをお忘れですか？';

  @override
  String get authResetPassword => 'パスワードをリセット';

  @override
  String get authEnterEmailHint => 'メールアドレスを入力';

  @override
  String get authCancel => 'キャンセル';

  @override
  String get authSendResetLink => 'リセットリンクを送信';

  @override
  String get authResetLinkSent => 'パスワードリセット用のリンクをメールアドレスに送信しました。';

  @override
  String get onboardingWelcomeTitle => 'ON Networkへようこそ';

  @override
  String get onboardingWelcomeDesc =>
      'あなたは今、新しいデジタルエコシステムのパイオニアです。あなたの旅は今日から始まります。';

  @override
  String get onboardingMineTitle => 'タップしてマイニング';

  @override
  String get onboardingMineDesc =>
      '24時間ごとに電源ボタンをタップして、あなたが人間であることを証明し、ONコインを獲得しましょう。';

  @override
  String get onboardingTeamTitle => 'チームを構築';

  @override
  String get onboardingTeamDesc =>
      '友達を招待してチームに参加してもらいましょう。アクティブなメンバーが多いほど、より速く稼ぐことができます。';

  @override
  String get onboardingStart => '始めましょう！';

  @override
  String get onboardingNext => '次へ';

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
    return 'データの読み込みエラー。接続を確認して、もう一度お試しください。\n詳細: $error';
  }

  @override
  String get homeStatsBaseRate => 'ベースレート';

  @override
  String get homeStatsBaseRateSubtitle => '現在の基本速度';

  @override
  String get homeStatsBaseRateInfoTitle => 'ベースレート';

  @override
  String get homeStatsBaseRateInfo =>
      'これは現在の基本獲得速度です。ネットワークが成長するにつれて、半減期スケジュールに従い、すべてのユーザーのレートが世界的に減少します。';

  @override
  String get homeStatsEffectiveRate => '実効レート';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2Xブースト中!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5Xブースト中!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return 'チームから+$bonus ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => '実効レート';

  @override
  String get homeStatsEffectiveRateInfo =>
      '現在の総獲得速度:\nベースレート + (アクティブなチームメンバー * あなたのボーナスティア% * ベースレート)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 現在、2Xスターターブースト中です！';

  @override
  String get homeStatsEffectiveRateInfoAdBoost => '\n\n⏱️ 広告ブーストが有効です！';

  @override
  String get homeStatsGlobalMined => '総採掘量';

  @override
  String get homeStatsGlobalMinedInfoTitle => '総採掘量';

  @override
  String get homeStatsGlobalMinedInfo =>
      '全世界のパイオニアによって採掘されたONコインの総量。初期目標は10億ONです。';

  @override
  String get homeStatsNextHalving => '次の半減期';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return '現在: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => '獲得レートの半減期';

  @override
  String get homeStatsNextHalvingInfo =>
      '参加するパイオニアが増えるにつれて、基本獲得レートは世界的に減少します。あなたの個人ベースレートもそれに応じて更新されます。\n\n**フェーズ1：パイオニア (0 - 10万人)**\n• 0 - 1万人: 1.00 ON/時\n• 1万 - 2万人: 0.95 ON/時\n• 2万 - 3万人: 0.90 ON/時\n• 3万 - 4万人: 0.85 ON/時\n• 5万 - 6万人: 0.80 ON/時\n• 6万 - 7万人: 0.75 ON/時\n• 7万 - 8万人: 0.70 ON/時\n• 8万 - 9万人: 0.65 ON/時\n• 9万 - 10万人: 0.60 ON/時\n• 9万 - 10万人: 0.55 ON/時\n\n**フェーズ2：アンバサダー (10万 - 100万人)**\n• 10万 - 20万人: 0.45 ON/時\n• 20万 - 30万人: 0.40 ON/時\n• 30万 - 40万人: 0.34 ON/時\n• 40万 - 50万人: 0.28 ON/時\n• 50万 - 60万人: 0.21 ON/時\n• 60万 - 70万人: 0.15 ON/時\n• 70万 - 80万人: 0.10 ON/時\n• 80万 - 90万人: 0.06 ON/時\n• 90万 - 100万人: 0.03 ON/時\n\n**フェーズ3：ガーディアン (100万人以上)**\n• 100万 - 200万人: 0.01 ON/時\n• 200万人以上: 0.005 ON/時 (最終レガシーレート)\n\n実効レートは、アクティブなチームメンバーに基づき、現在のティア（スタンダード25%、ブロンズ27%、シルバー30%、ゴールド35%）がアクティブなメンバーごとにあなたの現在のベースレートに適用されて増加します。';

  @override
  String get homeStatsMainnet => 'メインネット';

  @override
  String get homeStatsMainnetInfoTitle => 'メインネットカウントダウン';

  @override
  String get homeStatsMainnetInfo =>
      'これはメインネットローンチの予定日です。この時点で、ONコインの配布（獲得）は停止し、ONマーケットプレイスが完全に稼働します。';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return '$count人のアクティブメンバーと$rate ON/時$boostで獲得中';
  }

  @override
  String get homeMiningStatusClaim => 'ボタンをタップして前回のセッション報酬を受け取り、新しく開始しましょう！';

  @override
  String get homeMiningStatusStart => 'ボタンをタップして獲得を開始しましょう！';

  @override
  String get homeMiningButtonActive => 'アクティブ';

  @override
  String get homeMiningStarterBoost => 'スターターブースト発動中！ (2X スピード)';

  @override
  String homeMiningAdBoost(String duration) {
    return '広告ブースト有効中: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return '1.5Xブーストのために広告を見る (残り$count回)';
  }

  @override
  String get homeMiningAdLoading => 'ブースト広告を読み込み中...';

  @override
  String get homeMiningAdLoadingShort => '広告ブーストを読み込み中...';

  @override
  String get homeMiningAdLimit => '1日の広告ブースト上限に達しました。';

  @override
  String get homeActivateSnackbar => '獲得セッションを開始しています...';

  @override
  String get homeActivatedSnackbar => '獲得セッションが開始されました！前回のセッションの収益が追加されました。';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'あなたのチーム';

  @override
  String get teamRefreshTooltip => 'チームを更新';

  @override
  String get teamRefreshSnackbar => 'チームデータを更新しています...';

  @override
  String get teamErrorInviteCode => '招待コードを読み込めませんでした';

  @override
  String teamInviteCode(String code) {
    return 'あなたの招待コード: $code';
  }

  @override
  String get teamErrorLoading => 'チームメンバーを読み込めませんでした。\n接続を確認してください。';

  @override
  String teamYourContribution(String rate) {
    return 'あなたの貢献: +$rate ON/時';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'あなたのボーナスティア: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return '次の目標: $goal';
  }

  @override
  String get teamNextGoalMax => '最大ティアに到達しました！';

  @override
  String teamNextGoalBronze(Object count) {
    return 'ブロンズ (27%) まであと$count人';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return 'シルバー (30%) まであと$count人';
  }

  @override
  String teamNextGoalGold(Object count) {
    return 'ゴールド (35%) まであと$count人';
  }

  @override
  String teamMemberCount(String total, String active) {
    return '現在のチームメンバー: $total人 ($active人アクティブ)';
  }

  @override
  String get teamInviteButton => '新しいメンバーを招待';

  @override
  String get teamEmptyTitle => 'あなたのチームには誰もいません。';

  @override
  String get teamEmptyDescription => 'コードを使って友達を招待し、チームを作ってマイニングレートを上げましょう！';

  @override
  String get teamMemberActive => 'アクティブ';

  @override
  String get teamMemberInactive => '非アクティブ';

  @override
  String get teamMemberTapToRemind => 'タップして通知';

  @override
  String get teamMemberTooltipReport => 'ユーザーを報告';

  @override
  String get teamMemberTooltipRemind => 'ユーザーに通知';

  @override
  String teamRemindSnackbar(String username) {
    return '$usernameに通知を送信中...';
  }

  @override
  String teamRemindError(String error) {
    return '通知の送信に失敗しました: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return '$usernameに通知を送信しました！';
  }

  @override
  String teamReportDialogTitle(String username) {
    return '$usernameを報告';
  }

  @override
  String get teamReportDialogContent =>
      '不適切なコンテンツ（例：ユーザー名やプロフィール写真）のため、このユーザーを本当に報告しますか？\n\nこれにより、審査のためにモデレーションチームに通知が送信されます。';

  @override
  String get teamReportDialogButton => '報告';

  @override
  String teamReportSnackbar(String username) {
    return '$usernameの報告を送信中...';
  }

  @override
  String get teamReportSuccess => '報告が送信されました。チームが間もなく確認します。';

  @override
  String teamReportError(String error) {
    return '報告の送信に失敗しました: $error';
  }

  @override
  String get teamShareTitle => '招待を共有';

  @override
  String get teamShareSubtitle => 'どのように招待を共有しますか？';

  @override
  String get teamShareImageButton => '画像カードとして共有';

  @override
  String get teamShareTextButton => 'テキストとして共有';

  @override
  String get teamShareImageGenerating => '招待カードを生成中...';

  @override
  String teamShareImageError(String error) {
    return 'カードの共有エラー: $error。代わりにテキストとして共有します。';
  }

  @override
  String teamShareTextMessage(String code) {
    return '私はON Networkでデジタルの未来を築いています。あなたもチームに参加しませんか！🔥\n\n参加ウェルカムギフトはこちら:\n✅ 1 ONコインをすぐにプレゼント\n✅ 24時間 2X スピードブースト\n\n招待コードを使って始めましょう: $code\n\n今すぐ参加してあなたの場所を確保しましょう:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'ON Networkで私のチームに参加しよう！私のコードを使ってください: $code\n\n今すぐ参加:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$usernameがあなたを招待しています';
  }

  @override
  String get inviteCardTitle => 'あなたの旅はここから始まる！';

  @override
  String get inviteCardUseCode => '私の招待コードを使用';

  @override
  String get inviteCardGiftTitle => '今すぐ参加してウェルカムギフトをゲット:';

  @override
  String get inviteCardGift1 => '1 ONコインをすぐにプレゼント';

  @override
  String get inviteCardGift2 => '24時間 2X スピードブースト';

  @override
  String get inviteCardButton => 'タップして参加＆ONを獲得！';

  @override
  String get marketplaceTitle => 'マーケットプレイス: 近日公開';

  @override
  String get marketplaceDescription =>
      '私たちは、獲得したONコインを使用して商品やサービスを売買できる分散型マーケットプレイスを構築しています。\n\nマイニングを続けて残高を増やしましょう！';

  @override
  String get marketplaceCommunity => 'コミュニティに参加';

  @override
  String get marketplaceTooltipTelegram => 'Telegramに参加';

  @override
  String get marketplaceTooltipTwitter => 'X (Twitter)でフォロー';

  @override
  String get marketplaceTooltipInstagram => 'Instagramでフォロー';

  @override
  String get marketplaceTooltipTikTok => 'TikTokで視聴';

  @override
  String get marketplaceTooltipWebsite => 'ウェブサイトを見る';

  @override
  String get profileScreenTitle => 'プロフィール';

  @override
  String get profileUsername => 'ユーザー名';

  @override
  String get profileErrorUsernameLength => 'ユーザー名は4文字以上である必要があります';

  @override
  String get profileErrorUsernameTaken => 'このユーザー名はすでに使用されています。別の名前をお試しください。';

  @override
  String get profileUsernameUpdated => 'ユーザー名が更新されました！';

  @override
  String get profileImageUploadFailed => '画像のアップロードに失敗しました。';

  @override
  String get profileImageUploadSuccess => 'プロフィール写真が更新されました！';

  @override
  String profileErrorImageSave(String error) {
    return '画像URLの保存に失敗しました: $error';
  }

  @override
  String get profileSectionCommunity => 'コミュニティ';

  @override
  String profileInviteCode(String code) {
    return 'あなたの招待コード: $code';
  }

  @override
  String get profileShare => 'タップして共有';

  @override
  String get profileCopyCode => 'コードをコピー';

  @override
  String get profileCopyCodeSubtitle => '招待コードをクリップボードにコピーします';

  @override
  String get profileCopyCodeSuccess => '招待コードをクリップボードにコピーしました！';

  @override
  String get profileTelegram => 'Telegramに参加';

  @override
  String get profileTelegramSubtitle => 'ニュースを入手し、コミュニティとチャット';

  @override
  String get profileTwitter => 'X (Twitter)でフォロー';

  @override
  String get profileTwitterSubtitle => '最新のお知らせをチェック';

  @override
  String get profileInstagram => 'Instagramでフォロー';

  @override
  String get profileInstagramSubtitle => '私たちの歩みを見る';

  @override
  String get profileTikTok => 'TikTokで視聴';

  @override
  String get profileTikTokSubtitle => '最新のアップデートとクリップ';

  @override
  String get profileWebsite => 'ウェブサイトを見る';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => '設定とセキュリティ';

  @override
  String get profileNotifSettings => '通知設定';

  @override
  String get profileNotifSettingsSubtitle => 'アプリの通知を管理します';

  @override
  String get profileChangePassword => 'パスワードを変更';

  @override
  String get profileChangePasswordSubtitle => 'パスワードリセットメールを送信';

  @override
  String get profileChangePasswordSuccess =>
      'パスワードリセットメールを送信しました。受信トレイを確認してください！';

  @override
  String get profileSectionAbout => '概要';

  @override
  String get profileProjectInfo => 'プロジェクト情報とホワイトペーパー';

  @override
  String get profileProjectInfoSubtitle => '私たちのビジョンとロードマップについて学ぶ';

  @override
  String get profileTerms => '利用規約';

  @override
  String get profileTermsSubtitle => '利用規約をお読みください';

  @override
  String get profilePrivacy => 'プライバシーポリシー';

  @override
  String get profilePrivacySubtitle => 'データの取り扱い方法';

  @override
  String get profileSectionDanger => '危険ゾーン';

  @override
  String get profileDeleteAccount => 'アカウントを削除';

  @override
  String get profileDeleteAccountSubtitle => 'アカウントとすべてのデータを完全に削除します';

  @override
  String get profileDeleteAccountDialogTitle => '本当によろしいですか？';

  @override
  String get profileDeleteAccountDialogContent =>
      'この操作は元に戻すことはできません。\n\nONコインの残高やチーム接続を含むすべてのデータが完全に削除されます。これは元に戻せません。';

  @override
  String get profileDeleteAccountDialogButton => 'アカウントを削除';

  @override
  String get profileDeleteAccountSuccess => 'アカウントは完全に削除されました。';

  @override
  String profileDeleteAccountError(String error) {
    return 'アカウントの削除中にエラーが発生しました: $error';
  }

  @override
  String get profileSignOut => 'サインアウト';

  @override
  String profileSignOutError(String error) {
    return 'サインアウト中にエラーが発生しました: $error';
  }

  @override
  String get settingsTitle => '通知設定';

  @override
  String get settingsMiningTitle => 'マイニングセッションのリマインダー';

  @override
  String get settingsMiningSubtitle => '24時間のセッションが終了したときに通知を受け取ります。';

  @override
  String get settingsTeamTitle => 'チームリマインダー';

  @override
  String get settingsTeamSubtitle => 'チームメンバーがマイニングを開始するようにあなたに「合図」することを許可します。';

  @override
  String get settingsAdBoostTitle => '広告ブーストのリマインダー';

  @override
  String get settingsAdBoostSubtitle => '1.5X広告ブーストが期限切れになったときに通知を受け取ります。';

  @override
  String settingsErrorUpdate(String error) {
    return '設定の更新に失敗しました: $error';
  }

  @override
  String get projectInfoTitle => '私たちのビジョン';

  @override
  String get projectInfoSection1Title => 'ON Networkとは？';

  @override
  String get projectInfoSection1Content =>
      'ON Networkは、未来のために設計された分散型デジタルエコシステムです。24時間ごとにボタンをタップすることで、あなたは人間としての存在を証明し、ネットワークのセキュリティと成長に貢献します。その見返りとして、私たちのネットワークのネイティブデジタル通貨であるONを獲得します。';

  @override
  String get projectInfoSection2Title => 'ONコインのユーティリティ';

  @override
  String get projectInfoSection2Content =>
      'あなたが獲得しているONコインは、現在、あなたのような初期のパイオニアに配布されています。ネットワークが成長するにつれて、ONの主な目的は、将来のマーケットプレイスでの取引を容易にし、ネットワーク機能をサポートすることです。ネットワークが成長するにつれて獲得レートは低下し、コミュニティ構築への早期参加に報酬を与えます。';

  @override
  String get projectInfoSection3Title => '私たちのロードマップ';

  @override
  String get projectInfoRoadmap1Title => 'フェーズ1：パイオニア (現在地)';

  @override
  String get projectInfoRoadmap1Content =>
      'ネットワークを0から100万人のパイオニアに成長させます。エンゲージメントを通じてONコインを配布します。';

  @override
  String get projectInfoRoadmap2Title => 'フェーズ2：マーケットプレイス';

  @override
  String get projectInfoRoadmap2Content =>
      'メンバーが獲得したONコインを使用して商品やサービスを交換できるONマーケットプレイスを開始します。';

  @override
  String get projectInfoRoadmap3Title => 'フェーズ3：メインネットと取引所';

  @override
  String get projectInfoRoadmap3Content =>
      '完全に分散化されたブロックチェーン（メインネット）に移行し、主要な暗号通貨プラットフォームでONの機能を有効にします（コンプライアンスに従う）。';

  @override
  String get settingsLangTitle => '言語';

  @override
  String get settingsLangSubtitle => 'アプリの言語を変更する';

  @override
  String get marketplaceTooltipEmail => 'サポートに連絡';

  @override
  String get profileEmail => 'サポートに連絡';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Facebookでフォロー';

  @override
  String get marketplaceTooltipYoutube => 'YouTubeをチャンネル登録';

  @override
  String get profileFacebook => 'Facebookでフォロー';

  @override
  String get profileFacebookSubtitle => 'アップデートとコミュニティを見る';

  @override
  String get profileYoutube => 'YouTubeをチャンネル登録';

  @override
  String get profileYoutubeSubtitle => 'プロジェクトのアップデートとチュートリアルを見る';
}
