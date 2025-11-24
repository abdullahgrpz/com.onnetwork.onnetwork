// lib/features/home/widgets/activate_button.dart (LOKALİZASYON DESTEĞİ EKLENDİ - KAYMA DÜZELTİLDİ)

import 'package:flutter/material.dart';

class ActivateButton extends StatelessWidget {
  final bool isMiningActive;
  final bool isLoading;
  final VoidCallback? onActivate;
  final String activeText; // YENİ: Lokalize metin için parametre eklendi

  const ActivateButton({
    super.key,
    required this.isMiningActive,
    required this.isLoading,
    this.onActivate,
    required this.activeText, // YENİ: Constructor'a eklendi
  });

  @override
  Widget build(BuildContext context) {
    // Yükleniyorsa veya aktifse tıklamayı engelle
    final bool canTap = !isLoading && !isMiningActive;

    return GestureDetector(
      onTap: canTap ? onActivate : null,
      child: Container(
        width: 200,
        height: 200,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00D1FF).withOpacity(0.3),
              blurRadius: 40,
              spreadRadius: isMiningActive ? 5 : 15,
            ),
          ],
        ),
        child: Center(
          child: Container(
            width: 180,
            height: 180,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF00D1FF).withOpacity(0.3), width: 4),
            ),
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF1A1A2E),
                border: Border.all(color: const Color(0xFF00D1FF), width: 2),
              ),
              child: Center(
                // --- YÜKLENME KONTROLÜ BURADA ---
                child: isLoading
                    ? const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(
                    color: Color(0xFF00D1FF),
                    strokeWidth: 5,
                  ),
                )
                    : isMiningActive
                    ? Text(
                  // GÜNCELLENDİ: 'ACTIVE' -> activeText (parametreden gelen)
                  activeText,
                  // DÜZELTME: Metni ortalamak için bu satır eklendi
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Color(0xFF00D1FF),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3,
                  ),
                )
                    : const Icon(
                  Icons.power_settings_new,
                  color: Color(0xFF00D1FF),
                  size: 90,
                ),
                // --- KONTROL BİTTİ ---
              ),
            ),
          ),
        ),
      ),
    );
  }
}