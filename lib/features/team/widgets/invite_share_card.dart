import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:on_network/features/home/providers/home_providers.dart';
import 'package:on_network/generated/l10n/app_localizations.dart';

class InviteShareCard extends ConsumerWidget {
  final String? inviteCode;
  final String? buttonText;
  final String? titleText;
  final String? inviteCodeLabel;
  final String? username; // <--- YENİ EKLENDİ: Kullanıcı Adı

  const InviteShareCard({
    super.key,
    this.inviteCode,
    this.buttonText,
    this.titleText,
    this.inviteCodeLabel,
    this.username, // <--- YENİ EKLENDİ
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    
    String finalInviteCode;
    String finalUsername;

    // Eğer dışarıdan veri geldiyse (Profil Ekranı) onları kullan
    if (inviteCode != null) {
      finalInviteCode = inviteCode!;
      // DÜZELTME: Eğer username geldiyse onu kullan, yoksa 'A Pioneer' yaz
      finalUsername = username ?? 'A Pioneer'; 
    } else {
      // Eğer dışarıdan gelmediyse (Takım Ekranı) Riverpod'dan çek
      final asyncUserData = ref.watch(userDataStreamProvider);
      final userData = (asyncUserData.value?.data() as Map<String, dynamic>?) ?? {};
      finalInviteCode = userData['referral_code'] ?? 'LOADING...';
      finalUsername = userData['username'] ?? 'A Pioneer';
    }

    final String displayButtonText = buttonText ?? l10n.inviteCardButton;
    final String displayTitle = titleText ?? l10n.inviteCardTitle;
    final String displayCodeLabel = inviteCodeLabel ?? l10n.inviteCardUseCode;

    const double cardWidth = 360.0;
    const double cardHeight = 640.0;
    const Color neonBlue = Color(0xFF00D1FF);
    const Color darkBackground = Color(0xFF0B0B22);

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: cardWidth,
        height: cardHeight,
        color: darkBackground,
        child: Stack(
          alignment: Alignment.center,
          children: [
            const _StarsBackground(),
            const _RadialGlow(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      _AnimatedLogo(neonBlue: neonBlue),
                      const SizedBox(height: 20),
                      Text(
                        l10n.inviteCardInvitesYou(finalUsername), // ARTIK DOĞRU İSİM YAZACAK
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white.withOpacity(0.8), fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 8),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(colors: [Color(0xFF00D1FF), Color(0xFF8A2BE2)]).createShader(bounds),
                        child: Text(
                          displayTitle,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                        ),
                      ),
                    ],
                  ),
                  _AnimatedInviteBox(inviteCode: finalInviteCode, neonBlue: neonBlue, title: displayCodeLabel),
                  Column(
                    children: [
                      Text(l10n.inviteCardGiftTitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                      const SizedBox(height: 16),
                      _GiftRow(icon: FontAwesomeIcons.solidCircle, text: l10n.inviteCardGift1, neonBlue: neonBlue),
                      const SizedBox(height: 8),
                      _GiftRow(icon: FontAwesomeIcons.stopwatch, text: l10n.inviteCardGift2, neonBlue: neonBlue),
                      const SizedBox(height: 24),
                      
                      _JoinButton(buttonText: displayButtonText),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _GiftRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color neonBlue;
  const _GiftRow({required this.icon, required this.text, required this.neonBlue});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(icon, color: neonBlue, size: 16),
        const SizedBox(width: 10),
        Text(text, style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14, height: 1.5)),
      ],
    );
  }
}

class _JoinButton extends StatelessWidget {
  final String buttonText;
  const _JoinButton({required this.buttonText});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.3),
            blurRadius: 20.0,
            spreadRadius: 2.0,
          ),
           const BoxShadow(
            color: Color(0xFF00D1FF),
            blurRadius: 10.0,
            spreadRadius: -5.0,
             offset: Offset(0, 5)
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/google_logo.png', width: 22, height: 22),
          const SizedBox(width: 10),
          Container(width: 1, height: 20, color: Colors.black26),
          const SizedBox(width: 10),
          const FaIcon(FontAwesomeIcons.apple, color: Colors.black, size: 24),
          const SizedBox(width: 12),
          Flexible(
            child: Text(
              buttonText,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class _AnimatedLogo extends StatefulWidget {
  final Color neonBlue;
  const _AnimatedLogo({required this.neonBlue});
  @override
  State<_AnimatedLogo> createState() => _AnimatedLogoState();
}

class _AnimatedLogoState extends State<_AnimatedLogo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 3))..repeat(reverse: true);
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final blur = 10 + 10 * sin(_controller.value * 2 * pi);
        return Container(
          width: 80, height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: const DecorationImage(image: AssetImage('assets/images/logo.png'), fit: BoxFit.contain),
            boxShadow: [BoxShadow(color: widget.neonBlue.withOpacity(0.5), blurRadius: blur, spreadRadius: 2.0)],
          ),
        );
      },
    );
  }
}

class _RadialGlow extends StatelessWidget {
  const _RadialGlow();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: RadialGradient(colors: [Color(0x3300D1FF), Colors.transparent], radius: 0.9, center: Alignment(0, -0.3)),
      ),
    );
  }
}

class _AnimatedInviteBox extends StatefulWidget {
  final String inviteCode;
  final Color neonBlue;
  final String title;
  const _AnimatedInviteBox({required this.inviteCode, required this.neonBlue, required this.title});
  @override
  State<_AnimatedInviteBox> createState() => _AnimatedInviteBoxState();
}

class _AnimatedInviteBoxState extends State<_AnimatedInviteBox> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 4))..repeat();
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        final color = Color.lerp(widget.neonBlue, Colors.purpleAccent, (sin(_controller.value * 2 * pi) + 1) / 2)!;
        return Container(
          width: double.infinity, padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.4), borderRadius: BorderRadius.circular(16), border: Border.all(color: color, width: 1.5), boxShadow: [BoxShadow(color: color.withOpacity(0.3), blurRadius: 15.0, spreadRadius: 1.0)]),
          child: Column(children: [Text(widget.title, style: TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.5)), const SizedBox(height: 8), Text(widget.inviteCode, style: TextStyle(color: widget.neonBlue, fontSize: 36, fontWeight: FontWeight.bold, letterSpacing: 2))]),
        );
      },
    );
  }
}

class _StarsBackground extends StatefulWidget {
  const _StarsBackground();
  @override
  State<_StarsBackground> createState() => _StarsBackgroundState();
}

class _StarsBackgroundState extends State<_StarsBackground> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<_Star> _stars;
  final Random _random = Random();
  @override
  void initState() {
    super.initState();
    _stars = List.generate(100, (index) => _Star.random(_random));
    _controller = AnimationController(vsync: this, duration: const Duration(seconds: 10))..repeat();
  }
  @override
  void dispose() { _controller.dispose(); super.dispose(); }
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _controller, builder: (context, child) { return CustomPaint(painter: _StarsPainter(_stars, _controller.value)); });
  }
}

class _StarsPainter extends CustomPainter {
  final List<_Star> stars;
  final double animationValue;
  _StarsPainter(this.stars, this.animationValue);
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white;
    for (var star in stars) {
      final opacity = (sin((animationValue * 2 * pi) + star.phase) + 1) / 2;
      paint.color = Colors.white.withOpacity(opacity * star.opacity);
      final dx = sin(animationValue * 2 * pi * (0.5 + star.radius / 1.5)) * 0.002;
      final dy = cos(animationValue * 2 * pi * (0.5 + star.radius / 1.5)) * 0.002;
      canvas.drawCircle(Offset((star.x + dx) * size.width, (star.y + dy) * size.height), star.radius, paint);
    }
  }
  @override
  bool shouldRepaint(covariant _StarsPainter oldDelegate) { return animationValue != oldDelegate.animationValue; }
}

class _Star {
  double x; double y; double radius; double opacity; double phase;
  _Star(this.x, this.y, this.radius, this.opacity, this.phase);
  factory _Star.random(Random random) { return _Star(random.nextDouble(), random.nextDouble(), random.nextDouble() * 1.0 + 0.5, random.nextDouble() * 0.5 + 0.3, random.nextDouble() * 2 * pi); }
}