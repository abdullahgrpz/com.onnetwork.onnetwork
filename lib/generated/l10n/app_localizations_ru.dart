// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get helloWorld => 'Привет, мир!';

  @override
  String get updateRequiredTitle => 'Требуется обновление';

  @override
  String get updateRequiredMessage =>
      'Доступна новая, улучшенная версия ON Network. Вы должны обновить приложение, чтобы продолжать зарабатывать.';

  @override
  String get updateNowButton => 'Обновить сейчас';

  @override
  String get navHome => 'Главная';

  @override
  String get navTeam => 'Команда';

  @override
  String get navMarketplace => 'Маркет';

  @override
  String get navProfile => 'Профиль';

  @override
  String get authWelcomeBack => 'С возвращением!';

  @override
  String get authCreateAccount => 'Создайте свой аккаунт';

  @override
  String get authEmail => 'Эл. почта';

  @override
  String get authErrorEmailEmpty => 'Пожалуйста, введите эл. почту';

  @override
  String get authErrorEmailInvalid =>
      'Пожалуйста, введите действующий адрес эл. почты';

  @override
  String get authPassword => 'Пароль';

  @override
  String get authErrorPasswordEmpty => 'Пожалуйста, введите ваш пароль';

  @override
  String get authErrorPasswordLength =>
      'Пароль должен содержать не менее 6 символов';

  @override
  String get authConfirmPassword => 'Подтвердите пароль';

  @override
  String get authErrorConfirmPasswordEmpty =>
      'Пожалуйста, подтвердите ваш пароль';

  @override
  String get authErrorPasswordsNoMatch => 'Пароли не совпадают';

  @override
  String get authUsername => 'Имя пользователя';

  @override
  String get authUsernameHint => 'Должно быть не менее 3 символов';

  @override
  String get authErrorUsernameLength =>
      'Имя пользователя должно содержать не менее 3 символов.';

  @override
  String get authInviteCode => 'Код приглашения (необязательно)';

  @override
  String get authInviteCodeHint => 'например, A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'Мне 18 лет или больше, и я имею законное право пользоваться этой услугой.';

  @override
  String get authTermsConfirmationPrefix => 'Я прочитал и согласен с ';

  @override
  String get authTermsOfService => 'Условиями обслуживания';

  @override
  String get authTermsConfirmationMid => ' и ';

  @override
  String get authPrivacyPolicy => 'Политикой конфиденциальности';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'Вам должно быть 18 лет или больше, чтобы использовать ON Network.';

  @override
  String get authErrorTerms =>
      'Вы должны согласиться с Условиями обслуживания и Политикой конфиденциальности.';

  @override
  String get authLogin => 'Войти';

  @override
  String get authRegister => 'Регистрация';

  @override
  String get authSignInWithGoogle => 'Войти через Google';

  @override
  String get authSignUpWithGoogle => 'Зарегистрироваться через Google';

  @override
  String get authSwitchToRegister => 'Нет аккаунта? Зарегистрируйтесь';

  @override
  String get authSwitchToLogin => 'Уже есть аккаунт? Войдите';

  @override
  String get authForgotPassword => 'Забыли пароль?';

  @override
  String get authResetPassword => 'Сбросить пароль';

  @override
  String get authEnterEmailHint => 'Введите вашу эл. почту';

  @override
  String get authCancel => 'Отмена';

  @override
  String get authSendResetLink => 'Отправить ссылку для сброса';

  @override
  String get authResetLinkSent =>
      'Ссылка для сброса пароля отправлена на вашу эл. почту.';

  @override
  String get onboardingWelcomeTitle => 'Добро пожаловать в ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Теперь вы Пионер в новой цифровой экосистеме. Ваше путешествие начинается сегодня.';

  @override
  String get onboardingMineTitle => 'Нажмите для майнинга';

  @override
  String get onboardingMineDesc =>
      'Нажимайте кнопку питания каждые 24 часа, чтобы доказать, что вы человек, и зарабатывать свои ON-коины.';

  @override
  String get onboardingTeamTitle => 'Создайте свою команду';

  @override
  String get onboardingTeamDesc =>
      'Пригласите своих друзей присоединиться к вашей команде. Чем больше у вас активных участников, тем быстрее вы зарабатываете.';

  @override
  String get onboardingStart => 'Начнем!';

  @override
  String get onboardingNext => 'Далее';

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
    return 'Ошибка загрузки данных. Пожалуйста, проверьте ваше соединение и попробуйте снова.\nДетали: $error';
  }

  @override
  String get homeStatsBaseRate => 'Базовая ставка';

  @override
  String get homeStatsBaseRateSubtitle => 'Ваша текущая базовая скорость';

  @override
  String get homeStatsBaseRateInfoTitle => 'Базовая ставка';

  @override
  String get homeStatsBaseRateInfo =>
      'Это ваша текущая базовая скорость заработка. Она снижается глобально для всех пользователей по мере роста сети, согласно графику халвинга.';

  @override
  String get homeStatsEffectiveRate => 'Эффективная ставка';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (2X БУСТ!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (1.5X БУСТ!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus от команды ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Эффективная ставка';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Ваша текущая общая скорость заработка:\nБазовая ставка + (Активные участники команды * % вашего Бонусного уровня * Базовая ставка)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 У вас активен 2X Стартовый Буст!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost =>
      '\n\n⏱️ Рекламный Буст Активен!';

  @override
  String get homeStatsGlobalMined => 'Добыто в мире';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Добыто в мире';

  @override
  String get homeStatsGlobalMinedInfo =>
      'Общее количество ON-коинов, заработанных всеми Пионерами по всему миру на пути к начальной цели в 1 миллиард ON.';

  @override
  String get homeStatsNextHalving => 'Следующий халвинг';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Текущее: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Халвинг скорости заработка';

  @override
  String get homeStatsNextHalvingInfo =>
      'Базовая скорость заработка снижается глобально по мере присоединения новых Пионеров. Ваша личная базовая ставка обновляется соответственно.\n\n**Фаза 1: Пионеры (0 - 100k)**\n• 0 - 10k:    1.00 ON/час\n• 10k - 20k:  0.95 ON/час\n• 20k - 30k:  0.90 ON/час\n• 30k - 40k:  0.85 ON/час\n• 50k - 60k:  0.80 ON/час\n• 60k - 70k:  0.75 ON/час\n• 70k - 80k:  0.70 ON/час\n• 80k - 90k:  0.65 ON/час\n• 90k - 100k: 0.60 ON/час\n• 90k - 100k: 0.55 ON/час\n\n**Фаза 2: Амбассадоры (100k - 1M)**\n• 100k - 200k: 0.45 ON/час\n• 200k - 300k: 0.40 ON/час\n• 300k - 400k: 0.34 ON/час\n• 400k - 500k: 0.28 ON/час\n• 500k - 600k: 0.21 ON/час\n• 600k - 700k: 0.15 ON/час\n• 700k - 800k: 0.10 ON/час\n• 800k - 900k: 0.06 ON/час\n• 900k - 1M:   0.03 ON/час\n\n**Фаза 3: Хранители (1M+)**\n• 1M - 2M: 0.01 ON/час\n• 2M+ :    0.005 ON/час (Финальная ставка наследия)\n\nВаша эффективная ставка увеличивается с активными участниками команды в зависимости от вашего текущего уровня (Стандарт 25%, Бронза 27%, Серебро 30%, Золото 35%), применяемого к ВАШЕЙ текущей Базовой ставке за каждого активного участника.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Обратный отсчет до Mainnet';

  @override
  String get homeStatsMainnetInfo =>
      'Это запланированная дата запуска нашего Mainnet. В этот момент распределение (заработок) ON-коинов прекратится, и Маркетплейс ON будет полностью функционировать.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Заработок $rate ON/час$boost с $count активным(и) участником(ами)';
  }

  @override
  String get homeMiningStatusClaim =>
      'Нажмите кнопку, чтобы забрать заработок с прошлой сессии и начать новую!';

  @override
  String get homeMiningStatusStart =>
      'Нажмите кнопку, чтобы начать зарабатывать!';

  @override
  String get homeMiningButtonActive => 'АКТИВЕН';

  @override
  String get homeMiningStarterBoost => 'Стартовый Буст Активен! (2X Скорость)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Рекламный Буст активен: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Смотреть рекламу для 1.5X Буста (осталось $count)';
  }

  @override
  String get homeMiningAdLoading => 'Загрузка Буст-Рекламы...';

  @override
  String get homeMiningAdLoadingShort => 'Загрузка рекламного буста...';

  @override
  String get homeMiningAdLimit => 'Достигнут дневной лимит рекламных бустов.';

  @override
  String get homeActivateSnackbar => 'Активация сессии заработка...';

  @override
  String get homeActivatedSnackbar =>
      'Сессия заработка активирована! Заработок с прошлой сессии добавлен.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Ваша Команда';

  @override
  String get teamRefreshTooltip => 'Обновить команду';

  @override
  String get teamRefreshSnackbar => 'Обновление данных команды...';

  @override
  String get teamErrorInviteCode => 'Не удалось загрузить код приглашения';

  @override
  String teamInviteCode(String code) {
    return 'Ваш код приглашения: $code';
  }

  @override
  String get teamErrorLoading =>
      'Не удалось загрузить участников команды.\nПожалуйста, проверьте ваше соединение.';

  @override
  String teamYourContribution(String rate) {
    return 'Ваш вклад: +$rate ON/час';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Ваш Бонусный Уровень: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Следующая цель: $goal';
  }

  @override
  String get teamNextGoalMax => 'Достигнут максимальный уровень!';

  @override
  String teamNextGoalBronze(Object count) {
    return 'Еще $count участник(ов) для Бронзы (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return 'Еще $count участник(ов) для Серебра (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return 'Еще $count участник(ов) для Золота (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Текущие участники команды: $total ($active активных)';
  }

  @override
  String get teamInviteButton => 'Пригласить новых участников';

  @override
  String get teamEmptyTitle => 'Ваша команда пуста.';

  @override
  String get teamEmptyDescription =>
      'Пригласите друзей, используя свой код, чтобы создать команду и увеличить скорость майнинга!';

  @override
  String get teamMemberActive => 'Активен';

  @override
  String get teamMemberInactive => 'Неактивен';

  @override
  String get teamMemberTapToRemind => 'Нажмите, чтобы напомнить';

  @override
  String get teamMemberTooltipReport => 'Пожаловаться на пользователя';

  @override
  String get teamMemberTooltipRemind => 'Напомнить пользователю';

  @override
  String teamRemindSnackbar(String username) {
    return 'Отправка напоминания $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Не удалось отправить напоминание: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Напоминание отправлено $username!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Пожаловаться на $username';
  }

  @override
  String get teamReportDialogContent =>
      'Вы уверены, что хотите пожаловаться на этого пользователя за неподобающий контент (например, имя пользователя или изображение профиля)?\n\nЭто отправит уведомление нашей команде модерации для рассмотрения.';

  @override
  String get teamReportDialogButton => 'Пожаловаться';

  @override
  String teamReportSnackbar(String username) {
    return 'Отправка жалобы на $username...';
  }

  @override
  String get teamReportSuccess =>
      'Жалоба отправлена. Наша команда рассмотрит ее в ближайшее время.';

  @override
  String teamReportError(String error) {
    return 'Не удалось отправить жалобу: $error';
  }

  @override
  String get teamShareTitle => 'Поделиться приглашением';

  @override
  String get teamShareSubtitle =>
      'Как бы вы хотели поделиться своим приглашением?';

  @override
  String get teamShareImageButton => 'Поделиться как изображение';

  @override
  String get teamShareTextButton => 'Поделиться как текст';

  @override
  String get teamShareImageGenerating =>
      'Создание вашей пригласительной карточки...';

  @override
  String teamShareImageError(String error) {
    return 'Ошибка при отправке карточки: $error. Отправка в виде текста.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Я строю будущее цифровых сетей с ON Network. Я хочу видеть тебя в своей команде! 🔥\n\nВот твой приветственный подарок за присоединение:\n✅ 1 БЕСПЛАТНЫЙ ON-коин мгновенно\n✅ 24-часовой 2X Буст Скорости\n\nИспользуй мой код приглашения, чтобы начать: $code\n\nПрисоединяйся сейчас и займи свое место:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Присоединяйся к моей команде в ON Network! Используй мой код: $code\n\nПрисоединяйся сейчас:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username приглашает вас присоединиться';
  }

  @override
  String get inviteCardTitle => 'ВАШЕ ПУТЕШЕСТВИЕ НАЧИНАЕТСЯ ЗДЕСЬ!';

  @override
  String get inviteCardUseCode => 'ИСПОЛЬЗУЙТЕ МОЙ КОД ПРИГЛАШЕНИЯ';

  @override
  String get inviteCardGiftTitle =>
      'ПРИСОЕДИНЯЙТЕСЬ СЕЙЧАС И ПОЛУЧИТЕ ПРИВЕТСТВЕННЫЙ ПОДАРОК:';

  @override
  String get inviteCardGift1 => '1 БЕСПЛАТНЫЙ ON-коин мгновенно';

  @override
  String get inviteCardGift2 => '24-часовой 2X Буст Скорости';

  @override
  String get inviteCardButton =>
      'НАЖМИТЕ, ЧТОБЫ ПРИСОЕДИНИТЬСЯ И ПОЛУЧИТЬ СВОЙ ON!';

  @override
  String get marketplaceTitle => 'Маркетплейс: Скоро';

  @override
  String get marketplaceDescription =>
      'Мы создаем децентрализованный маркетплейс, где вы сможете покупать и продавать товары и услуги, используя заработанные ON-коины.\n\nПродолжайте майнить и наращивать свой баланс!';

  @override
  String get marketplaceCommunity => 'ПРИСОЕДИНЯЙТЕСЬ К СООБЩЕСТВУ';

  @override
  String get marketplaceTooltipTelegram => 'Присоединяйтесь к нашему Telegram';

  @override
  String get marketplaceTooltipTwitter => 'Следуйте за нами в X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Следуйте за нами в Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Смотрите нас в TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Посетите наш сайт';

  @override
  String get profileScreenTitle => 'Профиль';

  @override
  String get profileUsername => 'Имя пользователя';

  @override
  String get profileErrorUsernameLength =>
      'Имя пользователя должно содержать не менее 4 символов';

  @override
  String get profileErrorUsernameTaken =>
      'Это имя пользователя уже занято. Пожалуйста, попробуйте другое.';

  @override
  String get profileUsernameUpdated => 'Имя пользователя обновлено!';

  @override
  String get profileImageUploadFailed => 'Не удалось загрузить изображение.';

  @override
  String get profileImageUploadSuccess => 'Изображение профиля обновлено!';

  @override
  String profileErrorImageSave(String error) {
    return 'Не удалось сохранить URL изображения: $error';
  }

  @override
  String get profileSectionCommunity => 'Сообщество';

  @override
  String profileInviteCode(String code) {
    return 'Ваш код приглашения: $code';
  }

  @override
  String get profileShare => 'Нажмите, чтобы поделиться';

  @override
  String get profileCopyCode => 'Копировать код';

  @override
  String get profileCopyCodeSubtitle =>
      'Скопировать ваш код приглашения в буфер обмена';

  @override
  String get profileCopyCodeSuccess =>
      'Код приглашения скопирован в буфер обмена!';

  @override
  String get profileTelegram => 'Присоединяйтесь к Telegram';

  @override
  String get profileTelegramSubtitle =>
      'Получайте новости и общайтесь с сообществом';

  @override
  String get profileTwitter => 'Следуйте за нами в X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Будьте в курсе объявлений';

  @override
  String get profileInstagram => 'Следуйте за нами в Instagram';

  @override
  String get profileInstagramSubtitle => 'Смотрите наш путь';

  @override
  String get profileTikTok => 'Смотрите нас в TikTok';

  @override
  String get profileTikTokSubtitle => 'Последние обновления и клипы';

  @override
  String get profileWebsite => 'Посетите наш сайт';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Настройки и безопасность';

  @override
  String get profileNotifSettings => 'Настройки уведомлений';

  @override
  String get profileNotifSettingsSubtitle =>
      'Управляйте уведомлениями приложения';

  @override
  String get profileChangePassword => 'Изменить пароль';

  @override
  String get profileChangePasswordSubtitle =>
      'Отправить письмо для сброса пароля';

  @override
  String get profileChangePasswordSuccess =>
      'Письмо для сброса пароля отправлено. Проверьте свой почтовый ящик!';

  @override
  String get profileSectionAbout => 'О приложении';

  @override
  String get profileProjectInfo => 'Информация о проекте и Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Узнайте о нашем видении и дорожной карте';

  @override
  String get profileTerms => 'Условия обслуживания';

  @override
  String get profileTermsSubtitle => 'Прочтите наши положения и условия';

  @override
  String get profilePrivacy => 'Политика конфиденциальности';

  @override
  String get profilePrivacySubtitle => 'Как мы обрабатываем ваши данные';

  @override
  String get profileSectionDanger => 'Опасная зона';

  @override
  String get profileDeleteAccount => 'Удалить аккаунт';

  @override
  String get profileDeleteAccountSubtitle =>
      'Безвозвратно удалить свой аккаунт и все данные';

  @override
  String get profileDeleteAccountDialogTitle => 'Вы абсолютно уверены?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Это действие необратимо.\n\nВсе ваши данные, включая ваш баланс ON-коинов и связи в команде, будут безвозвратно удалены. Это нельзя будет отменить.';

  @override
  String get profileDeleteAccountDialogButton => 'Удалить мой аккаунт';

  @override
  String get profileDeleteAccountSuccess => 'Аккаунт безвозвратно удален.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Ошибка при удалении аккаунта: $error';
  }

  @override
  String get profileSignOut => 'Выйти';

  @override
  String profileSignOutError(String error) {
    return 'Ошибка при выходе: $error';
  }

  @override
  String get settingsTitle => 'Настройки уведомлений';

  @override
  String get settingsMiningTitle => 'Напоминания о сессии майнинга';

  @override
  String get settingsMiningSubtitle =>
      'Получать уведомление, когда ваша 24-часовая сессия закончится.';

  @override
  String get settingsTeamTitle => 'Напоминания от команды';

  @override
  String get settingsTeamSubtitle =>
      'Разрешить участникам вашей команды \"пинговать\" вас, чтобы начать майнинг.';

  @override
  String get settingsAdBoostTitle => 'Напоминания о рекламном бусте';

  @override
  String get settingsAdBoostSubtitle =>
      'Получать уведомление, когда ваш 1.5X Рекламный Буст истечет.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Не удалось обновить настройки: $error';
  }

  @override
  String get projectInfoTitle => 'Наше видение';

  @override
  String get projectInfoSection1Title => 'Что такое ON Network?';

  @override
  String get projectInfoSection1Content =>
      'ON Network - это децентрализованная цифровая экосистема, разработанная для будущего. Нажимая кнопку каждые 24 часа, вы подтверждаете свое присутствие как человек-Пионер и вносите вклад в безопасность и рост сети. Взамен вы зарабатываете ON, нативную цифровую валюту нашей сети.';

  @override
  String get projectInfoSection2Title => 'Польза ON-коина';

  @override
  String get projectInfoSection2Content =>
      'ON-коины, которые вы зарабатываете, в настоящее время распределяются среди ранних Пионеров, таких как вы. По мере роста сети, основной целью ON будет облегчение транзакций на будущем Маркетплейсе и поддержка функций сети. Скорость заработка снижается по мере роста сети, вознаграждая за раннее участие в построении сообщества.';

  @override
  String get projectInfoSection3Title => 'Наша дорожная карта';

  @override
  String get projectInfoRoadmap1Title => 'Фаза 1: Пионеры (Вы здесь)';

  @override
  String get projectInfoRoadmap1Content =>
      'Расширение сети от 0 до 1 миллиона Пионеров. Распределение ON-коинов через вовлечение.';

  @override
  String get projectInfoRoadmap2Title => 'Фаза 2: Маркетплейс';

  @override
  String get projectInfoRoadmap2Content =>
      'Запуск Маркетплейса ON, где участники смогут обмениваться товарами и услугами, используя заработанные ON-коины.';

  @override
  String get projectInfoRoadmap3Title => 'Фаза 3: Mainnet и Биржи';

  @override
  String get projectInfoRoadmap3Content =>
      'Переход на полностью децентрализованный блокчейн (Mainnet) и включение функциональности ON на крупных криптовалютных платформах (при условии соблюдения требований).';

  @override
  String get settingsLangTitle => 'Язык';

  @override
  String get settingsLangSubtitle => 'Изменить язык приложения';

  @override
  String get marketplaceTooltipEmail => 'Связаться с поддержкой';

  @override
  String get profileEmail => 'Связаться с поддержкой';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Следите за нами в Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Подпишитесь на наш YouTube';

  @override
  String get profileFacebook => 'Следите за нами в Facebook';

  @override
  String get profileFacebookSubtitle => 'Смотрите наши обновления и сообщество';

  @override
  String get profileYoutube => 'Подпишитесь на наш YouTube';

  @override
  String get profileYoutubeSubtitle => 'Смотрите обновления проекта и уроки';
}
