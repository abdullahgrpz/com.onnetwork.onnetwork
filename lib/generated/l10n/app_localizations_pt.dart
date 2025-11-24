// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get helloWorld => 'Olá, Mundo!';

  @override
  String get updateRequiredTitle => 'Atualização Necessária';

  @override
  String get updateRequiredMessage =>
      'Uma versão nova e melhorada da ON Network está disponível. Você deve atualizar o aplicativo para continuar ganhando.';

  @override
  String get updateNowButton => 'Atualizar Agora';

  @override
  String get navHome => 'Início';

  @override
  String get navTeam => 'Equipe';

  @override
  String get navMarketplace => 'Mercado';

  @override
  String get navProfile => 'Perfil';

  @override
  String get authWelcomeBack => 'Bem-vindo de volta!';

  @override
  String get authCreateAccount => 'Crie Sua Conta';

  @override
  String get authEmail => 'E-mail';

  @override
  String get authErrorEmailEmpty => 'Por favor, insira um e-mail';

  @override
  String get authErrorEmailInvalid =>
      'Por favor, insira um endereço de e-mail válido';

  @override
  String get authPassword => 'Senha';

  @override
  String get authErrorPasswordEmpty => 'Por favor, insira sua senha';

  @override
  String get authErrorPasswordLength =>
      'A senha deve ter pelo menos 6 caracteres';

  @override
  String get authConfirmPassword => 'Confirmar Senha';

  @override
  String get authErrorConfirmPasswordEmpty => 'Por favor, confirme sua senha';

  @override
  String get authErrorPasswordsNoMatch => 'As senhas não coincidem';

  @override
  String get authUsername => 'Nome de usuário';

  @override
  String get authUsernameHint => 'Deve ter pelo menos 3 caracteres';

  @override
  String get authErrorUsernameLength =>
      'O nome de usuário deve ter pelo menos 3 caracteres.';

  @override
  String get authInviteCode => 'Código de Convite (Opcional)';

  @override
  String get authInviteCodeHint => 'ex: A41DB9X1';

  @override
  String get authAgeConfirmation =>
      'Eu tenho 18 anos ou mais e sou legalmente elegível para usar este serviço.';

  @override
  String get authTermsConfirmationPrefix => 'Eu li e concordo com os ';

  @override
  String get authTermsOfService => 'Termos de Serviço';

  @override
  String get authTermsConfirmationMid => ' e a ';

  @override
  String get authPrivacyPolicy => 'Política de Privacidade';

  @override
  String get authTermsConfirmationSuffix => '.';

  @override
  String get authErrorAge =>
      'Você deve ter 18 anos ou mais para usar a ON Network.';

  @override
  String get authErrorTerms =>
      'Você deve concordar com os Termos de Serviço e a Política de Privacidade.';

  @override
  String get authLogin => 'Entrar';

  @override
  String get authRegister => 'Registrar';

  @override
  String get authSignInWithGoogle => 'Entrar com Google';

  @override
  String get authSignUpWithGoogle => 'Registrar com Google';

  @override
  String get authSwitchToRegister => 'Não tem uma conta? Registre-se';

  @override
  String get authSwitchToLogin => 'Já tem uma conta? Entre';

  @override
  String get authForgotPassword => 'Esqueceu a senha?';

  @override
  String get authResetPassword => 'Redefinir Senha';

  @override
  String get authEnterEmailHint => 'Digite seu e-mail';

  @override
  String get authCancel => 'Cancelar';

  @override
  String get authSendResetLink => 'Enviar Link de Redefinição';

  @override
  String get authResetLinkSent =>
      'Link de redefinição de senha enviado para seu e-mail.';

  @override
  String get onboardingWelcomeTitle => 'Bem-vindo à ON Network';

  @override
  String get onboardingWelcomeDesc =>
      'Você agora é um Pioneiro em um novo ecossistema digital. Sua jornada começa hoje.';

  @override
  String get onboardingMineTitle => 'Toque para Minerar';

  @override
  String get onboardingMineDesc =>
      'Toque no botão de energia a cada 24 horas para provar que você é humano e ganhar suas ON coins.';

  @override
  String get onboardingTeamTitle => 'Construa sua Equipe';

  @override
  String get onboardingTeamDesc =>
      'Convide seus amigos para se juntarem à sua equipe. Quanto mais membros ativos você tiver, mais rápido você ganha.';

  @override
  String get onboardingStart => 'Vamos Começar!';

  @override
  String get onboardingNext => 'Próximo';

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
    return 'Erro ao carregar dados. Por favor, verifique sua conexão e tente novamente.\nDetalhes: $error';
  }

  @override
  String get homeStatsBaseRate => 'Taxa Base';

  @override
  String get homeStatsBaseRateSubtitle => 'Sua velocidade base atual';

  @override
  String get homeStatsBaseRateInfoTitle => 'Taxa Base';

  @override
  String get homeStatsBaseRateInfo =>
      'Esta é a sua velocidade de ganho base atual. Ela diminui globalmente para todos os usuários à medida que a rede cresce, de acordo com o cronograma de halving.';

  @override
  String get homeStatsEffectiveRate => 'Taxa Efetiva';

  @override
  String get homeStatsEffectiveRateBoost2x => ' (BOOST 2X!)';

  @override
  String get homeStatsEffectiveRateBoost1_5x => ' (BOOST 1.5X!)';

  @override
  String homeStatsEffectiveRateSubtitle(String bonus, String percent) {
    return '+$bonus da equipe ($percent%)';
  }

  @override
  String get homeStatsEffectiveRateInfoTitle => 'Taxa Efetiva';

  @override
  String get homeStatsEffectiveRateInfo =>
      'Sua velocidade de ganho total atual:\nTaxa Base + (Membros Ativos da Equipe * % do seu Nível de Bônus * Taxa Base)';

  @override
  String get homeStatsEffectiveRateInfoStarterBoost =>
      '\n\n🚀 Você está atualmente em um Boost de Início 2X!';

  @override
  String get homeStatsEffectiveRateInfoAdBoost =>
      '\n\n⏱️ Boost de Anúncio Ativo!';

  @override
  String get homeStatsGlobalMined => 'Minerado Global';

  @override
  String get homeStatsGlobalMinedInfoTitle => 'Minerado Global';

  @override
  String get homeStatsGlobalMinedInfo =>
      'A quantidade total de ON coins ganhas por todos os Pioneiros mundialmente em direção à meta inicial de 1 Bilhão de ON.';

  @override
  String get homeStatsNextHalving => 'Próximo Halving';

  @override
  String homeStatsNextHalvingCurrent(String count) {
    return 'Atual: $count';
  }

  @override
  String get homeStatsNextHalvingInfoTitle => 'Halving da Taxa de Ganho';

  @override
  String get homeStatsNextHalvingInfo =>
      'A taxa de ganho base diminui globalmente à medida que mais Pioneiros se juntam. Sua taxa base pessoal é atualizada de acordo.\n\n**Fase 1: Pioneiros (0 - 100k)**\n• 0 - 10k:    1.00 ON/hr\n• 10k - 20k:  0.95 ON/hr\n• 20k - 30k:  0.90 ON/hr\n• 30k - 40k:  0.85 ON/hr\n• 50k - 60k:  0.80 ON/hr\n• 60k - 70k:  0.75 ON/hr\n• 70k - 80k:  0.70 ON/hr\n• 80k - 90k:  0.65 ON/hr\n• 90k - 100k: 0.60 ON/hr\n• 90k - 100k: 0.55 ON/hr\n\n**Fase 2: Embaixadores (100k - 1M)**\n• 100k - 200k: 0.45 ON/hr\n• 200k - 300k: 0.40 ON/hr\n• 300k - 400k: 0.34 ON/hr\n• 400k - 500k: 0.28 ON/hr\n• 500k - 600k: 0.21 ON/hr\n• 600k - 700k: 0.15 ON/hr\n• 700k - 800k: 0.10 ON/hr\n• 800k - 900k: 0.06 ON/hr\n• 900k - 1M:   0.03 ON/hr\n\n**Fase 3: Guardiões (1M+)**\n• 1M - 2M: 0.01 ON/hr\n• 2M+ :    0.005 ON/hr (Taxa Legada Final)\n\nSua taxa efetiva aumenta com membros ativos da equipe com base no seu nível atual (Padrão 25%, Bronze 27%, Prata 30%, Ouro 35%) aplicado à SUA Taxa Base atual por membro ativo.';

  @override
  String get homeStatsMainnet => 'Mainnet';

  @override
  String get homeStatsMainnetInfoTitle => 'Contagem Regressiva Mainnet';

  @override
  String get homeStatsMainnetInfo =>
      'Esta é a data agendada para o lançamento da nossa Mainnet. Neste ponto, a distribuição (ganho) de ON coins irá parar e o Mercado ON estará totalmente operacional.';

  @override
  String homeMiningStatus(String rate, String boost, String count) {
    return 'Ganhando a $rate ON/hr$boost com $count membro(s) ativo(s)';
  }

  @override
  String get homeMiningStatusClaim =>
      'Toque no botão para reivindicar os ganhos da última sessão e começar uma nova!';

  @override
  String get homeMiningStatusStart => 'Toque no botão para começar a ganhar!';

  @override
  String get homeMiningButtonActive => 'ATIVO';

  @override
  String get homeMiningStarterBoost => 'Boost de Início Ativo! (Velocidade 2X)';

  @override
  String homeMiningAdBoost(String duration) {
    return 'Boost de Anúncio ativo por: $duration';
  }

  @override
  String homeMiningAdButton(String count) {
    return 'Ver Anúncio para Boost 1.5X ($count restantes)';
  }

  @override
  String get homeMiningAdLoading => 'Carregando Anúncio de Boost...';

  @override
  String get homeMiningAdLoadingShort => 'Carregando boost...';

  @override
  String get homeMiningAdLimit =>
      'Limite diário de boost de anúncios atingido.';

  @override
  String get homeActivateSnackbar => 'Ativando sessão de ganho...';

  @override
  String get homeActivatedSnackbar =>
      'Sessão de ganho ativada! Ganhos da última sessão adicionados.';

  @override
  String get homeDialogOK => 'OK';

  @override
  String get teamScreenTitle => 'Sua Equipe';

  @override
  String get teamRefreshTooltip => 'Atualizar Equipe';

  @override
  String get teamRefreshSnackbar => 'Atualizando dados da equipe...';

  @override
  String get teamErrorInviteCode =>
      'Não foi possível carregar o código de convite';

  @override
  String teamInviteCode(String code) {
    return 'Seu Código de Convite: $code';
  }

  @override
  String get teamErrorLoading =>
      'Não foi possível carregar os membros da equipe.\nPor favor, verifique sua conexão.';

  @override
  String teamYourContribution(String rate) {
    return 'Sua Contribuição: +$rate ON/hora';
  }

  @override
  String teamBonusTier(String tier, String percent) {
    return 'Seu Nível de Bônus: $tier ($percent%)';
  }

  @override
  String teamNextGoal(String goal) {
    return 'Próximo Objetivo: $goal';
  }

  @override
  String get teamNextGoalMax => 'Nível Máximo Atingido!';

  @override
  String teamNextGoalBronze(Object count) {
    return 'Mais $count membro(s) para Bronze (27%)';
  }

  @override
  String teamNextGoalSilver(Object count) {
    return 'Mais $count membro(s) para Prata (30%)';
  }

  @override
  String teamNextGoalGold(Object count) {
    return 'Mais $count membro(s) para Ouro (35%)';
  }

  @override
  String teamMemberCount(String total, String active) {
    return 'Membros Atuais: $total ($active ativos)';
  }

  @override
  String get teamInviteButton => 'Convidar Novos Membros';

  @override
  String get teamEmptyTitle => 'Sua equipe está vazia.';

  @override
  String get teamEmptyDescription =>
      'Convide amigos usando seu código para construir sua equipe e aumentar sua taxa de mineração!';

  @override
  String get teamMemberActive => 'Ativo Agora';

  @override
  String get teamMemberInactive => 'Inativo';

  @override
  String get teamMemberTapToRemind => 'Toque para Lembrar';

  @override
  String get teamMemberTooltipReport => 'Denunciar Usuário';

  @override
  String get teamMemberTooltipRemind => 'Lembrar Usuário';

  @override
  String teamRemindSnackbar(String username) {
    return 'Enviando lembrete para $username...';
  }

  @override
  String teamRemindError(String error) {
    return 'Falha ao enviar lembrete: $error';
  }

  @override
  String teamRemindSuccess(String username) {
    return 'Lembrete enviado para $username!';
  }

  @override
  String teamReportDialogTitle(String username) {
    return 'Denunciar $username';
  }

  @override
  String get teamReportDialogContent =>
      'Tem certeza de que deseja denunciar este usuário por conteúdo impróprio (ex: nome de usuário ou foto de perfil)?\n\nIsso enviará um aviso à nossa equipe de moderação para revisão.';

  @override
  String get teamReportDialogButton => 'Denunciar';

  @override
  String teamReportSnackbar(String username) {
    return 'Enviando denúncia para $username...';
  }

  @override
  String get teamReportSuccess =>
      'Denúncia enviada. Nossa equipe irá revisá-la em breve.';

  @override
  String teamReportError(String error) {
    return 'Falha ao enviar denúncia: $error';
  }

  @override
  String get teamShareTitle => 'Compartilhe seu Convite';

  @override
  String get teamShareSubtitle =>
      'Como você gostaria de compartilhar seu convite?';

  @override
  String get teamShareImageButton => 'Compartilhar como Cartão de Imagem';

  @override
  String get teamShareTextButton => 'Compartilhar como Texto';

  @override
  String get teamShareImageGenerating => 'Gerando seu cartão de convite...';

  @override
  String teamShareImageError(String error) {
    return 'Erro ao compartilhar cartão: $error. Compartilhando como texto.';
  }

  @override
  String teamShareTextMessage(String code) {
    return 'Estou construindo o futuro das redes digitais com a ON Network. Eu quero você na minha equipe! 🔥\n\nAqui está seu presente de boas-vindas por se juntar:\n✅ 1 ON Coin GRÁTIS instantaneamente\n✅ 24 Horas de Boost de Velocidade 2X\n\nUse meu código de convite para começar: $code\n\nJunte-se agora e garanta seu lugar:\nhttps://onnetworkapp.com';
  }

  @override
  String teamShareImageMessage(String code) {
    return 'Junte-se à minha equipe na ON Network! Use meu código: $code\n\nJunte-se agora:\nhttps://onnetworkapp.com';
  }

  @override
  String inviteCardInvitesYou(String username) {
    return '$username convida você para se juntar';
  }

  @override
  String get inviteCardTitle => 'SUA JORNADA COMEÇA AQUI!';

  @override
  String get inviteCardUseCode => 'USE MEU CÓDIGO DE CONVITE';

  @override
  String get inviteCardGiftTitle =>
      'ENTRE AGORA E GANHE SEU PRESENTE DE BOAS-VINDAS:';

  @override
  String get inviteCardGift1 => '1 ON Coin GRÁTIS instantaneamente';

  @override
  String get inviteCardGift2 => '24 Horas de Boost de Velocidade 2X';

  @override
  String get inviteCardButton => 'TOQUE PARA ENTRAR E REIVINDICAR SEU ON!';

  @override
  String get marketplaceTitle => 'Mercado: Em Breve';

  @override
  String get marketplaceDescription =>
      'Estamos construindo um mercado descentralizado onde você poderá comprar e vender bens e serviços usando suas ON coins ganhas.\n\nMantenha a mineração e aumente seu saldo!';

  @override
  String get marketplaceCommunity => 'JUNTE-SE À COMUNIDADE';

  @override
  String get marketplaceTooltipTelegram => 'Junte-se ao nosso Telegram';

  @override
  String get marketplaceTooltipTwitter => 'Siga-nos no X (Twitter)';

  @override
  String get marketplaceTooltipInstagram => 'Siga-nos no Instagram';

  @override
  String get marketplaceTooltipTikTok => 'Assista-nos no TikTok';

  @override
  String get marketplaceTooltipWebsite => 'Visite nosso site';

  @override
  String get profileScreenTitle => 'Perfil';

  @override
  String get profileUsername => 'Nome de usuário';

  @override
  String get profileErrorUsernameLength =>
      'O nome de usuário deve ter pelo menos 4 caracteres';

  @override
  String get profileErrorUsernameTaken =>
      'Este nome de usuário já está em uso. Por favor, tente outro.';

  @override
  String get profileUsernameUpdated => 'Nome de usuário atualizado!';

  @override
  String get profileImageUploadFailed => 'Falha no upload da imagem.';

  @override
  String get profileImageUploadSuccess => 'Foto de perfil atualizada!';

  @override
  String profileErrorImageSave(String error) {
    return 'Falha ao salvar URL da imagem: $error';
  }

  @override
  String get profileSectionCommunity => 'Comunidade';

  @override
  String profileInviteCode(String code) {
    return 'Seu Código de Convite: $code';
  }

  @override
  String get profileShare => 'Toque para compartilhar';

  @override
  String get profileCopyCode => 'Copiar Código';

  @override
  String get profileCopyCodeSubtitle =>
      'Copie seu código de convite para a área de transferência';

  @override
  String get profileCopyCodeSuccess => 'Código de convite copiado!';

  @override
  String get profileTelegram => 'Junte-se ao nosso Telegram';

  @override
  String get profileTelegramSubtitle =>
      'Receba notícias e converse com a comunidade';

  @override
  String get profileTwitter => 'Siga-nos no X (Twitter)';

  @override
  String get profileTwitterSubtitle => 'Fique por dentro dos anúncios';

  @override
  String get profileInstagram => 'Siga-nos no Instagram';

  @override
  String get profileInstagramSubtitle => 'Veja nossa jornada';

  @override
  String get profileTikTok => 'Assista-nos no TikTok';

  @override
  String get profileTikTokSubtitle => 'Últimas atualizações e clipes';

  @override
  String get profileWebsite => 'Visite nosso site';

  @override
  String get profileWebsiteSubtitle => 'onnetworkapp.com';

  @override
  String get profileSectionSettings => 'Configurações e Segurança';

  @override
  String get profileNotifSettings => 'Configurações de Notificação';

  @override
  String get profileNotifSettingsSubtitle =>
      'Gerencie as notificações do seu app';

  @override
  String get profileChangePassword => 'Mudar Senha';

  @override
  String get profileChangePasswordSubtitle =>
      'Enviar e-mail de redefinição de senha';

  @override
  String get profileChangePasswordSuccess =>
      'E-mail de redefinição enviado. Verifique sua caixa de entrada!';

  @override
  String get profileSectionAbout => 'Sobre';

  @override
  String get profileProjectInfo => 'Informações do Projeto e Whitepaper';

  @override
  String get profileProjectInfoSubtitle =>
      'Saiba mais sobre nossa visão e roteiro';

  @override
  String get profileTerms => 'Termos de Serviço';

  @override
  String get profileTermsSubtitle => 'Leia nossos termos e condições';

  @override
  String get profilePrivacy => 'Política de Privacidade';

  @override
  String get profilePrivacySubtitle => 'Como lidamos com seus dados';

  @override
  String get profileSectionDanger => 'Zona de Perigo';

  @override
  String get profileDeleteAccount => 'Deletar Conta';

  @override
  String get profileDeleteAccountSubtitle =>
      'Delete permanentemente sua conta e todos os dados';

  @override
  String get profileDeleteAccountDialogTitle => 'Você tem certeza absoluta?';

  @override
  String get profileDeleteAccountDialogContent =>
      'Esta ação é irreversível.\n\nTodos os seus dados, incluindo seu saldo de ON coin e conexões de equipe, serão excluídos permanentemente. Isso não pode ser desfeito.';

  @override
  String get profileDeleteAccountDialogButton => 'Deletar Minha Conta';

  @override
  String get profileDeleteAccountSuccess => 'Conta deletada permanentemente.';

  @override
  String profileDeleteAccountError(String error) {
    return 'Erro ao deletar conta: $error';
  }

  @override
  String get profileSignOut => 'Sair';

  @override
  String profileSignOutError(String error) {
    return 'Erro ao sair: $error';
  }

  @override
  String get settingsTitle => 'Configurações de Notificação';

  @override
  String get settingsMiningTitle => 'Lembretes da Sessão de Mineração';

  @override
  String get settingsMiningSubtitle =>
      'Seja notificado quando sua sessão de 24 horas terminar.';

  @override
  String get settingsTeamTitle => 'Lembretes da Equipe';

  @override
  String get settingsTeamSubtitle =>
      'Permita que membros da sua equipe enviem um \"ping\" para você começar a minerar.';

  @override
  String get settingsAdBoostTitle => 'Lembretes de Boost de Anúncio';

  @override
  String get settingsAdBoostSubtitle =>
      'Seja notificado quando seu Boost de Anúncio 1.5X expirar.';

  @override
  String settingsErrorUpdate(String error) {
    return 'Falha ao atualizar configurações: $error';
  }

  @override
  String get projectInfoTitle => 'Nossa Visão';

  @override
  String get projectInfoSection1Title => 'O que é a ON Network?';

  @override
  String get projectInfoSection1Content =>
      'A ON Network é um ecossistema digital descentralizado projetado para o futuro. Ao tocar no botão a cada 24 horas, você está validando sua presença como um Pioneiro humano e contribuindo para a segurança e crescimento da rede. Em troca, você ganha ON, a moeda digital nativa da nossa rede.';

  @override
  String get projectInfoSection2Title => 'Utilidade da ON Coin';

  @override
  String get projectInfoSection2Content =>
      'As ON Coins que você está ganhando estão sendo distribuídas para Pioneiros iniciais como você. À medida que a rede cresce, o propósito principal do ON será facilitar transações no futuro Mercado e apoiar funções da rede. A taxa de ganho diminui à medida que a rede cresce, recompensando a participação antecipada na construção da comunidade.';

  @override
  String get projectInfoSection3Title => 'Nosso Roteiro';

  @override
  String get projectInfoRoadmap1Title => 'Fase 1: Pioneiros (Você está aqui)';

  @override
  String get projectInfoRoadmap1Content =>
      'Crescer a rede de 0 para 1 milhão de Pioneiros. Distribuir ON coin através do engajamento.';

  @override
  String get projectInfoRoadmap2Title => 'Fase 2: Mercado';

  @override
  String get projectInfoRoadmap2Content =>
      'Lançar o Mercado ON onde os membros podem trocar bens e serviços usando suas ON Coins ganhas.';

  @override
  String get projectInfoRoadmap3Title => 'Fase 3: Mainnet e Exchange';

  @override
  String get projectInfoRoadmap3Content =>
      'Transição para uma blockchain totalmente descentralizada (Mainnet) e habilitar a funcionalidade ON nas principais plataformas de criptomoedas (sujeito à conformidade).';

  @override
  String get settingsLangTitle => 'Idioma';

  @override
  String get settingsLangSubtitle => 'Alterar o idioma do aplicativo';

  @override
  String get marketplaceTooltipEmail => 'Contatar Suporte';

  @override
  String get profileEmail => 'Contatar Suporte';

  @override
  String get profileEmailSubtitle => 'support@onnetworkapp.com';

  @override
  String get marketplaceTooltipFacebook => 'Siga-nos no Facebook';

  @override
  String get marketplaceTooltipYoutube => 'Inscreva-se no nosso YouTube';

  @override
  String get profileFacebook => 'Siga-nos no Facebook';

  @override
  String get profileFacebookSubtitle => 'Veja nossas atualizações e comunidade';

  @override
  String get profileYoutube => 'Inscreva-se no nosso YouTube';

  @override
  String get profileYoutubeSubtitle =>
      'Assista a atualizações e tutoriais do projeto';
}
