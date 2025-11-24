import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Bu provider, uygulamanın o anki dil ayarını (Locale) tutar.
// Varsayılan olarak 'null' başlar, bu da Flutter'ın sistem dilini kullanmasını sağlar.
final localeProvider = StateProvider<Locale?>((ref) {
  return null;
});
