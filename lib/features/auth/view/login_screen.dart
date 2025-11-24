// lib/features/auth/view/login_screen.dart (DİL SEÇENEĞİ EKLENDİ)

import 'package:flutter/material.dart';
import 'package:on_network/features/auth/services/auth_service.dart';
import 'package:flutter/gestures.dart';
import 'package:on_network/features/profile/view/legal_webview_screen.dart';
import 'package:on_network/features/auth/view/auth_wrapper.dart';

// --- YENİ IMPORTLAR ---
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_network/core/providers/localization_provider.dart';
// --- BİTTİ ---

// Lokalizasyon importu
import 'package:on_network/generated/l10n/app_localizations.dart';

// --- DEĞİŞİKLİK 1: StatefulWidget -> ConsumerStatefulWidget ---
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});
  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

// --- DEĞİŞİKLİK 2: State -> ConsumerState ---
class _LoginScreenState extends ConsumerState<LoginScreen> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _usernameController = TextEditingController();
  final _inviteCodeController = TextEditingController();

  bool _isTermsAccepted = false;
  bool _isEighteen = false;
  bool _isLoading = false;
  bool _isLoginMode = true;

  bool get _isRegistrationReady => _isTermsAccepted && _isEighteen;

  void _showErrorSnackBar(String message, {bool isSuccess = false}) {
    if (mounted) {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
          backgroundColor: isSuccess ? Colors.green : Colors.red,
          duration: const Duration(seconds: 3),
        ),
      );
    }
  }

  void _openLegalDocument(String title, String url) {
    Navigator.of(context).push(
      MaterialPageRoute(
          builder: (context) => LegalWebViewScreen(title: title, url: url)),
    );
  }

  void _login() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });

    String? errorMessage = await _authService.signInWithEmailAndPassword(
      _emailController.text.trim(),
      _passwordController.text.trim(),
    );

    if (mounted) setState(() { _isLoading = false; });
    if (errorMessage == null && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthWrapper()),
      );
    } else if (mounted) {
      _showErrorSnackBar(errorMessage!);
    }
  }

  void _register(AppLocalizations l10n) async {
    if (_formKey.currentState!.validate()) {
      if (!_isEighteen) {
        _showErrorSnackBar(l10n.authErrorAge);
        return;
      }
      if (!_isTermsAccepted) {
        _showErrorSnackBar(l10n.authErrorTerms);
        return;
      }
      setState(() {
        _isLoading = true;
      });

      String? errorMessage = await _authService.registerWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
        username: _usernameController.text.trim(),
        referralCode: _inviteCodeController.text.trim(),
      );

      if (mounted) setState(() { _isLoading = false; });
      if (errorMessage == null && mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const AuthWrapper()),
        );
      } else if (mounted) {
        _showErrorSnackBar(errorMessage!);
      }
    }
  }

  void _googleSignIn() async {
    setState(() {
      _isLoading = true;
    });
    final inviteCode = _inviteCodeController.text.trim();
    String? errorMessage =
        await _authService.signInWithGoogle(referralCode: inviteCode);
    if (mounted) setState(() { _isLoading = false; });
    if (errorMessage == null && mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const AuthWrapper()),
      );
    } else if (mounted && errorMessage != 'Sign-in cancelled.') {
      _showErrorSnackBar(errorMessage!);
    }
  }

  void _toggleMode() {
    setState(() {
      _isLoginMode = !_isLoginMode;
      _formKey.currentState?.reset();
      _emailController.clear();
      _passwordController.clear();
      _confirmPasswordController.clear();
      _usernameController.clear();
      _isTermsAccepted = false;
      _isEighteen = false;
    });
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _usernameController.dispose();
    _inviteCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      // --- DEĞİŞİKLİK 3: body'yi Stack ile sarmala ---
      body: SafeArea(
        child: Stack(
          children: [
            // Orijinal içeriğin
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: AbsorbPointer(
                      absorbing: _isLoading,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const Icon(Icons.power_settings_new,
                              color: Color(0xFF00D1FF), size: 60),
                          const SizedBox(height: 16),
                          Text(
                              _isLoginMode
                                  ? l10n.authWelcomeBack
                                  : l10n.authCreateAccount,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          const SizedBox(height: 40),

                          // Email
                          TextFormField(
                            controller: _emailController,
                            decoration:
                            InputDecoration(labelText: l10n.authEmail),
                            keyboardType: TextInputType.emailAddress,
                            style: const TextStyle(color: Colors.white),
                            validator: (value) {
                              if (value == null || value.isEmpty)
                                return l10n.authErrorEmailEmpty;
                              final bool emailValid = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value);
                              if (!emailValid)
                                return l10n.authErrorEmailInvalid;
                              return null;
                            },
                          ),
                          const SizedBox(height: 16),

                          // Şifre
                          TextFormField(
                              controller: _passwordController,
                              decoration:
                              InputDecoration(labelText: l10n.authPassword),
                              obscureText: true,
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (_isLoginMode &&
                                    (value == null || value.isEmpty))
                                  return l10n.authErrorPasswordEmpty;
                                if (!_isLoginMode &&
                                    (value == null || value.length < 6))
                                  return l10n.authErrorPasswordLength;
                                return null;
                              }),
                          const SizedBox(height: 16),

                          // --- Sadece Kayıt Modunda Görünecek Alanlar ---
                          if (!_isLoginMode) ...[
                            TextFormField(
                                controller: _confirmPasswordController,
                                decoration: InputDecoration(
                                    labelText: l10n.authConfirmPassword),
                                obscureText: true,
                                style: const TextStyle(color: Colors.white),
                                validator: (value) {
                                  if (_isLoginMode) return null;
                                  if (value == null || value.isEmpty)
                                    return l10n.authErrorConfirmPasswordEmpty;
                                  if (value != _passwordController.text)
                                    return l10n.authErrorPasswordsNoMatch;
                                  return null;
                                }),
                            const SizedBox(height: 16),
                            TextFormField(
                              controller: _usernameController,
                              decoration: InputDecoration(
                                labelText: l10n.authUsername,
                                hintText: l10n.authUsernameHint,
                              ),
                              style: const TextStyle(color: Colors.white),
                              validator: (value) {
                                if (_isLoginMode) return null;
                                if (value == null || value.trim().length < 3)
                                  return l10n.authErrorUsernameLength;
                                return null;
                              },
                            ),
                            const SizedBox(height: 16),
                          ],

                          // Davet Kodu
                          TextFormField(
                            controller: _inviteCodeController,
                            decoration: InputDecoration(
                              labelText: l10n.authInviteCode,
                              hintText: l10n.authInviteCodeHint,
                              labelStyle: _isLoginMode
                                  ? const TextStyle(
                                  color: Colors.white70, fontSize: 14)
                                  : const TextStyle(color: Colors.white70),
                            ),
                            textCapitalization: TextCapitalization.characters,
                            style: const TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 20),

                          // --- Sadece Kayıt Modunda Görünecek Yasal Alanlar ---
                          if (!_isLoginMode) ...[
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _isEighteen,
                                    onChanged: (newValue) =>
                                        setState(() => _isEighteen = newValue!),
                                    activeColor: Colors.redAccent,
                                    side: BorderSide(
                                        color: Colors.white.withOpacity(0.7)),
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    l10n.authAgeConfirmation,
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8),
                                        fontSize: 12,
                                        height: 1.4,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: Checkbox(
                                    value: _isTermsAccepted,
                                    onChanged: (newValue) => setState(
                                            () => _isTermsAccepted = newValue!),
                                    activeColor: const Color(0xFF00D1FF),
                                    side: BorderSide(
                                        color: Colors.white.withOpacity(0.7)),
                                    materialTapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.white.withOpacity(0.7),
                                          fontSize: 12,
                                          height: 1.4),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: l10n
                                                .authTermsConfirmationPrefix),
                                        TextSpan(
                                          text: l10n.authTermsOfService,
                                          style: const TextStyle(
                                              color: Color(0xFF00D1FF),
                                              decoration:
                                              TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _openLegalDocument(
                                                  l10n.authTermsOfService,
                                                  'https://onnetworkapp.com/terms.html');
                                            },
                                        ),
                                        TextSpan(
                                            text: l10n.authTermsConfirmationMid),
                                        TextSpan(
                                          text: l10n.authPrivacyPolicy,
                                          style: const TextStyle(
                                              color: Color(0xFF00D1FF),
                                              decoration:
                                              TextDecoration.underline),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              _openLegalDocument(
                                                  l10n.authPrivacyPolicy,
                                                  'https://onnetworkapp.com/privacy.html');
                                            },
                                        ),
                                        TextSpan(
                                            text: l10n
                                                .authTermsConfirmationSuffix),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                          ], // Kayıt Modu Alanları Bitişi

                          // Ana Buton (Login veya Register)
                          if (_isLoading)
                            const Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 12.0),
                                  child: CircularProgressIndicator(),
                                ))
                          else ...[
                            ElevatedButton(
                              onPressed: _isLoginMode
                                  ? _login
                                  : (_isRegistrationReady
                                  ? () => _register(l10n)
                                  : null),
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                (_isLoginMode || _isRegistrationReady)
                                    ? const Color(0xFF00D1FF)
                                    : Colors.grey.withOpacity(0.5),
                                foregroundColor: Colors.white,
                                padding:
                                const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                _isLoginMode ? l10n.authLogin : l10n.authRegister,
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),
                            const SizedBox(height: 12),

                            // Google Butonu (Kaldırılmıştı)

                            OutlinedButton(
                              onPressed: _toggleMode,
                              style: OutlinedButton.styleFrom(
                                side:
                                const BorderSide(color: Color(0xFF00D1FF)),
                                padding:
                                const EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              child: Text(
                                _isLoginMode
                                    ? l10n.authSwitchToRegister
                                    : l10n.authSwitchToLogin,
                                style: const TextStyle(
                                    color: Color(0xFF00D1FF), fontSize: 16),
                              ),
                            ),
                          ],

                          // Şifremi Unuttum Butonu
                          if (_isLoginMode)
                            TextButton(
                              onPressed: _isLoading
                                  ? null
                                  : () => _showPasswordResetDialog(context, l10n),
                              child: Text(l10n.authForgotPassword,
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.7))),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // --- YENİ EKLENEN DİL SEÇİM BUTONU ---
            Positioned(
              top: 16.0,
              right: 16.0,
              child: _buildLanguageMenu(context, l10n),
            ),
            // --- BİTTİ ---
          ],
        ),
      ),
    );
  }

  void _showPasswordResetDialog(BuildContext context, AppLocalizations l10n) {
    final TextEditingController resetEmailController = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Theme.of(context).cardColor,
          title: Text(l10n.authResetPassword,
              style: const TextStyle(color: Colors.white)),
          content: TextField(
            controller: resetEmailController,
            keyboardType: TextInputType.emailAddress,
            style: const TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: l10n.authEnterEmailHint,
              hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
              filled: true,
              fillColor: Theme.of(context).inputDecorationTheme.fillColor,
              border: Theme.of(context).inputDecorationTheme.border,
              enabledBorder:
              Theme.of(context).inputDecorationTheme.enabledBorder,
              focusedBorder:
              Theme.of(context).inputDecorationTheme.focusedBorder,
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(l10n.authCancel,
                  style: TextStyle(color: Colors.white.withOpacity(0.7))),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text(l10n.authSendResetLink,
                  style: const TextStyle(color: Color(0xFF00D1FF))),
              onPressed: () async {
                final email = resetEmailController.text.trim();
                if (email.isEmpty || !email.contains('@')) {
                  print('Geçersiz e-posta girildi.');
                  return;
                }
                Navigator.of(context).pop();

                if (mounted) setState(() { _isLoading = true; });

                String? errorMessage =
                await _authService.sendPasswordResetEmail(email);

                if (mounted) setState(() { _isLoading = false; });

                if (mounted) {
                  if (errorMessage == null) {
                    _showErrorSnackBar(l10n.authResetLinkSent, isSuccess: true);
                  } else {
                    _showErrorSnackBar(errorMessage!);
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  // --- YENİ EKLENEN FONKSİYON (Settings Ekranından kopyalandı) ---
  Widget _buildLanguageMenu(BuildContext context, AppLocalizations l10n) {
    // 'ref' artık ConsumerState sayesinde 'this.ref' olarak erişilebilir
    final currentLocale = ref.watch(localeProvider);
    String currentLanguageName;

    if (currentLocale == null) {
      currentLanguageName =
      l10n.navHome == "Home" ? "System Default" : "Sistem Dili";
    } else if (currentLocale.languageCode == 'tr') {
      currentLanguageName = l10n.homeLangTurkish;
    } else if (currentLocale.languageCode == 'id') {
      currentLanguageName = l10n.homeLangIndonesian;
    } else if (currentLocale.languageCode == 'vi') {
      currentLanguageName = l10n.homeLangVietnamese;
    } else if (currentLocale.languageCode == 'es') {
      currentLanguageName = l10n.homeLangSpanish;
    } else if (currentLocale.languageCode == 'hi') {
      currentLanguageName = l10n.homeLangHindi;
    } else if (currentLocale.languageCode == 'pt') {
      currentLanguageName = l10n.homeLangPortuguese;
    } else if (currentLocale.languageCode == 'ar') {
      currentLanguageName = l10n.homeLangArabic;
    } else if (currentLocale.languageCode == 'ru') {
      currentLanguageName = l10n.homeLangRussian;
    } else if (currentLocale.languageCode == 'de') {
      currentLanguageName = l10n.homeLangGerman;
    } else if (currentLocale.languageCode == 'fr') {
      currentLanguageName = l10n.homeLangFrench;
    } else if (currentLocale.languageCode == 'ja') {
      currentLanguageName = l10n.homeLangJapanese;
    } else if (currentLocale.languageCode == 'ko') {
      currentLanguageName = l10n.homeLangKorean;
    } else {
      currentLanguageName = l10n.homeLangEnglish;
    }

    return PopupMenuButton<Locale?>(
      icon:
      const Icon(FontAwesomeIcons.globe, color: Colors.white, size: 22),
      onSelected: (Locale? locale) {
        ref.read(localeProvider.notifier).state = locale;
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<Locale?>>[
        CheckedPopupMenuItem<Locale?>(
          value: null,
          checked: currentLocale == null,
          child:
          Text(l10n.navHome == "Home" ? "System Default" : "Sistem Dili"),
        ),
        const PopupMenuDivider(),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('en'),
          checked: currentLocale?.languageCode == 'en',
          child: Text(l10n.homeLangEnglish),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('tr'),
          checked: currentLocale?.languageCode == 'tr',
          child: Text(l10n.homeLangTurkish),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('id'),
          checked: currentLocale?.languageCode == 'id',
          child: Text(l10n.homeLangIndonesian),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('vi'),
          checked: currentLocale?.languageCode == 'vi',
          child: Text(l10n.homeLangVietnamese),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('es'),
          checked: currentLocale?.languageCode == 'es',
          child: Text(l10n.homeLangSpanish),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('hi'),
          checked: currentLocale?.languageCode == 'hi',
          child: Text(l10n.homeLangHindi),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('pt'),
          checked: currentLocale?.languageCode == 'pt',
          child: Text(l10n.homeLangPortuguese),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('ar'),
          checked: currentLocale?.languageCode == 'ar',
          child: Text(l10n.homeLangArabic),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('ru'),
          checked: currentLocale?.languageCode == 'ru',
          child: Text(l10n.homeLangRussian),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('de'),
          checked: currentLocale?.languageCode == 'de',
          child: Text(l10n.homeLangGerman),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('fr'),
          checked: currentLocale?.languageCode == 'fr',
          child: Text(l10n.homeLangFrench),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('ja'),
          checked: currentLocale?.languageCode == 'ja',
          child: Text(l10n.homeLangJapanese),
        ),
        CheckedPopupMenuItem<Locale?>(
          value: const Locale('ko'),
          checked: currentLocale?.languageCode == 'ko',
          child: Text(l10n.homeLangKorean),
        ),
      ],
    );
  }
}