// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get helloWorld => '안녕하세요, 세계!';

  @override
  String get updateRequiredTitle => '업데이트 필요';

  @override
  String get updateRequiredMessage =>
      'ON Network의 새롭고 개선된 버전을 사용할 수 있습니다. 계속 수익을 얻으려면 앱을 업데이트해야 합니다.';

  @override
  String get updateNowButton => '지금 업데이트';

  @override
  String get navHome => '홈';

  @override
  String get navTeam => '팀';

  @override
  String get navMarketplace => '마켓';

  @override
  String get navProfile => '프로필';

  @override
  String get authWelcomeBack => '다시 오신 것을 환영합니다!';

  @override
  String get authCreateAccount => '계정 생성';

  @override
  String get authEmail => '이메일';

  @override
  String get authErrorEmailEmpty => '이메일을 입력하세요';

  @override
  String get authErrorEmailInvalid => '유효한 이메일 주소를 입력하세요';

  @override
  String get authPassword => '비밀번호';

  @override
  String get authErrorPasswordEmpty => '비밀번호를 입력하세요';

  @override
  String get authErrorPasswordLength => '비밀번호는 6자 이상이어야 합니다';

  @override
  String get authConfirmPassword => '비밀번호 확인';

  @override
  String get authErrorConfirmPasswordEmpty => '비밀번호를 확인하세요';

  @override
  String get authErrorPasswordsNoMatch => '비밀번호가 일치하지 않습니다';

  @override
  String get authUsername => '사용자 이름';

  @override
  String get authUsernameHint => '3자 이상이어야 합니다';

  @override
  String get authErrorUsernameLength => '사용자 이름은 3자 이상이어야 합니다.';

  @override
  String get authInviteCode => '초대 코드 (선택 사항)';

  @override
  String get authInviteCodeHint => '예: A41DB9X1';

  @override
  String get authAgeConfirmation => '본인은 18세 이상이며 본 서비스를 합법적으로 이용할 자격이 있습니다.';

  @override
  String get authTermsConfirmationPrefix => '';

  @override
  String get authTermsOfService => '이용약관';

  @override
  String get authTermsConfirmationMid => ' 및 ';

  @override
  String get authPrivacyPolicy => '개인정보 처리방침';

  @override
  String get authTermsConfirmationSuffix => '을(를) 읽고 동의합니다.';

  @override
  String get authErrorAge => 'ON Network를 이용하려면 18세 이상이어야 합니다.';

  @override
  String get authErrorTerms => '이용약관 및 개인정보 처리방침에 동의해야 합니다.';

  @override
  String get authLogin => '로그인';

  @override
  String get authRegister => '가입하기';

  @override
  String get authSignInWithGoogle => 'Google로 로그인';

  @override
  String get authSignUpWithGoogle => 'Google로 가입하기';

  @override
  String get authSwitchToRegister => '계정이 없으신가요? 가입하기';

  @override
  String get authSwitchToLogin => '이미 계정이 있으신가요? 로그인';

  @override
  String get authForgotPassword => '비밀번호를 잊으셨나요?';

  @override
  String get authResetPassword => '비밀번호 재설정';

  @override
  String get authEnterEmailHint => '이메일을 입력하세요';

  @override
  String get authCancel => '취소';

  @override
  String get authSendResetLink => '재설정 링크 보내기';

  @override
  String get authResetLinkSent => '비밀번호 재설정 링크가 이메일로 전송되었습니다.';

  @override
  String get onboardingWelcomeTitle => 'ON Network에 오신 것을 환영합니다';

  @override
  String get onboardingWelcomeDesc =>
      '이제 당신은 새로운 디지털 생태계의 선구자입니다. 당신의 여정은 오늘 시작됩니다.';

  @override
  String get onboardingMineTitle => '탭하여 채굴하기';

  @override
  String get onboardingMineDesc =>
      '24시간마다 전원 버튼을 탭하여 당신이 인간임을 증명하고 ON 코인을 획득하세요.';

  @override
  String get onboardingTeamTitle => '팀 구성하기';

  @override
  String get onboardingTeamDesc =>
      '친구들을 초대하여 팀에 합류시키세요. 활성 멤버가 많을수록 더 빨리 수익을 얻을 수 있습니다.';

  @override
  String get onboardingStart => '시작하기!';

  @override
  String get onboardingNext => '다음';

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
    return '데이터 로딩 오류. 연결을 확인하고 다시 시도하세요.\n상세: $error';
  }

  @override
  String get homeStatsBaseRate => '기본 속도';

  @override
  String get homeStatsBaseRateSubtitle => '현재 기본 속도';

  @override
  String get homeStatsBaseRateInfoTitle => '기본 속도';

  @override
  String get homeStatsBaseRateInfo =>
      '현재 기본 채굴 속도입니다. 네트워크가 성장함에 따라 반감기 일정에 따라 모든 사용자의 속도가 전 세계적으로 감소합니다.';

  @override
  String get homeStatsEffectiveRate => '유효 속도';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2배 부스트!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5배 부스트!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '팀으로부터 +$bonus ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => '유효 속도';

  @override
  String get homeStatsEffectiveRateInfo =>
      '현재 총 채굴 속도:\n기본 속도 + (활성 팀원 수 * 보너스 등급 % * 기본 속도)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 현재 2배 스타터 부스트가 적용 중입니다!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost => '\n\n⏱️ 광고 부스트가 활성화되었습니다!';

  @override
  String get homeStatsGlobalMined => '총 채굴량';

  @override
  String get homeStatsGlobalMinedInfoTitle => '총 채굴량';

  @override
  String get homeStatsGlobalMinedInfo =>
      '초기 목표인 10억 ON을 향해 전 세계 모든 선구자가 채굴한 ON 코인의 총량입니다.';

  @override
  String get homeStatsNextHalving => '다음 반감기';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return '현재: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => '채굴 속도 반감기';

  @override
  String get homeStatsNextHalvingInfo =>
      '더 많은 선구자가 참여함에 따라 기본 채굴 속도가 전 세계적으로 감소합니다. 개인 기본 속도도 이에 따라 업데이트됩니다.\n\n**단계 1: 파이오니어 (0 - 10만)**\n• 0 - 1만: 1.00 ON/시간\n• 1만 - 2만: 0.95 ON/시간\n• 2만 - 3만: 0.90 ON/시간\n• 3만 - 4만: 0.85 ON/시간\n• 5만 - 6만: 0.80 ON/시간\n• 6만 - 7만: 0.75 ON/시간\n• 7만 - 8만: 0.70 ON/시간\n• 8만 - 9만: 0.65 ON/시간\n• 9만 - 10만: 0.60 ON/시간\n• 9만 - 10만: 0.55 ON/시간\n\n**단계 2: 앰버서더 (10만 - 100만)**\n• 10만 - 20만: 0.45 ON/시간\n• 20만 - 30만: 0.40 ON/시간\n• 30만 - 40만: 0.34 ON/시간\n• 40만 - 50만: 0.28 ON/시간\n• 50만 - 60만: 0.21 ON/시간\n• 60만 - 70만: 0.15 ON/시간\n• 70만 - 80만: 0.10 ON/시간\n• 80만 - 90만: 0.06 ON/시간\n• 90만 - 100만: 0.03 ON/시간\n\n**단계 3: 가디언 (100만 이상)**\n• 100만 - 200만: 0.01 ON/시간\n• 200만 이상: 0.005 ON/시간 (최종 레거시 속도)\n\n유효 속도는 현재 등급(스탠다드 25%, 브론즈 27%, 실버 30%, 골드 35%)에 따라 활성 팀원 1인당 현재 기본 속도에 적용되어 증가합니다.';

  @override
  String get homeStatsMainnet => '메인넷';

  @override
  String get homeStatsMainnetInfoTitle => '메인넷 카운트다운';

  @override
  String get homeStatsMainnetInfo =>
      '메인넷 출시 예정일입니다. 이 시점에 ON 코인 배포(채굴)가 중단되고 ON 마켓플레이스가 완전히 운영됩니다.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return '$count명의 활성 멤버와 함께 시간당 $rate ON$boost 채굴 중';
  }

  @override
  String get homeMiningStatusClaim => '버튼을 탭하여 지난 세션 수익을 받고 새 세션을 시작하세요!';

  @override
  String get homeMiningStatusStart => '버튼을 탭하여 채굴을 시작하세요!';

  @override
  String get homeMiningButtonActive => '활성';

  @override
  String get homeMiningStarterBoost => '스타터 부스트 활성 중! (2배 속도)';

  @override
  String homeMiningAdBoost(String duration) {
    return '광고 부스트 활성: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return '1.5배 부스트 광고 보기 (남은 횟수: $count회)';
  }

  @override
  String get homeMiningAdLoading => '부스트 광고 로딩 중...';

  @override
  String get homeMiningAdLoadingShort => '광고 부스트 로딩 중...';

  @override
  String get homeMiningAdLimit => '일일 광고 부스트 한도에 도달했습니다.';

  @override
  String get homeActivateSnackbar => '채굴 세션을 활성화하는 중...';

  @override
  String get homeActivatedSnackbar => '채굴 세션이 활성화되었습니다! 지난 세션의 수익이 추가되었습니다.';

  @override
  String get homeDialogOK => '확인';

  @override
  String get teamScreenTitle => '나의 팀';

  @override
  String get teamRefreshTooltip => '팀 새로고침';

  @override
  String get teamRefreshSnackbar => '팀 데이터를 새로고침하는 중...';

  @override
  String get teamErrorInviteCode => '초대 코드를 불러올 수 없습니다';

  @override
  String teamInviteCode(String code) {
    return '나의 초대 코드: $code';
  }

  @override
  String get teamErrorLoading => '팀원을 불러올 수 없습니다.\n연결을 확인하세요.';

  @override
  String teamYourContribution(String rate) {
    return '나의 기여: +$rate ON/시간';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return '나의 보너스 등급: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return '다음 목표: $goal';
  }

  @override
  String get teamNextGoalMax => '최고 등급에 도달했습니다!';

  @override
  String teamNextGoalBronze(Object count) {
    return '브론즈 (27%)까지 $count명 남음';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return '실버 (30%)까지 $count명 남음';
  }

  @override
  String teamNextGoalGold(Object count) {
    return '골드 (35%)까지 $count명 남음';
  }

  @override
  String teamMemberCount(String total, String active) {
    return '현재 팀원: $total명 ($active명 활성)';
  }

  @override
  String get teamInviteButton => '새 멤버 초대하기';

  @override
  String get teamEmptyTitle => '팀이 비어있습니다.';

  @override
  String get teamEmptyDescription => '코드를 사용하여 친구를 초대하고 팀을 구성하여 채굴 속도를 높이세요!';

  @override
  String get teamMemberActive => '활성 중';

  @override
  String get teamMemberInactive => '비활성';

  @override
  String get teamMemberTapToRemind => '탭하여 알림 보내기';

  @override
  String get teamMemberTooltipReport => '사용자 신고하기';

  @override
  String get teamMemberTooltipRemind => '사용자에게 알림 보내기';

  @override
  String teamRemindSnackbar(String username) {
    return '$username님에게 알림을 보내는 중...';
  }

  @override
  String teamRemindError(String error) {
    return '알림 전송 실패: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return '$username님에게 알림을 보냈습니다!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return '$username님 신고하기';
  }

  @override
  String get teamReportDialogContent =>
      '부적절한 콘텐츠(예: 사용자 이름 또는 프로필 사진)로 이 사용자를 신고하시겠습니까?\n\n검토를 위해 운영팀에 알림이 전송됩니다.';

  @override
  String get teamReportDialogButton => '신고하기';

  @override
  String teamReportSnackbar(String username) {
    return '$username님에 대한 신고를 제출하는 중...';
  }

  @override
  String get teamReportSuccess => '신고가 제출되었습니다. 운영팀이 곧 검토할 것입니다.';

  @override
  String teamReportError(String error) {
    return '신고 제출 실패: $error';
  }

  @override
  String get teamShareTitle => '초대 공유하기';

  @override
  String get teamShareSubtitle => '초대를 어떻게 공유하시겠습니까?';

  @override
  String get teamShareImageButton => '이미지 카드로 공유';

  @override
  String get teamShareTextButton => '텍스트로 공유';

  @override
  String get teamShareImageGenerating => '초대 카드 생성 중...';

  @override
  String teamShareImageError(String error) {
    return '카드 공유 오류: $error. 대신 텍스트로 공유합니다.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'ON Network와 함께 디지털 네트워크의 미래를 만들어가고 있습니다. 제 팀에 당신을 초대합니다! 🔥\n\n가입 환영 선물:\n✅ 즉시 1 ON 코인 무료 지급\n✅ 24시간 2배 속도 부스트\n\n초대 코드로 시작하세요: $code\n\n지금 가입하고 자리를 확보하세요:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'ON Network에서 제 팀에 합류하세요! 제 코드 사용: $code\n\n지금 가입하기:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username님이 당신을 초대합니다';
  }

  @override
  String get inviteCardTitle => '당신의 여정은 여기서 시작됩니다!';

  @override
  String get inviteCardUseCode => '제 초대 코드를 사용하세요';

  @override
  String get inviteCardGiftTitle => '지금 가입하고 환영 선물을 받으세요:';

  @override
  String get inviteCardGift1 => '즉시 1 ON 코인 무료 지급';

  @override
  String get inviteCardGift2 => '24시간 2배 속도 부스트';

  @override
  String get inviteCardButton => '탭하여 가입하고 ON 받기!';

  @override
  String get marketplaceTitle => '마켓플레이스: 곧 출시';

  @override
  String get marketplaceDescription =>
      '획득한 ON 코인을 사용하여 상품과 서비스를 사고팔 수 있는 탈중앙화 마켓플레이스를 구축하고 있습니다.\n\n계속 채굴하여 잔액을 쌓으세요!';

  @override
  String get marketplaceCommunity => '커뮤니티 참여하기';

  @override
  String get marketplaceTooltipTelegram => 'Telegram 참여하기';

  @override
  String get marketplaceTooltipTwitter => 'X (Twitter) 팔로우하기';

  @override
  String get marketplaceTooltipInstagram => 'Instagram 팔로우하기';

  @override
  String get marketplaceTooltipTikTok => 'TikTok에서 시청하기';

  @override
  String get marketplaceTooltipWebsite => '웹사이트 방문하기';

  @override
  String get profileScreenTitle => '프로필';

  @override
  String get profileUsername => '사용자 이름';

  @override
  String get profileErrorUsernameLength => '사용자 이름은 4자 이상이어야 합니다';

  @override
  String get profileErrorUsernameTaken => '이미 사용 중인 사용자 이름입니다. 다른 이름을 시도하세요.';

  @override
  String get profileUsernameUpdated => '사용자 이름이 업데이트되었습니다!';

  @override
  String get profileImageUploadFailed => '이미지 업로드 실패.';

  @override
  String get profileImageUploadSuccess => '프로필 사진이 업데이트되었습니다!';

  @override
  String profileErrorImageSave(String error) {
    return '이미지 URL 저장 실패: $error';
  }

  @override
  String get profileSectionCommunity => '커뮤니티';

  @override
  String profileInviteCode(String code) {
    return '나의 초대 코드: $code';
  }

  @override
  String get profileShare => '탭하여 공유하기';

  @override
  String get profileCopyCode => '코드 복사';

  @override
  String get profileCopyCodeSubtitle => '초대 코드를 클립보드에 복사합니다';

  @override
  String get profileCopyCodeSuccess => '초대 코드가 클립보드에 복사되었습니다!';

  @override
  String get profileTelegram => 'Telegram 참여하기';

  @override
  String get profileTelegramSubtitle => '뉴스를 받고 커뮤니티와 대화하세요';

  @override
  String get profileTwitter => 'X (Twitter) 팔로우하기';

  @override
  String get profileTwitterSubtitle => '공지사항 확인하기';

  @override
  String get profileInstagram => 'Instagram 팔로우하기';

  @override
  String get profileInstagramSubtitle => '우리의 여정 보기';

  @override
  String get profileTikTok => 'TikTok에서 시청하기';

  @override
  String get profileTikTokSubtitle => '최신 업데이트 및 클립';

  @override
  String get profileWebsite => '웹사이트 방문하기';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => '설정 및 보안';

  @override
  String get profileNotifSettings => '알림 설정';

  @override
  String get profileNotifSettingsSubtitle => '앱 알림 관리';

  @override
  String get profileChangePassword => '비밀번호 변경';

  @override
  String get profileChangePasswordSubtitle => '비밀번호 재설정 이메일 보내기';

  @override
  String get profileChangePasswordSuccess =>
      '비밀번호 재설정 이메일이 전송되었습니다. 받은 편지함을 확인하세요!';

  @override
  String get profileSectionAbout => '정보';

  @override
  String get profileProjectInfo => '프로젝트 정보 & 백서';

  @override
  String get profileProjectInfoSubtitle => '비전과 로드맵 알아보기';

  @override
  String get profileTerms => '이용약관';

  @override
  String get profileTermsSubtitle => '이용약관 읽기';

  @override
  String get profilePrivacy => '개인정보 처리방침';

  @override
  String get profilePrivacySubtitle => '데이터 처리 방법';

  @override
  String get profileSectionDanger => '위험 구역';

  @override
  String get profileDeleteAccount => '계정 삭제';

  @override
  String get profileDeleteAccountSubtitle => '계정과 모든 데이터를 영구적으로 삭제합니다';

  @override
  String get profileDeleteAccountDialogTitle => '정말로 삭제하시겠습니까?';

  @override
  String get profileDeleteAccountDialogContent =>
      '이 작업은 되돌릴 수 없습니다.\n\nON 코인 잔액 및 팀 연결을 포함한 모든 데이터가 영구적으로 삭제됩니다. 이는 되돌릴 수 없습니다.';

  @override
  String get profileDeleteAccountDialogButton => '내 계정 삭제';

  @override
  String get profileDeleteAccountSuccess => '계정이 영구적으로 삭제되었습니다.';

  @override
  String profileDeleteAccountError(String error) {
    return '계정 삭제 오류: $error';
  }

  @override
  String get profileSignOut => '로그아웃';

  @override
  String profileSignOutError(String error) {
    return '로그아웃 오류: $error';
  }

  @override
  String get settingsTitle => '알림 설정';

  @override
  String get settingsMiningTitle => '채굴 세션 알림';

  @override
  String get settingsMiningSubtitle => '24시간 세션이 종료되면 알림을 받습니다.';

  @override
  String get settingsTeamTitle => '팀 알림';

  @override
  String get settingsTeamSubtitle =>
      '팀원이 채굴 시작을 위해 당신에게 \"핑\"을 보낼 수 있도록 허용합니다.';

  @override
  String get settingsAdBoostTitle => '광고 부스트 알림';

  @override
  String get settingsAdBoostSubtitle => '1.5배 광고 부스트가 만료되면 알림을 받습니다.';

  @override
  String settingsErrorUpdate(String error) {
    return '설정 업데이트 실패: $error';
  }

  @override
  String get projectInfoTitle => '우리의 비전';

  @override
  String get projectInfoSection1Title => 'ON Network란 무엇인가요?';

  @override
  String get projectInfoSection1Content =>
      'ON Network는 미래를 위해 설계된 탈중앙화 디지털 생태계입니다. 24시간마다 버튼을 탭함으로써, 당신은 인간 선구자로서의 존재를 인증하고 네트워크의 보안과 성장에 기여합니다. 그 대가로, 당신은 우리 네트워크의 고유 디지털 통화인 ON을 획득합니다.';

  @override
  String get projectInfoSection2Title => 'ON 코인의 유용성';

  @override
  String get projectInfoSection2Content =>
      '당신이 획득하고 있는 ON 코인은 현재 당신과 같은 초기 선구자들에게 배포되고 있습니다. 네트워크가 성장함에 따라, ON의 주요 목적은 미래의 마켓플레이스에서 거래를 촉진하고 네트워크 기능을 지원하는 것입니다. 네트워크가 성장함에 따라 채굴 속도는 감소하며, 이는 커뮤니티 구축에 대한 초기 참여를 보상합니다.';

  @override
  String get projectInfoSection3Title => '우리의 로드맵';

  @override
  String get projectInfoRoadmap1Title => '단계 1: 파이오니어 (현재 위치)';

  @override
  String get projectInfoRoadmap1Content =>
      '네트워크를 0에서 1백만 명의 선구자로 성장시킵니다. 참여를 통해 ON 코인을 배포합니다.';

  @override
  String get projectInfoRoadmap2Title => '단계 2: 마켓플레이스';

  @override
  String get projectInfoRoadmap2Content =>
      '멤버들이 획득한 ON 코인을 사용하여 상품과 서비스를 교환할 수 있는 ON 마켓플레이스를 출시합니다.';

  @override
  String get projectInfoRoadmap3Title => '단계 3: 메인넷 및 거래소';

  @override
  String get projectInfoRoadmap3Content =>
      '완전한 탈중앙화 블록체인(메인넷)으로 전환하고, 주요 암호화폐 플랫폼에서 ON 기능을 활성화합니다(규정 준수 대상).';

  @override
  String get settingsLangTitle => '언어';

  @override
  String get settingsLangSubtitle => '애플리케이션 언어 변경';

  @override
  String get marketplaceTooltipEmail => '지원팀에 문의';

  @override
  String get profileEmail => '지원팀에 문의';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Facebook에서 팔로우하기';

  @override
  String get marketplaceTooltipYoutube => 'YouTube 구독하기';

  @override
  String get profileFacebook => 'Facebook에서 팔로우하기';

  @override
  String get profileFacebookSubtitle => '업데이트 및 커뮤니티 보기';

  @override
  String get profileYoutube => 'YouTube 구독하기';

  @override
  String get profileYoutubeSubtitle => '프로젝트 업데이트 및 튜토리얼 보기';
}
