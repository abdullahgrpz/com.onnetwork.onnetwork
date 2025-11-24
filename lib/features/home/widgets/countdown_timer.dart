// lib/features/home/widgets/countdown_timer.dart (BASİTLEŞTİRİLMİŞ)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:on_network/features/home/providers/home_providers.dart'; // Provider'ı import et

// StatefulWidget -> ConsumerWidget
class CountdownTimer extends ConsumerWidget {
  // Artık 'endTime' parametresine ihtiyacı yok
  const CountdownTimer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Zamanlayıcı provider'ını izle
    final remainingTime = ref.watch(countdownProvider);

    return Text(
      // Formatlama fonksiyonunu provider dosyasından kullan
      formatDuration(remainingTime),
      style: const TextStyle(
        color: Colors.white,
        fontSize: 28, // Boyutu biraz küçültebiliriz
        fontWeight: FontWeight.w300,
        letterSpacing: 4,
      ),
    );
  }
}