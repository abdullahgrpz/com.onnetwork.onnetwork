import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_id.dart';
import 'app_localizations_ja.dart';
import 'app_localizations_ko.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_ru.dart';
import 'app_localizations_tr.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('id'),
    Locale('ja'),
    Locale('ko'),
    Locale('pt'),
    Locale('ru'),
    Locale('tr'),
    Locale('vi')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @updateRequiredTitle.
  ///
  /// In en, this message translates to:
  /// **'Update Required'**
  String get updateRequiredTitle;

  /// No description provided for @updateRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'A new, improved version of ON Network is available. You must update the app to continue earning.'**
  String get updateRequiredMessage;

  /// No description provided for @updateNowButton.
  ///
  /// In en, this message translates to:
  /// **'Update Now'**
  String get updateNowButton;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navTeam.
  ///
  /// In en, this message translates to:
  /// **'Team'**
  String get navTeam;

  /// No description provided for @navMarketplace.
  ///
  /// In en, this message translates to:
  /// **'Marketplace'**
  String get navMarketplace;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @authWelcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get authWelcomeBack;

  /// No description provided for @authCreateAccount.
  ///
  /// In en, this message translates to:
  /// **'Create Your Account'**
  String get authCreateAccount;

  /// No description provided for @authEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get authEmail;

  /// No description provided for @authErrorEmailEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter an email'**
  String get authErrorEmailEmpty;

  /// No description provided for @authErrorEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get authErrorEmailInvalid;

  /// No description provided for @authPassword.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get authPassword;

  /// No description provided for @authErrorPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please enter your password'**
  String get authErrorPasswordEmpty;

  /// No description provided for @authErrorPasswordLength.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get authErrorPasswordLength;

  /// No description provided for @authConfirmPassword.
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get authConfirmPassword;

  /// No description provided for @authErrorConfirmPasswordEmpty.
  ///
  /// In en, this message translates to:
  /// **'Please confirm your password'**
  String get authErrorConfirmPasswordEmpty;

  /// No description provided for @authErrorPasswordsNoMatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get authErrorPasswordsNoMatch;

  /// No description provided for @authUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get authUsername;

  /// No description provided for @authUsernameHint.
  ///
  /// In en, this message translates to:
  /// **'Must be at least 3 characters'**
  String get authUsernameHint;

  /// No description provided for @authErrorUsernameLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 3 characters.'**
  String get authErrorUsernameLength;

  /// No description provided for @authInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Invite Code (Optional)'**
  String get authInviteCode;

  /// No description provided for @authInviteCodeHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., A41DB9X1'**
  String get authInviteCodeHint;

  /// No description provided for @authAgeConfirmation.
  ///
  /// In en, this message translates to:
  /// **'I am 18 years of age or older and legally eligible to use this service.'**
  String get authAgeConfirmation;

  /// No description provided for @authTermsConfirmationPrefix.
  ///
  /// In en, this message translates to:
  /// **'I have read and agree to the '**
  String get authTermsConfirmationPrefix;

  /// No description provided for @authTermsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get authTermsOfService;

  /// No description provided for @authTermsConfirmationMid.
  ///
  /// In en, this message translates to:
  /// **' and '**
  String get authTermsConfirmationMid;

  /// No description provided for @authPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get authPrivacyPolicy;

  /// No description provided for @authTermsConfirmationSuffix.
  ///
  /// In en, this message translates to:
  /// **'.'**
  String get authTermsConfirmationSuffix;

  /// No description provided for @authErrorAge.
  ///
  /// In en, this message translates to:
  /// **'You must be 18 years or older to use the ON Network.'**
  String get authErrorAge;

  /// No description provided for @authErrorTerms.
  ///
  /// In en, this message translates to:
  /// **'You must agree to the Terms of Service and Privacy Policy.'**
  String get authErrorTerms;

  /// No description provided for @authLogin.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get authLogin;

  /// No description provided for @authRegister.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get authRegister;

  /// No description provided for @authSignInWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign in with Google'**
  String get authSignInWithGoogle;

  /// No description provided for @authSignUpWithGoogle.
  ///
  /// In en, this message translates to:
  /// **'Sign up with Google'**
  String get authSignUpWithGoogle;

  /// No description provided for @authSwitchToRegister.
  ///
  /// In en, this message translates to:
  /// **'Need an account? Register'**
  String get authSwitchToRegister;

  /// No description provided for @authSwitchToLogin.
  ///
  /// In en, this message translates to:
  /// **'Already have an account? Login'**
  String get authSwitchToLogin;

  /// No description provided for @authForgotPassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot Password?'**
  String get authForgotPassword;

  /// No description provided for @authResetPassword.
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get authResetPassword;

  /// No description provided for @authEnterEmailHint.
  ///
  /// In en, this message translates to:
  /// **'Enter your email'**
  String get authEnterEmailHint;

  /// No description provided for @authCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get authCancel;

  /// No description provided for @authSendResetLink.
  ///
  /// In en, this message translates to:
  /// **'Send Reset Link'**
  String get authSendResetLink;

  /// No description provided for @authResetLinkSent.
  ///
  /// In en, this message translates to:
  /// **'Password reset link sent to your email.'**
  String get authResetLinkSent;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to ON Network'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeDesc.
  ///
  /// In en, this message translates to:
  /// **'You are now a Pioneer in a new digital ecosystem. Your journey starts today.'**
  String get onboardingWelcomeDesc;

  /// No description provided for @onboardingMineTitle.
  ///
  /// In en, this message translates to:
  /// **'Tap to Mine'**
  String get onboardingMineTitle;

  /// No description provided for @onboardingMineDesc.
  ///
  /// In en, this message translates to:
  /// **'Tap the power button every 24 hours to prove you\'re human and earn your ON coins.'**
  String get onboardingMineDesc;

  /// No description provided for @onboardingTeamTitle.
  ///
  /// In en, this message translates to:
  /// **'Build Your Team'**
  String get onboardingTeamTitle;

  /// No description provided for @onboardingTeamDesc.
  ///
  /// In en, this message translates to:
  /// **'Invite your friends to join your team. The more active members you have, the faster you earn.'**
  String get onboardingTeamDesc;

  /// No description provided for @onboardingStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start!'**
  String get onboardingStart;

  /// No description provided for @onboardingNext.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboardingNext;

  /// No description provided for @homeScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'ON Network'**
  String get homeScreenTitle;

  /// No description provided for @homeLangEnglish.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get homeLangEnglish;

  /// No description provided for @homeLangTurkish.
  ///
  /// In en, this message translates to:
  /// **'Türkçe'**
  String get homeLangTurkish;

  /// No description provided for @homeLangIndonesian.
  ///
  /// In en, this message translates to:
  /// **'Bahasa Indonesia'**
  String get homeLangIndonesian;

  /// No description provided for @homeLangVietnamese.
  ///
  /// In en, this message translates to:
  /// **'Tiếng Việt'**
  String get homeLangVietnamese;

  /// No description provided for @homeLangSpanish.
  ///
  /// In en, this message translates to:
  /// **'Español'**
  String get homeLangSpanish;

  /// No description provided for @homeLangHindi.
  ///
  /// In en, this message translates to:
  /// **'हिन्दी'**
  String get homeLangHindi;

  /// No description provided for @homeLangPortuguese.
  ///
  /// In en, this message translates to:
  /// **'Português'**
  String get homeLangPortuguese;

  /// No description provided for @homeLangArabic.
  ///
  /// In en, this message translates to:
  /// **'العربية'**
  String get homeLangArabic;

  /// No description provided for @homeLangRussian.
  ///
  /// In en, this message translates to:
  /// **'Русский'**
  String get homeLangRussian;

  /// No description provided for @homeLangGerman.
  ///
  /// In en, this message translates to:
  /// **'Deutsch'**
  String get homeLangGerman;

  /// No description provided for @homeLangFrench.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get homeLangFrench;

  /// No description provided for @homeLangJapanese.
  ///
  /// In en, this message translates to:
  /// **'日本語'**
  String get homeLangJapanese;

  /// No description provided for @homeLangKorean.
  ///
  /// In en, this message translates to:
  /// **'한국어'**
  String get homeLangKorean;

  /// Error message when home screen data fails to load
  ///
  /// In en, this message translates to:
  /// **'Error loading data. Please check your connection and try again.\nDetails: {error}'**
  String homeErrorLoading(String error);

  /// No description provided for @homeStatsBaseRate.
  ///
  /// In en, this message translates to:
  /// **'Base Rate'**
  String get homeStatsBaseRate;

  /// No description provided for @homeStatsBaseRateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your current base speed'**
  String get homeStatsBaseRateSubtitle;

  /// No description provided for @homeStatsBaseRateInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Base Rate'**
  String get homeStatsBaseRateInfoTitle;

  /// No description provided for @homeStatsBaseRateInfo.
  ///
  /// In en, this message translates to:
  /// **'This is your current base earning speed. It decreases globally for all users as the network grows, according to the halving schedule.'**
  String get homeStatsBaseRateInfo;

  /// No description provided for @homeStatsEffectiveRate.
  ///
  /// In en, this message translates to:
  /// **'Effective Rate'**
  String get homeStatsEffectiveRate;

  /// No description provided for @homeStatsEffectiveRateBoost2x.
  ///
  /// In en, this message translates to:
  /// **' (2X BOOST!)'**
  String get homeStatsEffectiveRateBoost2x;

  /// No description provided for @homeStatsEffectiveRateBoost1_5x.
  ///
  /// In en, this message translates to:
  /// **' (1.5X BOOST!)'**
  String get homeStatsEffectiveRateBoost1_5x;

  /// No description provided for @homeStatsEffectiveRateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'+{bonus} from team ({percent}%)'**
  String homeStatsEffectiveRateSubtitle(String bonus, String percent);

  /// No description provided for @homeStatsEffectiveRateInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Effective Rate'**
  String get homeStatsEffectiveRateInfoTitle;

  /// No description provided for @homeStatsEffectiveRateInfo.
  ///
  /// In en, this message translates to:
  /// **'Your current total earning speed:\nBase Rate + (Active Team Members * Your Bonus Tier % * Base Rate)'**
  String get homeStatsEffectiveRateInfo;

  /// No description provided for @homeStatsEffectiveRateInfoStarterBoost.
  ///
  /// In en, this message translates to:
  /// **'\n\n🚀 You are currently on a 2X Starter Boost!'**
  String get homeStatsEffectiveRateInfoStarterBoost;

  /// No description provided for @homeStatsEffectiveRateInfoAdBoost.
  ///
  /// In en, this message translates to:
  /// **'\n\n⏱️ Ad Boost Active!'**
  String get homeStatsEffectiveRateInfoAdBoost;

  /// No description provided for @homeStatsGlobalMined.
  ///
  /// In en, this message translates to:
  /// **'Global Mined'**
  String get homeStatsGlobalMined;

  /// No description provided for @homeStatsGlobalMinedInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Global Mined'**
  String get homeStatsGlobalMinedInfoTitle;

  /// No description provided for @homeStatsGlobalMinedInfo.
  ///
  /// In en, this message translates to:
  /// **'The total amount of ON coins earned by all Pioneers worldwide towards the initial goal of 1 Billion ON.'**
  String get homeStatsGlobalMinedInfo;

  /// No description provided for @homeStatsNextHalving.
  ///
  /// In en, this message translates to:
  /// **'Next Halving'**
  String get homeStatsNextHalving;

  /// No description provided for @homeStatsNextHalvingCurrent.
  ///
  /// In en, this message translates to:
  /// **'Current: {count}'**
  String homeStatsNextHalvingCurrent(String count);

  /// No description provided for @homeStatsNextHalvingInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Earning Rate Halving'**
  String get homeStatsNextHalvingInfoTitle;

  /// No description provided for @homeStatsNextHalvingInfo.
  ///
  /// In en, this message translates to:
  /// **'Base earning rate decreases globally as more Pioneers join. Your personal base rate updates accordingly.\n\n**Phase 1: Pioneers (0 - 100k)**\n• 0 - 10k:    1.00 ON/hr\n• 10k - 20k:  0.95 ON/hr\n• 20k - 30k:  0.90 ON/hr\n• 30k - 40k:  0.85 ON/hr\n• 50k - 60k:  0.80 ON/hr\n• 60k - 70k:  0.75 ON/hr\n• 70k - 80k:  0.70 ON/hr\n• 80k - 90k:  0.65 ON/hr\n• 90k - 100k: 0.60 ON/hr\n• 90k - 100k: 0.55 ON/hr\n\n**Phase 2: Ambassadors (100k - 1M)**\n• 100k - 200k: 0.45 ON/hr\n• 200k - 300k: 0.40 ON/hr\n• 300k - 400k: 0.34 ON/hr\n• 400k - 500k: 0.28 ON/hr\n• 500k - 600k: 0.21 ON/hr\n• 600k - 700k: 0.15 ON/hr\n• 700k - 800k: 0.10 ON/hr\n• 800k - 900k: 0.06 ON/hr\n• 900k - 1M:   0.03 ON/hr\n\n**Phase 3: Guardians (1M+)**\n• 1M - 2M: 0.01 ON/hr\n• 2M+ :    0.005 ON/hr (Final Legacy Rate)\n\nYour effective rate increases with active team members based on your current tier (Standard 25%, Bronze 27%, Silver 30%, Gold 35%) applied to YOUR current Base Rate per active member.'**
  String get homeStatsNextHalvingInfo;

  /// No description provided for @homeStatsMainnet.
  ///
  /// In en, this message translates to:
  /// **'Mainnet'**
  String get homeStatsMainnet;

  /// No description provided for @homeStatsMainnetInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Mainnet Countdown'**
  String get homeStatsMainnetInfoTitle;

  /// No description provided for @homeStatsMainnetInfo.
  ///
  /// In en, this message translates to:
  /// **'This is the scheduled date for our Mainnet launch. At this point, the ON coin distribution (earning) will stop and the ON Marketplace will be fully operational.'**
  String get homeStatsMainnetInfo;

  /// No description provided for @homeMiningStatus.
  ///
  /// In en, this message translates to:
  /// **'Earning at {rate} ON/hr{boost} with {count} active member(s)'**
  String homeMiningStatus(String rate, String boost, String count);

  /// No description provided for @homeMiningStatusClaim.
  ///
  /// In en, this message translates to:
  /// **'Tap button to claim last session earnings & start new!'**
  String get homeMiningStatusClaim;

  /// No description provided for @homeMiningStatusStart.
  ///
  /// In en, this message translates to:
  /// **'Tap the button to start earning!'**
  String get homeMiningStatusStart;

  /// No description provided for @homeMiningButtonActive.
  ///
  /// In en, this message translates to:
  /// **'ACTIVE'**
  String get homeMiningButtonActive;

  /// No description provided for @homeMiningStarterBoost.
  ///
  /// In en, this message translates to:
  /// **'Starter Boost Active! (2X Speed)'**
  String get homeMiningStarterBoost;

  /// No description provided for @homeMiningAdBoost.
  ///
  /// In en, this message translates to:
  /// **'Ad Boost active for: {duration}'**
  String homeMiningAdBoost(String duration);

  /// No description provided for @homeMiningAdButton.
  ///
  /// In en, this message translates to:
  /// **'Watch Ad for 1.5X Boost ({count} left)'**
  String homeMiningAdButton(String count);

  /// No description provided for @homeMiningAdLoading.
  ///
  /// In en, this message translates to:
  /// **'Loading Boost Ad...'**
  String get homeMiningAdLoading;

  /// No description provided for @homeMiningAdLoadingShort.
  ///
  /// In en, this message translates to:
  /// **'Ad boost loading...'**
  String get homeMiningAdLoadingShort;

  /// No description provided for @homeMiningAdLimit.
  ///
  /// In en, this message translates to:
  /// **'Daily ad boost limit reached.'**
  String get homeMiningAdLimit;

  /// No description provided for @homeActivateSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Activating earning session...'**
  String get homeActivateSnackbar;

  /// No description provided for @homeActivatedSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Earning session activated! Earnings from last session added.'**
  String get homeActivatedSnackbar;

  /// No description provided for @homeDialogOK.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get homeDialogOK;

  /// No description provided for @teamScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Your Team'**
  String get teamScreenTitle;

  /// No description provided for @teamRefreshTooltip.
  ///
  /// In en, this message translates to:
  /// **'Refresh Team'**
  String get teamRefreshTooltip;

  /// No description provided for @teamRefreshSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Refreshing team data...'**
  String get teamRefreshSnackbar;

  /// No description provided for @teamErrorInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Could not load invite code'**
  String get teamErrorInviteCode;

  /// No description provided for @teamInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Your Invite Code: {code}'**
  String teamInviteCode(String code);

  /// No description provided for @teamErrorLoading.
  ///
  /// In en, this message translates to:
  /// **'Could not load team members.\nPlease check your connection.'**
  String get teamErrorLoading;

  /// No description provided for @teamYourContribution.
  ///
  /// In en, this message translates to:
  /// **'Your Contribution: +{rate} ON/hour'**
  String teamYourContribution(String rate);

  /// No description provided for @teamBonusTier.
  ///
  /// In en, this message translates to:
  /// **'Your Bonus Tier: {tier} ({percent}%)'**
  String teamBonusTier(String tier, String percent);

  /// No description provided for @teamNextGoal.
  ///
  /// In en, this message translates to:
  /// **'Next Goal: {goal}'**
  String teamNextGoal(String goal);

  /// No description provided for @teamNextGoalMax.
  ///
  /// In en, this message translates to:
  /// **'Max Tier Reached!'**
  String get teamNextGoalMax;

  /// No description provided for @teamNextGoalBronze.
  ///
  /// In en, this message translates to:
  /// **'{count} more member(s) for Bronze (27%)'**
  String teamNextGoalBronze(Object count);

  /// No description provided for @teamNextGoalSilver.
  ///
  /// In en, this message translates to:
  /// **'{count} more member(s) for Silver (30%)'**
  String teamNextGoalSilver(Object count);

  /// No description provided for @teamNextGoalGold.
  ///
  /// In en, this message translates to:
  /// **'{count} more member(s) for Gold (35%)'**
  String teamNextGoalGold(Object count);

  /// No description provided for @teamMemberCount.
  ///
  /// In en, this message translates to:
  /// **'Current Team Members: {total} ({active} active)'**
  String teamMemberCount(String total, String active);

  /// No description provided for @teamInviteButton.
  ///
  /// In en, this message translates to:
  /// **'Invite New Members'**
  String get teamInviteButton;

  /// No description provided for @teamEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Your team is empty.'**
  String get teamEmptyTitle;

  /// No description provided for @teamEmptyDescription.
  ///
  /// In en, this message translates to:
  /// **'Invite friends using your code to build your team and increase your mining rate!'**
  String get teamEmptyDescription;

  /// No description provided for @teamMemberActive.
  ///
  /// In en, this message translates to:
  /// **'Active Now'**
  String get teamMemberActive;

  /// No description provided for @teamMemberInactive.
  ///
  /// In en, this message translates to:
  /// **'Inactive'**
  String get teamMemberInactive;

  /// No description provided for @teamMemberTapToRemind.
  ///
  /// In en, this message translates to:
  /// **'Tap to Remind'**
  String get teamMemberTapToRemind;

  /// No description provided for @teamMemberTooltipReport.
  ///
  /// In en, this message translates to:
  /// **'Report User'**
  String get teamMemberTooltipReport;

  /// No description provided for @teamMemberTooltipRemind.
  ///
  /// In en, this message translates to:
  /// **'Remind User'**
  String get teamMemberTooltipRemind;

  /// No description provided for @teamRemindSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Sending reminder to {username}...'**
  String teamRemindSnackbar(String username);

  /// No description provided for @teamRemindError.
  ///
  /// In en, this message translates to:
  /// **'Failed to send reminder: {error}'**
  String teamRemindError(String error);

  /// No description provided for @teamRemindSuccess.
  ///
  /// In en, this message translates to:
  /// **'Reminder sent to {username}!'**
  String teamRemindSuccess(String username);

  /// No description provided for @teamReportDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Report {username}'**
  String teamReportDialogTitle(String username);

  /// No description provided for @teamReportDialogContent.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to report this user for inappropriate content (e.g., username or profile picture)?\n\nThis will send a notice to our moderation team for review.'**
  String get teamReportDialogContent;

  /// No description provided for @teamReportDialogButton.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get teamReportDialogButton;

  /// No description provided for @teamReportSnackbar.
  ///
  /// In en, this message translates to:
  /// **'Submitting report for {username}...'**
  String teamReportSnackbar(String username);

  /// No description provided for @teamReportSuccess.
  ///
  /// In en, this message translates to:
  /// **'Report submitted. Our team will review it shortly.'**
  String get teamReportSuccess;

  /// No description provided for @teamReportError.
  ///
  /// In en, this message translates to:
  /// **'Failed to submit report: {error}'**
  String teamReportError(String error);

  /// No description provided for @teamShareTitle.
  ///
  /// In en, this message translates to:
  /// **'Share Your Invite'**
  String get teamShareTitle;

  /// No description provided for @teamShareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'How would you like to share your invite?'**
  String get teamShareSubtitle;

  /// No description provided for @teamShareImageButton.
  ///
  /// In en, this message translates to:
  /// **'Share as Image Card'**
  String get teamShareImageButton;

  /// No description provided for @teamShareTextButton.
  ///
  /// In en, this message translates to:
  /// **'Share as Plain Text'**
  String get teamShareTextButton;

  /// No description provided for @teamShareImageGenerating.
  ///
  /// In en, this message translates to:
  /// **'Generating your invite card...'**
  String get teamShareImageGenerating;

  /// No description provided for @teamShareImageError.
  ///
  /// In en, this message translates to:
  /// **'Error sharing card: {error}. Sharing as text instead.'**
  String teamShareImageError(String error);

  /// No description provided for @teamShareTextMessage.
  ///
  /// In en, this message translates to:
  /// **'I\'m building the future of digital networks with ON Network. I want you on my team! 🔥\n\nHere\'s your welcome gift for joining:\n✅ 1 FREE ON Coin Instantly\n✅ 24-Hour 2X Speed Boost\n\nUse my invitation code to start: {code}\n\nJoin now and claim your spot:\nhttps://onnetworkapp.com'**
  String teamShareTextMessage(String code);

  /// No description provided for @teamShareImageMessage.
  ///
  /// In en, this message translates to:
  /// **'Join my team on ON Network! Use my code: {code}\n\nJoin now:\nhttps://onnetworkapp.com'**
  String teamShareImageMessage(String code);

  /// No description provided for @inviteCardInvitesYou.
  ///
  /// In en, this message translates to:
  /// **'{username} invites you to join'**
  String inviteCardInvitesYou(String username);

  /// No description provided for @inviteCardTitle.
  ///
  /// In en, this message translates to:
  /// **'YOUR JOURNEY STARTS HERE!'**
  String get inviteCardTitle;

  /// No description provided for @inviteCardUseCode.
  ///
  /// In en, this message translates to:
  /// **'USE MY INVITATION CODE'**
  String get inviteCardUseCode;

  /// No description provided for @inviteCardGiftTitle.
  ///
  /// In en, this message translates to:
  /// **'JOIN NOW AND GET YOUR WELCOME GIFT:'**
  String get inviteCardGiftTitle;

  /// No description provided for @inviteCardGift1.
  ///
  /// In en, this message translates to:
  /// **'1 FREE ON Coin Instantly'**
  String get inviteCardGift1;

  /// No description provided for @inviteCardGift2.
  ///
  /// In en, this message translates to:
  /// **'24-Hour 2X Speed Boost'**
  String get inviteCardGift2;

  /// No description provided for @inviteCardButton.
  ///
  /// In en, this message translates to:
  /// **'TAP TO JOIN & CLAIM YOUR ON!'**
  String get inviteCardButton;

  /// No description provided for @marketplaceTitle.
  ///
  /// In en, this message translates to:
  /// **'Marketplace: Coming Soon'**
  String get marketplaceTitle;

  /// No description provided for @marketplaceDescription.
  ///
  /// In en, this message translates to:
  /// **'We are building a decentralized marketplace where you will be able to buy and sell goods and services using your earned ON coins.\n\nKeep mining and build your balance!'**
  String get marketplaceDescription;

  /// No description provided for @marketplaceCommunity.
  ///
  /// In en, this message translates to:
  /// **'JOIN THE COMMUNITY'**
  String get marketplaceCommunity;

  /// No description provided for @marketplaceTooltipTelegram.
  ///
  /// In en, this message translates to:
  /// **'Join our Telegram'**
  String get marketplaceTooltipTelegram;

  /// No description provided for @marketplaceTooltipTwitter.
  ///
  /// In en, this message translates to:
  /// **'Follow us on X (Twitter)'**
  String get marketplaceTooltipTwitter;

  /// No description provided for @marketplaceTooltipInstagram.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Instagram'**
  String get marketplaceTooltipInstagram;

  /// No description provided for @marketplaceTooltipTikTok.
  ///
  /// In en, this message translates to:
  /// **'Watch us on TikTok'**
  String get marketplaceTooltipTikTok;

  /// No description provided for @marketplaceTooltipWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit our Website'**
  String get marketplaceTooltipWebsite;

  /// No description provided for @profileScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profileScreenTitle;

  /// No description provided for @profileUsername.
  ///
  /// In en, this message translates to:
  /// **'Username'**
  String get profileUsername;

  /// No description provided for @profileErrorUsernameLength.
  ///
  /// In en, this message translates to:
  /// **'Username must be at least 4 characters'**
  String get profileErrorUsernameLength;

  /// No description provided for @profileErrorUsernameTaken.
  ///
  /// In en, this message translates to:
  /// **'This username is already taken. Please try another.'**
  String get profileErrorUsernameTaken;

  /// No description provided for @profileUsernameUpdated.
  ///
  /// In en, this message translates to:
  /// **'Username updated!'**
  String get profileUsernameUpdated;

  /// No description provided for @profileImageUploadFailed.
  ///
  /// In en, this message translates to:
  /// **'Image upload failed.'**
  String get profileImageUploadFailed;

  /// No description provided for @profileImageUploadSuccess.
  ///
  /// In en, this message translates to:
  /// **'Profile picture updated!'**
  String get profileImageUploadSuccess;

  /// No description provided for @profileErrorImageSave.
  ///
  /// In en, this message translates to:
  /// **'Failed to save image URL: {error}'**
  String profileErrorImageSave(String error);

  /// No description provided for @profileSectionCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get profileSectionCommunity;

  /// No description provided for @profileInviteCode.
  ///
  /// In en, this message translates to:
  /// **'Your Invite Code: {code}'**
  String profileInviteCode(String code);

  /// No description provided for @profileShare.
  ///
  /// In en, this message translates to:
  /// **'Tap to share'**
  String get profileShare;

  /// No description provided for @profileCopyCode.
  ///
  /// In en, this message translates to:
  /// **'Copy Code'**
  String get profileCopyCode;

  /// No description provided for @profileCopyCodeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Copy your invite code to the clipboard'**
  String get profileCopyCodeSubtitle;

  /// No description provided for @profileCopyCodeSuccess.
  ///
  /// In en, this message translates to:
  /// **'Invite code copied to clipboard!'**
  String get profileCopyCodeSuccess;

  /// No description provided for @profileTelegram.
  ///
  /// In en, this message translates to:
  /// **'Join our Telegram'**
  String get profileTelegram;

  /// No description provided for @profileTelegramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get news and chat with the community'**
  String get profileTelegramSubtitle;

  /// No description provided for @profileTwitter.
  ///
  /// In en, this message translates to:
  /// **'Follow us on X (Twitter)'**
  String get profileTwitter;

  /// No description provided for @profileTwitterSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Stay up-to-date with announcements'**
  String get profileTwitterSubtitle;

  /// No description provided for @profileInstagram.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Instagram'**
  String get profileInstagram;

  /// No description provided for @profileInstagramSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See our journey'**
  String get profileInstagramSubtitle;

  /// No description provided for @profileTikTok.
  ///
  /// In en, this message translates to:
  /// **'Watch us on TikTok'**
  String get profileTikTok;

  /// No description provided for @profileTikTokSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Latest updates and clips'**
  String get profileTikTokSubtitle;

  /// No description provided for @profileWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit our Website'**
  String get profileWebsite;

  /// No description provided for @profileWebsiteSubtitle.
  ///
  /// In en, this message translates to:
  /// **'onnetworkapp.com'**
  String get profileWebsiteSubtitle;

  /// No description provided for @profileSectionSettings.
  ///
  /// In en, this message translates to:
  /// **'Settings & Security'**
  String get profileSectionSettings;

  /// No description provided for @profileNotifSettings.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get profileNotifSettings;

  /// No description provided for @profileNotifSettingsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Manage your app notifications'**
  String get profileNotifSettingsSubtitle;

  /// No description provided for @profileChangePassword.
  ///
  /// In en, this message translates to:
  /// **'Change Password'**
  String get profileChangePassword;

  /// No description provided for @profileChangePasswordSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Send a password reset email'**
  String get profileChangePasswordSubtitle;

  /// No description provided for @profileChangePasswordSuccess.
  ///
  /// In en, this message translates to:
  /// **'Password reset email sent. Check your inbox!'**
  String get profileChangePasswordSuccess;

  /// No description provided for @profileSectionAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profileSectionAbout;

  /// No description provided for @profileProjectInfo.
  ///
  /// In en, this message translates to:
  /// **'Project Info & Whitepaper'**
  String get profileProjectInfo;

  /// No description provided for @profileProjectInfoSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Learn about our vision and roadmap'**
  String get profileProjectInfoSubtitle;

  /// No description provided for @profileTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get profileTerms;

  /// No description provided for @profileTermsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Read our terms and conditions'**
  String get profileTermsSubtitle;

  /// No description provided for @profilePrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get profilePrivacy;

  /// No description provided for @profilePrivacySubtitle.
  ///
  /// In en, this message translates to:
  /// **'How we handle your data'**
  String get profilePrivacySubtitle;

  /// No description provided for @profileSectionDanger.
  ///
  /// In en, this message translates to:
  /// **'Danger Zone'**
  String get profileSectionDanger;

  /// No description provided for @profileDeleteAccount.
  ///
  /// In en, this message translates to:
  /// **'Delete Account'**
  String get profileDeleteAccount;

  /// No description provided for @profileDeleteAccountSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Permanently delete your account and all data'**
  String get profileDeleteAccountSubtitle;

  /// No description provided for @profileDeleteAccountDialogTitle.
  ///
  /// In en, this message translates to:
  /// **'Are you absolutely sure?'**
  String get profileDeleteAccountDialogTitle;

  /// No description provided for @profileDeleteAccountDialogContent.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible.\n\nAll your data, including your ON coin balance and team connections, will be permanently deleted. This cannot be undone.'**
  String get profileDeleteAccountDialogContent;

  /// No description provided for @profileDeleteAccountDialogButton.
  ///
  /// In en, this message translates to:
  /// **'Delete My Account'**
  String get profileDeleteAccountDialogButton;

  /// No description provided for @profileDeleteAccountSuccess.
  ///
  /// In en, this message translates to:
  /// **'Account permanently deleted.'**
  String get profileDeleteAccountSuccess;

  /// No description provided for @profileDeleteAccountError.
  ///
  /// In en, this message translates to:
  /// **'Error deleting account: {error}'**
  String profileDeleteAccountError(String error);

  /// No description provided for @profileSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign Out'**
  String get profileSignOut;

  /// No description provided for @profileSignOutError.
  ///
  /// In en, this message translates to:
  /// **'Error signing out: {error}'**
  String profileSignOutError(String error);

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Notification Settings'**
  String get settingsTitle;

  /// No description provided for @settingsMiningTitle.
  ///
  /// In en, this message translates to:
  /// **'Mining Session Reminders'**
  String get settingsMiningTitle;

  /// No description provided for @settingsMiningSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when your 24-hour session ends.'**
  String get settingsMiningSubtitle;

  /// No description provided for @settingsTeamTitle.
  ///
  /// In en, this message translates to:
  /// **'Team Reminders'**
  String get settingsTeamTitle;

  /// No description provided for @settingsTeamSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Allow your team members to \"ping\" you to start mining.'**
  String get settingsTeamSubtitle;

  /// No description provided for @settingsAdBoostTitle.
  ///
  /// In en, this message translates to:
  /// **'Ad Boost Reminders'**
  String get settingsAdBoostTitle;

  /// No description provided for @settingsAdBoostSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get notified when your 1.5X Ad Boost expires.'**
  String get settingsAdBoostSubtitle;

  /// No description provided for @settingsErrorUpdate.
  ///
  /// In en, this message translates to:
  /// **'Failed to update settings: {error}'**
  String settingsErrorUpdate(String error);

  /// No description provided for @projectInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Our Vision'**
  String get projectInfoTitle;

  /// No description provided for @projectInfoSection1Title.
  ///
  /// In en, this message translates to:
  /// **'What is ON Network?'**
  String get projectInfoSection1Title;

  /// No description provided for @projectInfoSection1Content.
  ///
  /// In en, this message translates to:
  /// **'ON Network is a decentralized digital ecosystem designed for the future. By tapping the button every 24 hours, you are validating your presence as a human Pioneer and contributing to the network\'s security and growth. In return, you earn ON, the native digital currency of our network.'**
  String get projectInfoSection1Content;

  /// No description provided for @projectInfoSection2Title.
  ///
  /// In en, this message translates to:
  /// **'ON Coin Utility'**
  String get projectInfoSection2Title;

  /// No description provided for @projectInfoSection2Content.
  ///
  /// In en, this message translates to:
  /// **'The ON Coins you are earning are currently being distributed to early Pioneers like you. As the network grows, ON\'s primary purpose will be to facilitate transactions in the future Marketplace and support network functions. The earning rate decreases as the network grows, rewarding early participation in building the community.'**
  String get projectInfoSection2Content;

  /// No description provided for @projectInfoSection3Title.
  ///
  /// In en, this message translates to:
  /// **'Our Roadmap'**
  String get projectInfoSection3Title;

  /// No description provided for @projectInfoRoadmap1Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 1: Pioneers (You are here)'**
  String get projectInfoRoadmap1Title;

  /// No description provided for @projectInfoRoadmap1Content.
  ///
  /// In en, this message translates to:
  /// **'Grow the network from 0 to 1 million Pioneers. Distribute ON coin through engagement.'**
  String get projectInfoRoadmap1Content;

  /// No description provided for @projectInfoRoadmap2Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 2: Marketplace'**
  String get projectInfoRoadmap2Title;

  /// No description provided for @projectInfoRoadmap2Content.
  ///
  /// In en, this message translates to:
  /// **'Launch the ON Marketplace where members can exchange goods and services using their earned ON Coins.'**
  String get projectInfoRoadmap2Content;

  /// No description provided for @projectInfoRoadmap3Title.
  ///
  /// In en, this message translates to:
  /// **'Phase 3: Mainnet & Exchange'**
  String get projectInfoRoadmap3Title;

  /// No description provided for @projectInfoRoadmap3Content.
  ///
  /// In en, this message translates to:
  /// **'Transition to a fully decentralized blockchain (Mainnet) and enable ON functionality on major cryptocurrency platforms (subject to compliance).'**
  String get projectInfoRoadmap3Content;

  /// No description provided for @settingsLangTitle.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLangTitle;

  /// No description provided for @settingsLangSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change the application language'**
  String get settingsLangSubtitle;

  /// No description provided for @marketplaceTooltipEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get marketplaceTooltipEmail;

  /// No description provided for @profileEmail.
  ///
  /// In en, this message translates to:
  /// **'Contact Support'**
  String get profileEmail;

  /// No description provided for @profileEmailSubtitle.
  ///
  /// In en, this message translates to:
  /// **'support@onnetworkapp.com'**
  String get profileEmailSubtitle;

  /// No description provided for @marketplaceTooltipFacebook.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Facebook'**
  String get marketplaceTooltipFacebook;

  /// No description provided for @marketplaceTooltipYoutube.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to our YouTube'**
  String get marketplaceTooltipYoutube;

  /// No description provided for @profileFacebook.
  ///
  /// In en, this message translates to:
  /// **'Follow us on Facebook'**
  String get profileFacebook;

  /// No description provided for @profileFacebookSubtitle.
  ///
  /// In en, this message translates to:
  /// **'See our updates and community'**
  String get profileFacebookSubtitle;

  /// No description provided for @profileYoutube.
  ///
  /// In en, this message translates to:
  /// **'Subscribe to our YouTube'**
  String get profileYoutube;

  /// No description provided for @profileYoutubeSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Watch project updates and tutorials'**
  String get profileYoutubeSubtitle;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'de',
        'en',
        'es',
        'fr',
        'hi',
        'id',
        'ja',
        'ko',
        'pt',
        'ru',
        'tr',
        'vi'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'id':
      return AppLocalizationsId();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'pt':
      return AppLocalizationsPt();
    case 'ru':
      return AppLocalizationsRu();
    case 'tr':
      return AppLocalizationsTr();
    case 'vi':
      return AppLocalizationsVi();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
