// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get updateRequiredTitle => 'Update Required';

  @override
  String get updateRequiredMessage =>
      'A new, improved version of ON Network is available. You must update the app to continue earning.';

  @override
  String get updateNowButton => 'Update Now';

  @override
  String get navHome => 'Home';

  @override
  String get navTeam => 'Team';

  @override
  String get navMarketplace => 'Marketplace';

  @override
  String get navProfile => 'Profile';

  @override
  String get authWelcomeBack => 'Welcome Back!';

  @override
  String get authCreateAccount => 'Create Your Account';

  @override
  String get authEmail => 'Email';

  @override
  String get authErrorEmailEmpty => 'Please enter an email';

  @override
  String get authErrorEmailInvalid => 'Please enter a valid email address';

  @override
  String get authPassword => 'Password';

  @override
  String get authErrorPasswordEmpty => 'Please enter your password';

  @override
  String get authErrorPasswordLength =>
      'Password must be at least 6 characters';

  @override
  String get authConfirmPassword => 'Confirm Password';

  @override
  String get authErrorConfirmPasswordEmpty => 'Please confirm your password';

  @override
  String get authErrorPasswordsNoMatch => 'Passwords do not match';

  @override
  String get authUsername => 'Username';

  @override
  String get authUsernameHint => 'Must be at least 3 characters';

  @override
  String get authErrorUsernameLength =>
      'Username must be at least 3 characters.';

  @override
  String get authInviteCode => 'Invite Code (Optional)';

  @override
  String get authInviteCodeHint => 'e.g., A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'I am 18 years of age or older and legally eligible to use this service.';

  @override
  String get authTermsConfirmationPrefix => 'I have read and agree to the ';

  @override
  String get authTermsOfService => 'Terms of Service';

  @override
  String get authTermsConfirmationMid => ' and ';

  @override
  String get authPrivacyPolicy => 'Privacy Policy';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'You must be 18 years or older to use the ON Network.';

  @override
  String get authErrorTerms =>
      'You must agree to the Terms of Service and Privacy Policy.';

  @override
  String get authLogin => 'Login';

  @override
  String get authRegister => 'Register';

  @override
  String get authSignInWithGoogle => 'Sign in with Google';

  @override
  String get authSignUpWithGoogle => 'Sign up with Google';

  @override
  String get authSwitchToRegister => 'Need an account? Register';

  @override
  String get authSwitchToLogin => 'Already have an account? Login';

  @override
  String get authForgotPassword => 'Forgot Password?';

  @override
  String get authResetPassword => 'Reset Password';

  @override
  String get authEnterEmailHint => 'Enter your email';

  @override
  String get authCancel => 'Cancel';

  @override
  String get authSendResetLink => 'Send Reset Link';

  @override
  String get authResetLinkSent => 'Password reset link sent to your email.';

  @override
  String get onboardingWelcomeTitle => 'Welcome to ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'You are now a Pioneer in a new digital ecosystem. Your journey starts today.';

  @override
  String get onboardingMineTitle => 'Tap to Mine';

  @override
  String get onboardingMineDesc =>
      'Tap the power button every 24 hours to prove you\'re human and earn your ON coins.';

  @override
  String get onboardingTeamTitle => 'Build Your Team';

  @override
  String get onboardingTeamDesc =>
      'Invite your friends to join your team. The more active members you have, the faster you earn.';

  @override
  String get onboardingStart => 'Let\'s Start!';

  @override
  String get onboardingNext => 'Next';

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
    return 'Error loading data. Please check your connection and try again.\nDetails: $error';
  }

  @override
  String get homeStatsBaseRate => 'Base Rate';

  @override
  String get homeStatsBaseRateSubtitle => 'Your current base speed';

  @override
  String get homeStatsBaseRateInfoTitle => 'Base Rate';

  @override
  String get homeStatsBaseRateInfo =>
      'This is your current base earning speed. It decreases globally for all users as the network grows, according to the halving schedule.';

  @override
  String get homeStatsEffectiveRate => 'Effective Rate';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2X BOOST!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5X BOOST!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus from team ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Effective Rate';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Your current total earning speed:\nBase Rate + (Active Team Members * Your Bonus Tier % * Base Rate)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 You are currently on a 2X Starter Boost!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost => '\n\n⏱️ Ad Boost Active!';

  @override
  String get homeStatsGlobalMined => 'Global Mined';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Global Mined';

  @override
  String get homeStatsGlobalMinedInfo =>
      'The total amount of ON coins earned by all Pioneers worldwide towards the initial goal of 1 Billion ON.';

  @override
  String get homeStatsNextHalving => 'Next Halving';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Current: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Earning Rate Halving';

  @override
  String get homeStatsNextHalvingInfo =>
      'Base earning rate decreases globally as more Pioneers join. Your personal base rate updates accordingly.\n\n**Phase 1: Pioneers (0 - 100k)**\n• 0 - 10k:    1.00 ON/hr\n• 10k - 20k:  0.95 ON/hr\n• 20k - 30k:  0.90 ON/hr\n• 30k - 40k:  0.85 ON/hr\n• 50k - 60k:  0.80 ON/hr\n• 60k - 70k:  0.75 ON/hr\n• 70k - 80k:  0.70 ON/hr\n• 80k - 90k:  0.65 ON/hr\n• 90k - 100k: 0.60 ON/hr\n• 90k - 100k: 0.55 ON/hr\n\n**Phase 2: Ambassadors (100k - 1M)**\n• 100k - 200k: 0.45 ON/hr\n• 200k - 300k: 0.40 ON/hr\n• 300k - 400k: 0.34 ON/hr\n• 400k - 500k: 0.28 ON/hr\n• 500k - 600k: 0.21 ON/hr\n• 600k - 700k: 0.15 ON/hr\n• 700k - 800k: 0.10 ON/hr\n• 800k - 900k: 0.06 ON/hr\n• 900k - 1M:   0.03 ON/hr\n\n**Phase 3: Guardians (1M+)**\n• 1M - 2M: 0.01 ON/hr\n• 2M+ :    0.005 ON/hr (Final Legacy Rate)\n\nYour effective rate increases with active team members based on your current tier (Standard 25%, Bronze 27%, Silver 30%, Gold 35%) applied to YOUR current Base Rate per active member.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Mainnet Countdown';

  @override
  String get homeStatsMainnetInfo =>
      'This is the scheduled date for our Mainnet launch. At this point, the ON coin distribution (earning) will stop and the ON Marketplace will be fully operational.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Earning at $rate ON/hr$boost with $count active member(s)';
  }

  @override
  String get homeMiningStatusClaim =>
      'Tap button to claim last session earnings & start new!';

  @override
  String get homeMiningStatusStart => 'Tap the button to start earning!';

  @override
  String get homeMiningButtonActive => 'ACTIVE';

  @override
  String get homeMiningStarterBoost => 'Starter Boost Active! (2X Speed)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Ad Boost active for: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Watch Ad for 1.5X Boost ($count left)';
  }

  @override
  String get homeMiningAdLoading => 'Loading Boost Ad...';

  @override
  String get homeMiningAdLoadingShort => 'Ad boost loading...';

  @override
  String get homeMiningAdLimit => 'Daily ad boost limit reached.';

  @override
  String get homeActivateSnackbar => 'Activating earning session...';

  @override
  String get homeActivatedSnackbar =>
      'Earning session activated! Earnings from last session added.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Your Team';

  @override
  String get teamRefreshTooltip => 'Refresh Team';

  @override
  String get teamRefreshSnackbar => 'Refreshing team data...';

  @override
  String get teamErrorInviteCode => 'Could not load invite code';

  @override
  String teamInviteCode(String code) {
    return 'Your Invite Code: $code';
  }

  @override
  String get teamErrorLoading =>
      'Could not load team members.\nPlease check your connection.';

  @override
  String teamYourContribution(String rate) {
    return 'Your Contribution: +$rate ON/hour';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Your Bonus Tier: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Next Goal: $goal';
  }

  @override
  String get teamNextGoalMax => 'Max Tier Reached!';

  @override
  String teamNextGoalBronze(Object count) {
    return '$count more member(s) for Bronze (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return '$count more member(s) for Silver (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return '$count more member(s) for Gold (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Current Team Members: $total ($active active)';
  }

  @override
  String get teamInviteButton => 'Invite New Members';

  @override
  String get teamEmptyTitle => 'Your team is empty.';

  @override
  String get teamEmptyDescription =>
      'Invite friends using your code to build your team and increase your mining rate!';

  @override
  String get teamMemberActive => 'Active Now';

  @override
  String get teamMemberInactive => 'Inactive';

  @override
  String get teamMemberTapToRemind => 'Tap to Remind';

  @override
  String get teamMemberTooltipReport => 'Report User';

  @override
  String get teamMemberTooltipRemind => 'Remind User';

  @override
  String teamRemindSnackbar(String username) {
    return 'Sending reminder to $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Failed to send reminder: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Reminder sent to $username!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Report $username';
  }

  @override
  String get teamReportDialogContent =>
      'Are you sure you want to report this user for inappropriate content (e.g., username or profile picture)?\n\nThis will send a notice to our moderation team for review.';

  @override
  String get teamReportDialogButton => 'Report';

  @override
  String teamReportSnackbar(String username) {
    return 'Submitting report for $username...';
  }

  @override
  String get teamReportSuccess =>
      'Report submitted. Our team will review it shortly.';

  @override
  String teamReportError(String error) {
    return 'Failed to submit report: $error';
  }

  @override
  String get teamShareTitle => 'Share Your Invite';

  @override
  String get teamShareSubtitle => 'How would you like to share your invite?';

  @override
  String get teamShareImageButton => 'Share as Image Card';

  @override
  String get teamShareTextButton => 'Share as Plain Text';

  @override
  String get teamShareImageGenerating => 'Generating your invite card...';

  @override
  String teamShareImageError(String error) {
    return 'Error sharing card: $error. Sharing as text instead.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'I\'m building the future of digital networks with ON Network. I want you on my team! 🔥\n\nHere\'s your welcome gift for joining:\n✅ 1 FREE ON Coin Instantly\n✅ 24-Hour 2X Speed Boost\n\nUse my invitation code to start: $code\n\nJoin now and claim your spot:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Join my team on ON Network! Use my code: $code\n\nJoin now:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username invites you to join';
  }

  @override
  String get inviteCardTitle => 'YOUR JOURNEY STARTS HERE!';

  @override
  String get inviteCardUseCode => 'USE MY INVITATION CODE';

  @override
  String get inviteCardGiftTitle => 'JOIN NOW AND GET YOUR WELCOME GIFT:';

  @override
  String get inviteCardGift1 => '1 FREE ON Coin Instantly';

  @override
  String get inviteCardGift2 => '24-Hour 2X Speed Boost';

  @override
  String get inviteCardButton => 'TAP TO JOIN & CLAIM YOUR ON!';

  @override
  String get marketplaceTitle => 'Marketplace: Coming Soon';

  @override
  String get marketplaceDescription =>
      'We are building a decentralized marketplace where you will be able to buy and sell goods and services using your earned ON coins.\n\nKeep mining and build your balance!';

  @override
  String get marketplaceCommunity => 'JOIN THE COMMUNITY';

  @override
  String get marketplaceTooltipTelegram => 'Join our Telegram';

  @override
  String get marketplaceTooltipTwitter => 'Follow us on X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Follow us on Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Watch us on TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Visit our Website';

  @override
  String get profileScreenTitle => 'Profile';

  @override
  String get profileUsername => 'Username';

  @override
  String get profileErrorUsernameLength =>
      'Username must be at least 4 characters';

  @override
  String get profileErrorUsernameTaken =>
      'This username is already taken. Please try another.';

  @override
  String get profileUsernameUpdated => 'Username updated!';

  @override
  String get profileImageUploadFailed => 'Image upload failed.';

  @override
  String get profileImageUploadSuccess => 'Profile picture updated!';

  @override
  String profileErrorImageSave(String error) {
    return 'Failed to save image URL: $error';
  }

  @override
  String get profileSectionCommunity => 'Community';

  @override
  String profileInviteCode(String code) {
    return 'Your Invite Code: $code';
  }

  @override
  String get profileShare => 'Tap to share';

  @override
  String get profileCopyCode => 'Copy Code';

  @override
  String get profileCopyCodeSubtitle =>
      'Copy your invite code to the clipboard';

  @override
  String get profileCopyCodeSuccess => 'Invite code copied to clipboard!';

  @override
  String get profileTelegram => 'Join our Telegram';

  @override
  String get profileTelegramSubtitle => 'Get news and chat with the community';

  @override
  String get profileTwitter => 'Follow us on X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Stay up-to-date with announcements';

  @override
  String get profileInstagram => 'Follow us on Instagram';

  @override
  String get profileInstagramSubtitle => 'See our journey';

  @override
  String get profileTikTok => 'Watch us on TikTok';

  @override
  String get profileTikTokSubtitle => 'Latest updates and clips';

  @override
  String get profileWebsite => 'Visit our Website';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Settings & Security';

  @override
  String get profileNotifSettings => 'Notification Settings';

  @override
  String get profileNotifSettingsSubtitle => 'Manage your app notifications';

  @override
  String get profileChangePassword => 'Change Password';

  @override
  String get profileChangePasswordSubtitle => 'Send a password reset email';

  @override
  String get profileChangePasswordSuccess =>
      'Password reset email sent. Check your inbox!';

  @override
  String get profileSectionAbout => 'About';

  @override
  String get profileProjectInfo => 'Project Info & Whitepaper';

  @override
  String get profileProjectInfoSubtitle => 'Learn about our vision and roadmap';

  @override
  String get profileTerms => 'Terms of Service';

  @override
  String get profileTermsSubtitle => 'Read our terms and conditions';

  @override
  String get profilePrivacy => 'Privacy Policy';

  @override
  String get profilePrivacySubtitle => 'How we handle your data';

  @override
  String get profileSectionDanger => 'Danger Zone';

  @override
  String get profileDeleteAccount => 'Delete Account';

  @override
  String get profileDeleteAccountSubtitle =>
      'Permanently delete your account and all data';

  @override
  String get profileDeleteAccountDialogTitle => 'Are you absolutely sure?';

  @override
  String get profileDeleteAccountDialogContent =>
      'This action is irreversible.\n\nAll your data, including your ON coin balance and team connections, will be permanently deleted. This cannot be undone.';

  @override
  String get profileDeleteAccountDialogButton => 'Delete My Account';

  @override
  String get profileDeleteAccountSuccess => 'Account permanently deleted.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Error deleting account: $error';
  }

  @override
  String get profileSignOut => 'Sign Out';

  @override
  String profileSignOutError(String error) {
    return 'Error signing out: $error';
  }

  @override
  String get settingsTitle => 'Notification Settings';

  @override
  String get settingsMiningTitle => 'Mining Session Reminders';

  @override
  String get settingsMiningSubtitle =>
      'Get notified when your 24-hour session ends.';

  @override
  String get settingsTeamTitle => 'Team Reminders';

  @override
  String get settingsTeamSubtitle =>
      'Allow your team members to \"ping\" you to start mining.';

  @override
  String get settingsAdBoostTitle => 'Ad Boost Reminders';

  @override
  String get settingsAdBoostSubtitle =>
      'Get notified when your 1.5X Ad Boost expires.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Failed to update settings: $error';
  }

  @override
  String get projectInfoTitle => 'Our Vision';

  @override
  String get projectInfoSection1Title => 'What is ON Network?';

  @override
  String get projectInfoSection1Content =>
      'ON Network is a decentralized digital ecosystem designed for the future. By tapping the button every 24 hours, you are validating your presence as a human Pioneer and contributing to the network\'s security and growth. In return, you earn ON, the native digital currency of our network.';

  @override
  String get projectInfoSection2Title => 'ON Coin Utility';

  @override
  String get projectInfoSection2Content =>
      'The ON Coins you are earning are currently being distributed to early Pioneers like you. As the network grows, ON\'s primary purpose will be to facilitate transactions in the future Marketplace and support network functions. The earning rate decreases as the network grows, rewarding early participation in building the community.';

  @override
  String get projectInfoSection3Title => 'Our Roadmap';

  @override
  String get projectInfoRoadmap1Title => 'Phase 1: Pioneers (You are here)';

  @override
  String get projectInfoRoadmap1Content =>
      'Grow the network from 0 to 1 million Pioneers. Distribute ON coin through engagement.';

  @override
  String get projectInfoRoadmap2Title => 'Phase 2: Marketplace';

  @override
  String get projectInfoRoadmap2Content =>
      'Launch the ON Marketplace where members can exchange goods and services using their earned ON Coins.';

  @override
  String get projectInfoRoadmap3Title => 'Phase 3: Mainnet & Exchange';

  @override
  String get projectInfoRoadmap3Content =>
      'Transition to a fully decentralized blockchain (Mainnet) and enable ON functionality on major cryptocurrency platforms (subject to compliance).';

  @override
  String get settingsLangTitle => 'Language';

  @override
  String get settingsLangSubtitle => 'Change the application language';

  @override
  String get marketplaceTooltipEmail => 'Contact Support';

  @override
  String get profileEmail => 'Contact Support';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Follow us on Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Subscribe to our YouTube';

  @override
  String get profileFacebook => 'Follow us on Facebook';

  @override
  String get profileFacebookSubtitle => 'See our updates and community';

  @override
  String get profileYoutube => 'Subscribe to our YouTube';

  @override
  String get profileYoutubeSubtitle => 'Watch project updates and tutorials';
}
