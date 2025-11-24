// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get helloWorld => '¡Hola Mundo!';

  @override
  String get updateRequiredTitle => 'Actualización Requerida';

  @override
  String get updateRequiredMessage =>
      'Una versión nueva y mejorada de ON Network está disponible. Debes actualizar la aplicación para seguir ganando.';

  @override
  String get updateNowButton => 'Actualizar ahora';

  @override
  String get navHome => 'Inicio';

  @override
  String get navTeam => 'Equipo';

  @override
  String get navMarketplace => 'Mercado';

  @override
  String get navProfile => 'Perfil';

  @override
  String get authWelcomeBack => '¡Bienvenido de vuelta!';

  @override
  String get authCreateAccount => 'Crea tu Cuenta';

  @override
  String get authEmail => 'Correo electrónico';

  @override
  String get authErrorEmailEmpty =>
      'Por favor, introduce un correo electrónico';

  @override
  String get authErrorEmailInvalid =>
      'Por favor, introduce un correo electrónico válido';

  @override
  String get authPassword => 'Contraseña';

  @override
  String get authErrorPasswordEmpty => 'Por favor, introduce tu contraseña';

  @override
  String get authErrorPasswordLength =>
      'La contraseña debe tener al menos 6 caracteres';

  @override
  String get authConfirmPassword => 'Confirmar Contraseña';

  @override
  String get authErrorConfirmPasswordEmpty =>
      'Por favor, confirma tu contraseña';

  @override
  String get authErrorPasswordsNoMatch => 'Las contraseñas no coinciden';

  @override
  String get authUsername => 'Nombre de usuario';

  @override
  String get authUsernameHint => 'Debe tener al menos 3 caracteres';

  @override
  String get authErrorUsernameLength =>
      'El nombre de usuario debe tener al menos 3 caracteres.';

  @override
  String get authInviteCode => 'Código de Invitación (Opcional)';

  @override
  String get authInviteCodeHint => 'ej: A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'Tengo 18 años o más y soy legalmente elegible para usar este servicio.';

  @override
  String get authTermsConfirmationPrefix => 'He leído y acepto los ';

  @override
  String get authTermsOfService => 'Términos de Servicio';

  @override
  String get authTermsConfirmationMid => ' y la ';

  @override
  String get authPrivacyPolicy => 'Política de Privacidad';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge => 'Debes tener 18 años o más para usar ON Network.';

  @override
  String get authErrorTerms =>
      'Debes aceptar los Términos de Servicio y la Política de Privacidad.';

  @override
  String get authLogin => 'Iniciar sesión';

  @override
  String get authRegister => 'Registrarse';

  @override
  String get authSignInWithGoogle => 'Iniciar sesión con Google';

  @override
  String get authSignUpWithGoogle => 'Registrarse con Google';

  @override
  String get authSwitchToRegister => '¿No tienes cuenta? Regístrate';

  @override
  String get authSwitchToLogin => '¿Ya tienes cuenta? Inicia sesión';

  @override
  String get authForgotPassword => '¿Olvidaste tu contraseña?';

  @override
  String get authResetPassword => 'Restablecer Contraseña';

  @override
  String get authEnterEmailHint => 'Introduce tu correo electrónico';

  @override
  String get authCancel => 'Cancelar';

  @override
  String get authSendResetLink => 'Enviar enlace de restablecimiento';

  @override
  String get authResetLinkSent =>
      'Enlace de restablecimiento de contraseña enviado a tu correo.';

  @override
  String get onboardingWelcomeTitle => 'Bienvenido a ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Ahora eres un Pionero en un nuevo ecosistema digital. Tu viaje comienza hoy.';

  @override
  String get onboardingMineTitle => 'Toca para Minar';

  @override
  String get onboardingMineDesc =>
      'Toca el botón de encendido cada 24 horas para demostrar que eres humano y ganar tus ON coins.';

  @override
  String get onboardingTeamTitle => 'Construye tu Equipo';

  @override
  String get onboardingTeamDesc =>
      'Invita a tus amigos a unirse a tu equipo. Cuantos más miembros activos tengas, más rápido ganarás.';

  @override
  String get onboardingStart => '¡Comencemos!';

  @override
  String get onboardingNext => 'Siguiente';

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
    return 'Error al cargar datos. Por favor, comprueba tu conexión e inténtalo de nuevo.\nDetalles: $error';
  }

  @override
  String get homeStatsBaseRate => 'Tasa Base';

  @override
  String get homeStatsBaseRateSubtitle => 'Tu velocidad base actual';

  @override
  String get homeStatsBaseRateInfoTitle => 'Tasa Base';

  @override
  String get homeStatsBaseRateInfo =>
      'Esta es tu velocidad de ganancia base actual. Disminuye globalmente para todos los usuarios a medida que la red crece, según el calendario de halving.';

  @override
  String get homeStatsEffectiveRate => 'Tasa Efectiva';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (¡BOOST 2X!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (¡BOOST 1.5X!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus del equipo ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Tasa Efectiva';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Tu velocidad de ganancia total actual:\nTasa Base + (Miembros Activos del Equipo * % de tu Nivel de Bonus * Tasa Base)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 ¡Actualmente estás en un Boost de Inicio 2X!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost =>
      '\n\n⏱️ ¡Boost de Anuncio Activo!';

  @override
  String get homeStatsGlobalMined => 'Minado Global';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Minado Global';

  @override
  String get homeStatsGlobalMinedInfo =>
      'La cantidad total de ON coins ganadas por todos los Pioneros en todo el mundo hacia el objetivo inicial de 1 Billón de ON.';

  @override
  String get homeStatsNextHalving => 'Próximo Halving';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Actual: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Halving de Tasa de Ganancia';

  @override
  String get homeStatsNextHalvingInfo =>
      'La tasa de ganancia base disminuye globalmente a medida que más Pioneros se unen. Tu tasa base personal se actualiza en consecuencia.\n\n**Fase 1: Pioneros (0 - 100k)**\n• 0 - 10k:    1.00 ON/hr\n• 10k - 20k:  0.95 ON/hr\n• 20k - 30k:  0.90 ON/hr\n• 30k - 40k:  0.85 ON/hr\n• 50k - 60k:  0.80 ON/hr\n• 60k - 70k:  0.75 ON/hr\n• 70k - 80k:  0.70 ON/hr\n• 80k - 90k:  0.65 ON/hr\n• 90k - 100k: 0.60 ON/hr\n• 90k - 100k: 0.55 ON/hr\n\n**Fase 2: Embajadores (100k - 1M)**\n• 100k - 200k: 0.45 ON/hr\n• 200k - 300k: 0.40 ON/hr\n• 300k - 400k: 0.34 ON/hr\n• 400k - 500k: 0.28 ON/hr\n• 500k - 600k: 0.21 ON/hr\n• 600k - 700k: 0.15 ON/hr\n• 700k - 800k: 0.10 ON/hr\n• 800k - 900k: 0.06 ON/hr\n• 900k - 1M:   0.03 ON/hr\n\n**Fase 3: Guardianes (1M+)**\n• 1M - 2M: 0.01 ON/hr\n• 2M+ :    0.005 ON/hr (Tasa Heredada Final)\n\nTu tasa efectiva aumenta con miembros activos del equipo basada en tu nivel actual (Estándar 25%, Bronce 27%, Plata 30%, Oro 35%) aplicado a TU Tasa Base actual por cada miembro activo.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Cuenta Regresiva Mainnet';

  @override
  String get homeStatsMainnetInfo =>
      'Esta es la fecha programada para nuestro lanzamiento de Mainnet. En este punto, la distribución (ganancia) de ON coin se detendrá y el Mercado ON estará en pleno funcionamiento.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Ganando a $rate ON/hr$boost con $count miembro(s) activo(s)';
  }

  @override
  String get homeMiningStatusClaim =>
      '¡Toca el botón para reclamar ganancias de la última sesión y comenzar una nueva!';

  @override
  String get homeMiningStatusStart => '¡Toca el botón para empezar a ganar!';

  @override
  String get homeMiningButtonActive => 'ACTIVO';

  @override
  String get homeMiningStarterBoost =>
      '¡Boost de Inicio Activo! (Velocidad 2X)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Boost de Anuncio activo por: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Ver Anuncio para Boost 1.5X ($count restantes)';
  }

  @override
  String get homeMiningAdLoading => 'Cargando Anuncio de Boost...';

  @override
  String get homeMiningAdLoadingShort => 'Cargando boost...';

  @override
  String get homeMiningAdLimit =>
      'Límite diario de boosts de anuncios alcanzado.';

  @override
  String get homeActivateSnackbar => 'Activando sesión de ganancias...';

  @override
  String get homeActivatedSnackbar =>
      '¡Sesión de ganancias activada! Ganancias de la última sesión añadidas.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Tu Equipo';

  @override
  String get teamRefreshTooltip => 'Actualizar Equipo';

  @override
  String get teamRefreshSnackbar => 'Actualizando datos del equipo...';

  @override
  String get teamErrorInviteCode => 'No se pudo cargar el código de invitación';

  @override
  String teamInviteCode(String code) {
    return 'Tu Código de Invitación: $code';
  }

  @override
  String get teamErrorLoading =>
      'No se pudieron cargar los miembros del equipo.\nPor favor, comprueba tu conexión.';

  @override
  String teamYourContribution(String rate) {
    return 'Tu Contribución: +$rate ON/hora';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Tu Nivel de Bonus: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Próximo Objetivo: $goal';
  }

  @override
  String get teamNextGoalMax => '¡Nivel Máximo Alcanzado!';

  @override
  String teamNextGoalBronze(Object count) {
    return '$count miembro(s) más para Bronce (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return '$count miembro(s) más para Plata (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return '$count miembro(s) más para Oro (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Miembros Actuales: $total ($active activos)';
  }

  @override
  String get teamInviteButton => 'Invitar Nuevos Miembros';

  @override
  String get teamEmptyTitle => 'Tu equipo está vacío.';

  @override
  String get teamEmptyDescription =>
      '¡Invita amigos usando tu código para construir tu equipo y aumentar tu tasa de minería!';

  @override
  String get teamMemberActive => 'Activo ahora';

  @override
  String get teamMemberInactive => 'Inactivo';

  @override
  String get teamMemberTapToRemind => 'Toca para Recordar';

  @override
  String get teamMemberTooltipReport => 'Reportar Usuario';

  @override
  String get teamMemberTooltipRemind => 'Recordar Usuario';

  @override
  String teamRemindSnackbar(String username) {
    return 'Enviando recordatorio a $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Fallo al enviar recordatorio: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return '¡Recordatorio enviado a $username!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Reportar a $username';
  }

  @override
  String get teamReportDialogContent =>
      '¿Estás seguro de que quieres reportar a este usuario por contenido inapropiado (ej. nombre de usuario o foto de perfil)?\n\nEsto enviará un aviso a nuestro equipo de moderación para su revisión.';

  @override
  String get teamReportDialogButton => 'Reportar';

  @override
  String teamReportSnackbar(String username) {
    return 'Enviando reporte para $username...';
  }

  @override
  String get teamReportSuccess =>
      'Reporte enviado. Nuestro equipo lo revisará pronto.';

  @override
  String teamReportError(String error) {
    return 'Fallo al enviar reporte: $error';
  }

  @override
  String get teamShareTitle => 'Comparte tu Invitación';

  @override
  String get teamShareSubtitle => '¿Cómo te gustaría compartir tu invitación?';

  @override
  String get teamShareImageButton => 'Compartir como Tarjeta de Imagen';

  @override
  String get teamShareTextButton => 'Compartir como Texto';

  @override
  String get teamShareImageGenerating =>
      'Generando tu tarjeta de invitación...';

  @override
  String teamShareImageError(String error) {
    return 'Error al compartir tarjeta: $error. Compartiendo como texto en su lugar.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Estoy construyendo el futuro de las redes digitales con ON Network. ¡Te quiero en mi equipo! 🔥\n\nAquí está tu regalo de bienvenida por unirte:\n✅ 1 ON Coin GRATIS al instante\n✅ 24 Horas de Boost de Velocidad 2X\n\nUsa mi código de invitación para empezar: $code\n\nÚnete ahora y reclama tu lugar:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return '¡Únete a mi equipo en ON Network! Usa mi código: $code\n\nÚnete ahora:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username te invita a unirte';
  }

  @override
  String get inviteCardTitle => '¡TU VIAJE EMPIEZA AQUÍ!';

  @override
  String get inviteCardUseCode => 'USA MI CÓDIGO DE INVITACIÓN';

  @override
  String get inviteCardGiftTitle =>
      'ÚNETE AHORA Y OBTÉN TU REGALO DE BIENVENIDA:';

  @override
  String get inviteCardGift1 => '1 ON Coin GRATIS al instante';

  @override
  String get inviteCardGift2 => '24 Horas de Boost de Velocidad 2X';

  @override
  String get inviteCardButton => '¡TOCA PARA UNIRTE Y RECLAMAR TU ON!';

  @override
  String get marketplaceTitle => 'Mercado: Próximamente';

  @override
  String get marketplaceDescription =>
      'Estamos construyendo un mercado descentralizado donde podrás comprar y vender bienes y servicios usando tus ON coins ganados.\n\n¡Sigue minando y construye tu saldo!';

  @override
  String get marketplaceCommunity => 'ÚNETE A LA COMUNIDAD';

  @override
  String get marketplaceTooltipTelegram => 'Únete a nuestro Telegram';

  @override
  String get marketplaceTooltipTwitter => 'Síguenos en X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Síguenos en Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Míranos en TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Visita nuestra Web';

  @override
  String get profileScreenTitle => 'Perfil';

  @override
  String get profileUsername => 'Nombre de usuario';

  @override
  String get profileErrorUsernameLength =>
      'El nombre de usuario debe tener al menos 4 caracteres';

  @override
  String get profileErrorUsernameTaken =>
      'Este nombre de usuario ya está en uso. Por favor, intenta con otro.';

  @override
  String get profileUsernameUpdated => '¡Nombre de usuario actualizado!';

  @override
  String get profileImageUploadFailed => 'Falló la subida de imagen.';

  @override
  String get profileImageUploadSuccess => '¡Foto de perfil actualizada!';

  @override
  String profileErrorImageSave(String error) {
    return 'Error al guardar URL de imagen: $error';
  }

  @override
  String get profileSectionCommunity => 'Comunidad';

  @override
  String profileInviteCode(String code) {
    return 'Tu Código de Invitación: $code';
  }

  @override
  String get profileShare => 'Toca para compartir';

  @override
  String get profileCopyCode => 'Copiar Código';

  @override
  String get profileCopyCodeSubtitle =>
      'Copia tu código de invitación al portapapeles';

  @override
  String get profileCopyCodeSuccess =>
      '¡Código de invitación copiado al portapapeles!';

  @override
  String get profileTelegram => 'Únete a nuestro Telegram';

  @override
  String get profileTelegramSubtitle =>
      'Recibe noticias y chatea con la comunidad';

  @override
  String get profileTwitter => 'Síguenos en X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Mantente al día con los anuncios';

  @override
  String get profileInstagram => 'Síguenos en Instagram';

  @override
  String get profileInstagramSubtitle => 'Mira nuestro viaje';

  @override
  String get profileTikTok => 'Míranos en TikTok';

  @override
  String get profileTikTokSubtitle => 'Últimas actualizaciones y clips';

  @override
  String get profileWebsite => 'Visita nuestra Web';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Ajustes y Seguridad';

  @override
  String get profileNotifSettings => 'Ajustes de Notificación';

  @override
  String get profileNotifSettingsSubtitle =>
      'Gestiona las notificaciones de tu app';

  @override
  String get profileChangePassword => 'Cambiar Contraseña';

  @override
  String get profileChangePasswordSubtitle =>
      'Enviar correo de restablecimiento de contraseña';

  @override
  String get profileChangePasswordSuccess =>
      '¡Correo de restablecimiento enviado! Revisa tu bandeja de entrada.';

  @override
  String get profileSectionAbout => 'Acerca de';

  @override
  String get profileProjectInfo => 'Info del Proyecto y Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Conoce nuestra visión y hoja de ruta';

  @override
  String get profileTerms => 'Términos de Servicio';

  @override
  String get profileTermsSubtitle => 'Lee nuestros términos y condiciones';

  @override
  String get profilePrivacy => 'Política de Privacidad';

  @override
  String get profilePrivacySubtitle => 'Cómo manejamos tus datos';

  @override
  String get profileSectionDanger => 'Zona de Peligro';

  @override
  String get profileDeleteAccount => 'Eliminar Cuenta';

  @override
  String get profileDeleteAccountSubtitle =>
      'Elimina permanentemente tu cuenta y todos tus datos';

  @override
  String get profileDeleteAccountDialogTitle => '¿Estás absolutamente seguro?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Esta acción es irreversible.\n\nTodos tus datos, incluyendo tu saldo de ON coin y conexiones de equipo, serán eliminados permanentemente. Esto no se puede deshacer.';

  @override
  String get profileDeleteAccountDialogButton => 'Eliminar Mi Cuenta';

  @override
  String get profileDeleteAccountSuccess => 'Cuenta eliminada permanentemente.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Error al eliminar cuenta: $error';
  }

  @override
  String get profileSignOut => 'Cerrar Sesión';

  @override
  String profileSignOutError(String error) {
    return 'Error al cerrar sesión: $error';
  }

  @override
  String get settingsTitle => 'Ajustes de Notificación';

  @override
  String get settingsMiningTitle => 'Recordatorios de Sesión de Minería';

  @override
  String get settingsMiningSubtitle =>
      'Recibe una notificación cuando tu sesión de 24 horas termine.';

  @override
  String get settingsTeamTitle => 'Recordatorios de Equipo';

  @override
  String get settingsTeamSubtitle =>
      'Permite que los miembros de tu equipo te \"pingueen\" para empezar a minar.';

  @override
  String get settingsAdBoostTitle => 'Recordatorios de Boost de Anuncios';

  @override
  String get settingsAdBoostSubtitle =>
      'Recibe una notificación cuando tu Boost de Anuncio 1.5X expire.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Error al actualizar ajustes: $error';
  }

  @override
  String get projectInfoTitle => 'Nuestra Visión';

  @override
  String get projectInfoSection1Title => '¿Qué es ON Network?';

  @override
  String get projectInfoSection1Content =>
      'ON Network es un ecosistema digital descentralizado diseñado para el futuro. Al tocar el botón cada 24 horas, estás validando tu presencia como un Pionero humano y contribuyendo a la seguridad y crecimiento de la red. A cambio, ganas ON, la moneda digital nativa de nuestra red.';

  @override
  String get projectInfoSection2Title => 'Utilidad de ON Coin';

  @override
  String get projectInfoSection2Content =>
      'Los ON Coins que estás ganando actualmente se distribuyen a Pioneros tempranos como tú. A medida que la red crezca, el propósito principal de ON será facilitar transacciones en el futuro Mercado y soportar funciones de la red. La tasa de ganancia disminuye a medida que la red crece, recompensando la participación temprana en la construcción de la comunidad.';

  @override
  String get projectInfoSection3Title => 'Nuestra Hoja de Ruta';

  @override
  String get projectInfoRoadmap1Title => 'Fase 1: Pioneros (Estás aquí)';

  @override
  String get projectInfoRoadmap1Content =>
      'Hacer crecer la red de 0 a 1 millón de Pioneros. Distribuir ON coin a través de la participación.';

  @override
  String get projectInfoRoadmap2Title => 'Fase 2: Mercado';

  @override
  String get projectInfoRoadmap2Content =>
      'Lanzar el Mercado ON donde los miembros pueden intercambiar bienes y servicios usando sus ON Coins ganados.';

  @override
  String get projectInfoRoadmap3Title => 'Fase 3: Mainnet e Intercambio';

  @override
  String get projectInfoRoadmap3Content =>
      'Transición a una blockchain completamente descentralizada (Mainnet) y habilitar la funcionalidad de ON en las principales plataformas de criptomonedas (sujeto a cumplimiento).';

  @override
  String get settingsLangTitle => 'Idioma';

  @override
  String get settingsLangSubtitle => 'Cambiar el idioma de la aplicación';

  @override
  String get marketplaceTooltipEmail => 'Contactar a Soporte';

  @override
  String get profileEmail => 'Contactar a Soporte';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Síguenos en Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Suscríbete a nuestro YouTube';

  @override
  String get profileFacebook => 'Síguenos en Facebook';

  @override
  String get profileFacebookSubtitle =>
      'Mira nuestras actualizaciones y comunidad';

  @override
  String get profileYoutube => 'Suscríbete a nuestro YouTube';

  @override
  String get profileYoutubeSubtitle =>
      'Mira actualizaciones de proyectos y tutoriales';
}
