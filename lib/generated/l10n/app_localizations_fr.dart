// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get helloWorld => 'Bonjour le monde !';

  @override
  String get updateRequiredTitle => 'Mise à jour requise';

  @override
  String get updateRequiredMessage =>
      'Une nouvelle version améliorée de ON Network est disponible. Vous devez mettre à jour l\'application pour continuer à gagner.';

  @override
  String get updateNowButton => 'Mettre à jour';

  @override
  String get navHome => 'Accueil';

  @override
  String get navTeam => 'Équipe';

  @override
  String get navMarketplace => 'Marché';

  @override
  String get navProfile => 'Profil';

  @override
  String get authWelcomeBack => 'Content de vous revoir !';

  @override
  String get authCreateAccount => 'Créez votre compte';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authErrorEmailEmpty => 'Veuillez saisir une adresse e-mail';

  @override
  String get authErrorEmailInvalid =>
      'Veuillez saisir une adresse e-mail valide';

  @override
  String get authPassword => 'Mot de passe';

  @override
  String get authErrorPasswordEmpty => 'Veuillez saisir votre mot de passe';

  @override
  String get authErrorPasswordLength =>
      'Le mot de passe doit contenir au moins 6 caractères';

  @override
  String get authConfirmPassword => 'Confirmer le mot de passe';

  @override
  String get authErrorConfirmPasswordEmpty =>
      'Veuillez confirmer votre mot de passe';

  @override
  String get authErrorPasswordsNoMatch =>
      'Les mots de passe ne correspondent pas';

  @override
  String get authUsername => 'Nom d\'utilisateur';

  @override
  String get authUsernameHint => 'Doit contenir au moins 3 caractères';

  @override
  String get authErrorUsernameLength =>
      'Le nom d\'utilisateur doit contenir au moins 3 caractères.';

  @override
  String get authInviteCode => 'Code d\'invitation (Optionnel)';

  @override
  String get authInviteCodeHint => 'ex: A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'J\'ai 18 ans ou plus et je suis légalement éligible pour utiliser ce service.';

  @override
  String get authTermsConfirmationPrefix => 'J\'ai lu et j\'accepte les ';

  @override
  String get authTermsOfService => 'Conditions d\'utilisation';

  @override
  String get authTermsConfirmationMid => ' et la ';

  @override
  String get authPrivacyPolicy => 'Politique de confidentialité';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'Vous devez avoir 18 ans ou plus pour utiliser ON Network.';

  @override
  String get authErrorTerms =>
      'Vous devez accepter les Conditions d\'utilisation et la Politique de confidentialité.';

  @override
  String get authLogin => 'Connexion';

  @override
  String get authRegister => 'S\'inscrire';

  @override
  String get authSignInWithGoogle => 'Se connecter avec Google';

  @override
  String get authSignUpWithGoogle => 'S\'inscrire avec Google';

  @override
  String get authSwitchToRegister => 'Pas de compte ? S\'inscrire';

  @override
  String get authSwitchToLogin => 'Déjà un compte ? Se connecter';

  @override
  String get authForgotPassword => 'Mot de passe oublié ?';

  @override
  String get authResetPassword => 'Réinitialiser le mot de passe';

  @override
  String get authEnterEmailHint => 'Saisissez votre e-mail';

  @override
  String get authCancel => 'Annuler';

  @override
  String get authSendResetLink => 'Envoyer le lien de réinitialisation';

  @override
  String get authResetLinkSent =>
      'Lien de réinitialisation du mot de passe envoyé à votre e-mail.';

  @override
  String get onboardingWelcomeTitle => 'Bienvenue sur ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Vous êtes maintenant un Pionnier dans un nouvel écosystème numérique. Votre voyage commence aujourd\'hui.';

  @override
  String get onboardingMineTitle => 'Appuyez pour Miner';

  @override
  String get onboardingMineDesc =>
      'Appuyez sur le bouton d\'alimentation toutes les 24 heures pour prouver que vous êtes humain et gagner vos ON coins.';

  @override
  String get onboardingTeamTitle => 'Construisez votre Équipe';

  @override
  String get onboardingTeamDesc =>
      'Invitez vos amis à rejoindre votre équipe. Plus vous avez de membres actifs, plus vous gagnez rapidement.';

  @override
  String get onboardingStart => 'Commençons !';

  @override
  String get onboardingNext => 'Suivant';

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
    return 'Erreur lors du chargement des données. Veuillez vérifier votre connexion et réessayer.\nDétails : $error';
  }

  @override
  String get homeStatsBaseRate => 'Taux de Base';

  @override
  String get homeStatsBaseRateSubtitle => 'Votre vitesse de base actuelle';

  @override
  String get homeStatsBaseRateInfoTitle => 'Taux de Base';

  @override
  String get homeStatsBaseRateInfo =>
      'Ceci est votre vitesse de gain de base actuelle. Elle diminue globalement pour tous les utilisateurs à mesure que le réseau se développe, selon le calendrier de halving.';

  @override
  String get homeStatsEffectiveRate => 'Taux Effectif';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (BOOST 2X !)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (BOOST 1.5X !)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus de l\'équipe ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Taux Effectif';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Votre vitesse de gain totale actuelle :\nTaux de Base + (Membres Actifs de l\'Équipe * % de votre Niveau de Bonus * Taux de Base)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 Vous bénéficiez actuellement d\'un Boost de Démarrage 2X !';

  @override
  String get homeStatsEffectiveRateInfoAdBoost =>
      '\n\n⏱️ Boost Publicitaire Actif !';

  @override
  String get homeStatsGlobalMined => 'Miné Globalement';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Miné Globalement';

  @override
  String get homeStatsGlobalMinedInfo =>
      'Le montant total de ON coins gagnés par tous les Pionniers dans le monde entier vers l\'objectif initial de 1 Milliard d\'ON.';

  @override
  String get homeStatsNextHalving => 'Prochain Halving';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Actuel : $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Halving du Taux de Gain';

  @override
  String get homeStatsNextHalvingInfo =>
      'Le taux de gain de base diminue globalement à mesure que de plus en plus de Pionniers rejoignent. Votre taux de base personnel est mis à jour en conséquence.\n\n**Phase 1 : Pionniers (0 - 100k)**\n• 0 - 10k:    1.00 ON/h\n• 10k - 20k:  0.95 ON/h\n• 20k - 30k:  0.90 ON/h\n• 30k - 40k:  0.85 ON/h\n• 50k - 60k:  0.80 ON/h\n• 60k - 70k:  0.75 ON/h\n• 70k - 80k:  0.70 ON/h\n• 80k - 90k:  0.65 ON/h\n• 90k - 100k: 0.60 ON/h\n• 90k - 100k: 0.55 ON/h\n\n**Phase 2 : Ambassadeurs (100k - 1M)**\n• 100k - 200k: 0.45 ON/h\n• 200k - 300k: 0.40 ON/h\n• 300k - 400k: 0.34 ON/h\n• 400k - 500k: 0.28 ON/h\n• 500k - 600k: 0.21 ON/h\n• 600k - 700k: 0.15 ON/h\n• 700k - 800k: 0.10 ON/h\n• 800k - 900k: 0.06 ON/h\n• 900k - 1M:   0.03 ON/h\n\n**Phase 3 : Gardiens (1M+)**\n• 1M - 2M: 0.01 ON/h\n• 2M+ :    0.005 ON/h (Taux Hérité Final)\n\nVotre taux effectif augmente avec les membres actifs de l\'équipe en fonction de votre niveau actuel (Standard 25%, Bronze 27%, Argent 30%, Or 35%) appliqué à VOTRE Taux de Base actuel par membre actif.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Compte à rebours Mainnet';

  @override
  String get homeStatsMainnetInfo =>
      'Ceci est la date prévue pour notre lancement du Mainnet. À ce moment-là, la distribution (gain) de ON coins s\'arrêtera et le Marché ON sera pleinement opérationnel.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Gain de $rate ON/h$boost avec $count membre(s) actif(s)';
  }

  @override
  String get homeMiningStatusClaim =>
      'Appuyez sur le bouton pour réclamer les gains de la dernière session et en démarrer une nouvelle !';

  @override
  String get homeMiningStatusStart =>
      'Appuyez sur le bouton pour commencer à gagner !';

  @override
  String get homeMiningButtonActive => 'ACTIF';

  @override
  String get homeMiningStarterBoost =>
      'Boost de Démarrage Actif ! (Vitesse 2X)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Boost Publicitaire actif pendant : $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Regarder pub pour Boost 1.5X ($count restants)';
  }

  @override
  String get homeMiningAdLoading => 'Chargement de la pub Boost...';

  @override
  String get homeMiningAdLoadingShort => 'Chargement du boost...';

  @override
  String get homeMiningAdLimit =>
      'Limite quotidienne de boosts publicitaires atteinte.';

  @override
  String get homeActivateSnackbar => 'Activation de la session de gain...';

  @override
  String get homeActivatedSnackbar =>
      'Session de gain activée ! Gains de la dernière session ajoutés.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Votre Équipe';

  @override
  String get teamRefreshTooltip => 'Actualiser l\'Équipe';

  @override
  String get teamRefreshSnackbar => 'Actualisation des données de l\'équipe...';

  @override
  String get teamErrorInviteCode =>
      'Impossible de charger le code d\'invitation';

  @override
  String teamInviteCode(String code) {
    return 'Votre Code d\'Invitation : $code';
  }

  @override
  String get teamErrorLoading =>
      'Impossible de charger les membres de l\'équipe.\nVeuillez vérifier votre connexion.';

  @override
  String teamYourContribution(String rate) {
    return 'Votre Contribution : +$rate ON/heure';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Votre Niveau de Bônus : $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Prochain Objectif : $goal';
  }

  @override
  String get teamNextGoalMax => 'Niveau Maximum Atteint !';

  @override
  String teamNextGoalBronze(Object count) {
    return 'Encore $count membre(s) pour Bronze (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return 'Encore $count membre(s) pour Argent (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return 'Encore $count membre(s) pour Or (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Membres Actuels : $total ($active actifs)';
  }

  @override
  String get teamInviteButton => 'Inviter de Nouveaux Membres';

  @override
  String get teamEmptyTitle => 'Votre équipe est vide.';

  @override
  String get teamEmptyDescription =>
      'Invitez des amis en utilisant votre code pour construire votre équipe et augmenter votre taux de minage !';

  @override
  String get teamMemberActive => 'Actif';

  @override
  String get teamMemberInactive => 'Inactif';

  @override
  String get teamMemberTapToRemind => 'Appuyez pour Rappeler';

  @override
  String get teamMemberTooltipReport => 'Signaler l\'utilisateur';

  @override
  String get teamMemberTooltipRemind => 'Rappeler l\'utilisateur';

  @override
  String teamRemindSnackbar(String username) {
    return 'Envoi d\'un rappel à $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Échec de l\'envoi du rappel : $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Rappel envoyé à $username !';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Signaler $username';
  }

  @override
  String get teamReportDialogContent =>
      'Êtes-vous sûr de vouloir signaler cet utilisateur pour contenu inapproprié (ex: nom d\'utilisateur ou photo de profil) ?\n\nCela enverra un avis à notre équipe de modération pour examen.';

  @override
  String get teamReportDialogButton => 'Signaler';

  @override
  String teamReportSnackbar(String username) {
    return 'Envoi du signalement pour $username...';
  }

  @override
  String get teamReportSuccess =>
      'Signalement envoyé. Notre équipe l\'examinera sous peu.';

  @override
  String teamReportError(String error) {
    return 'Échec de l\'envoi du signalement : $error';
  }

  @override
  String get teamShareTitle => 'Partagez votre Invitation';

  @override
  String get teamShareSubtitle =>
      'Comment souhaitez-vous partager votre invitation ?';

  @override
  String get teamShareImageButton => 'Partager en tant que Carte Image';

  @override
  String get teamShareTextButton => 'Partager en tant que Texte';

  @override
  String get teamShareImageGenerating =>
      'Génération de votre carte d\'invitation...';

  @override
  String teamShareImageError(String error) {
    return 'Erreur lors du partage de la carte : $error. Partage en tant que texte à la place.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Je construis l\'avenir des réseaux numériques avec ON Network. Je vous veux dans mon équipe ! 🔥\n\nVoici votre cadeau de bienvenue :\n✅ 1 ON Coin GRATUIT instantanément\n✅ 24 Heures de Boost de Vitesse 2X\n\nUtilisez mon code d\'invitation pour commencer : $code\n\nRejoignez maintenant et réclamez votre place :\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Rejoignez mon équipe sur ON Network ! Utilisez mon code : $code\n\nRejoignez maintenant :\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username vous invite à rejoindre';
  }

  @override
  String get inviteCardTitle => 'VOTRE VOYAGE COMMENCE ICI !';

  @override
  String get inviteCardUseCode => 'UTILISEZ MON CODE D\'INVITATION';

  @override
  String get inviteCardGiftTitle =>
      'REJOIGNEZ MAINTENANT ET RECEVEZ VOTRE CADEAU DE BIENVENUE :';

  @override
  String get inviteCardGift1 => '1 ON Coin GRATUIT instantanément';

  @override
  String get inviteCardGift2 => '24 Heures de Boost de Vitesse 2X';

  @override
  String get inviteCardButton => 'APPUYEZ POUR REJOINDRE & RÉCLAMER VOTRE ON !';

  @override
  String get marketplaceTitle => 'Marché : Bientôt disponible';

  @override
  String get marketplaceDescription =>
      'Nous construisons un marché décentralisé où vous pourrez acheter et vendre des biens et services en utilisant vos ON coins gagnés.\n\nContinuez à miner et augmentez votre solde !';

  @override
  String get marketplaceCommunity => 'REJOIGNEZ LA COMMUNAUTÉ';

  @override
  String get marketplaceTooltipTelegram => 'Rejoignez notre Telegram';

  @override
  String get marketplaceTooltipTwitter => 'Suivez-nous sur X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Suivez-nous sur Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Regardez-nous sur TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Visitez notre site Web';

  @override
  String get profileScreenTitle => 'Profil';

  @override
  String get profileUsername => 'Nom d\'utilisateur';

  @override
  String get profileErrorUsernameLength =>
      'Le nom d\'utilisateur doit contenir au moins 4 caractères';

  @override
  String get profileErrorUsernameTaken =>
      'Ce nom d\'utilisateur est déjà pris. Veuillez en essayer un autre.';

  @override
  String get profileUsernameUpdated => 'Nom d\'utilisateur mis à jour !';

  @override
  String get profileImageUploadFailed => 'Échec du téléchargement de l\'image.';

  @override
  String get profileImageUploadSuccess => 'Photo de profil mise à jour !';

  @override
  String profileErrorImageSave(String error) {
    return 'Échec de l\'enregistrement de l\'URL de l\'image : $error';
  }

  @override
  String get profileSectionCommunity => 'Communauté';

  @override
  String profileInviteCode(String code) {
    return 'Votre Code d\'Invitation : $code';
  }

  @override
  String get profileShare => 'Appuyez pour partager';

  @override
  String get profileCopyCode => 'Copier le Code';

  @override
  String get profileCopyCodeSubtitle =>
      'Copiez votre code d\'invitation dans le presse-papiers';

  @override
  String get profileCopyCodeSuccess =>
      'Code d\'invitation copié dans le presse-papiers !';

  @override
  String get profileTelegram => 'Rejoignez notre Telegram';

  @override
  String get profileTelegramSubtitle =>
      'Recevez des nouvelles et discutez avec la communauté';

  @override
  String get profileTwitter => 'Suivez-nous sur X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Restez à jour avec les annonces';

  @override
  String get profileInstagram => 'Suivez-nous sur Instagram';

  @override
  String get profileInstagramSubtitle => 'Voyez notre parcours';

  @override
  String get profileTikTok => 'Regardez-nous sur TikTok';

  @override
  String get profileTikTokSubtitle => 'Dernières mises à jour et clips';

  @override
  String get profileWebsite => 'Visitez notre site Web';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Paramètres et Sécurité';

  @override
  String get profileNotifSettings => 'Paramètres de notification';

  @override
  String get profileNotifSettingsSubtitle =>
      'Gérez les notifications de votre application';

  @override
  String get profileChangePassword => 'Changer le mot de passe';

  @override
  String get profileChangePasswordSubtitle =>
      'Envoyer un e-mail de réinitialisation de mot de passe';

  @override
  String get profileChangePasswordSuccess =>
      'E-mail de réinitialisation envoyé. Vérifiez votre boîte de réception !';

  @override
  String get profileSectionAbout => 'À propos';

  @override
  String get profileProjectInfo => 'Infos Projet & Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Découvrez notre vision et notre feuille de route';

  @override
  String get profileTerms => 'Conditions d\'utilisation';

  @override
  String get profileTermsSubtitle => 'Lisez nos termes et conditions';

  @override
  String get profilePrivacy => 'Politique de confidentialité';

  @override
  String get profilePrivacySubtitle => 'Comment nous traitons vos données';

  @override
  String get profileSectionDanger => 'Zone de Danger';

  @override
  String get profileDeleteAccount => 'Supprimer le compte';

  @override
  String get profileDeleteAccountSubtitle =>
      'Supprimez définitivement votre compte et toutes vos données';

  @override
  String get profileDeleteAccountDialogTitle => 'Êtes-vous absolument sûr ?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Cette action est irréversible.\n\nToutes vos données, y compris votre solde de ON coins et vos connexions d\'équipe, seront définitivement supprimées. Cela ne peut pas être annulé.';

  @override
  String get profileDeleteAccountDialogButton => 'Supprimer Mon Compte';

  @override
  String get profileDeleteAccountSuccess => 'Compte supprimé définitivement.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Erreur lors de la suppression du compte : $error';
  }

  @override
  String get profileSignOut => 'Se déconnecter';

  @override
  String profileSignOutError(String error) {
    return 'Erreur lors de la déconnexion : $error';
  }

  @override
  String get settingsTitle => 'Paramètres de notification';

  @override
  String get settingsMiningTitle => 'Rappels de session de minage';

  @override
  String get settingsMiningSubtitle =>
      'Recevez une notification lorsque votre session de 24 heures se termine.';

  @override
  String get settingsTeamTitle => 'Rappels d\'équipe';

  @override
  String get settingsTeamSubtitle =>
      'Autorisez les membres de votre équipe à vous \"pinger\" pour commencer à miner.';

  @override
  String get settingsAdBoostTitle => 'Rappels de Boost Publicitaire';

  @override
  String get settingsAdBoostSubtitle =>
      'Recevez une notification lorsque votre Boost Publicitaire 1.5X expire.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Échec de la mise à jour des paramètres : $error';
  }

  @override
  String get projectInfoTitle => 'Notre Vision';

  @override
  String get projectInfoSection1Title => 'Qu\'est-ce que ON Network ?';

  @override
  String get projectInfoSection1Content =>
      'ON Network est un écosystème numérique décentralisé conçu pour l\'avenir. En appuyant sur le bouton toutes les 24 heures, vous validez votre présence en tant que Pionnier humain et contribuez à la sécurité et à la croissance du réseau. En retour, vous gagnez des ON, la monnaie numérique native de notre réseau.';

  @override
  String get projectInfoSection2Title => 'Utilité du ON Coin';

  @override
  String get projectInfoSection2Content =>
      'Les ON Coins que vous gagnez sont actuellement distribués aux premiers Pionniers comme vous. À mesure que le réseau se développe, l\'objectif principal d\'ON sera de faciliter les transactions sur le futur Marché et de soutenir les fonctions du réseau. Le taux de gain diminue à mesure que le réseau se développe, récompensant la participation précoce à la construction de la communauté.';

  @override
  String get projectInfoSection3Title => 'Notre Feuille de Route';

  @override
  String get projectInfoRoadmap1Title => 'Phase 1 : Pionniers (Vous êtes ici)';

  @override
  String get projectInfoRoadmap1Content =>
      'Faire croître le réseau de 0 à 1 million de Pionniers. Distribuer des ON coins via l\'engagement.';

  @override
  String get projectInfoRoadmap2Title => 'Phase 2 : Marché';

  @override
  String get projectInfoRoadmap2Content =>
      'Lancer le Marché ON où les membres peuvent échanger des biens et services en utilisant leurs ON Coins gagnés.';

  @override
  String get projectInfoRoadmap3Title => 'Phase 3 : Mainnet et Échange';

  @override
  String get projectInfoRoadmap3Content =>
      'Transition vers une blockchain entièrement décentralisée (Mainnet) et activation de la fonctionnalité ON sur les principales plateformes de cryptomonnaie (sous réserve de conformité).';

  @override
  String get settingsLangTitle => 'Langue';

  @override
  String get settingsLangSubtitle => 'Changer la langue de l\'application';

  @override
  String get marketplaceTooltipEmail => 'Contacter le support';

  @override
  String get profileEmail => 'Contacter le support';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Suivez-nous sur Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Abonnez-vous à notre YouTube';

  @override
  String get profileFacebook => 'Suivez-nous sur Facebook';

  @override
  String get profileFacebookSubtitle =>
      'Voir nos mises à jour et la communauté';

  @override
  String get profileYoutube => 'Abonnez-vous à notre YouTube';

  @override
  String get profileYoutubeSubtitle =>
      'Regardez les mises à jour du projet et les tutoriels';
}
