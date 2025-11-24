// lib/navigation_shell.dart (TAM VE DÜZELTİLMİŞ)

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // YENİ IMPORT
import 'package:on_network/core/widgets/custom_bottom_nav_bar.dart';
import 'package:on_network/features/home/view/home_screen.dart';
import 'package:on_network/features/team/view/team_screen.dart';
import 'package:on_network/features/marketplace/view/marketplace_screen.dart';
import 'package:on_network/features/profile/view/profile_screen.dart';

// YENİ: Navigasyon index'ini global state'e taşıyalım (Adım 3.4 için)
final navigationShellIndexProvider = StateProvider<int>((ref) => 0);

class NavigationShell extends ConsumerStatefulWidget { // YENİ: StatefulWidget -> ConsumerStatefulWidget
  const NavigationShell({super.key});

  @override
  ConsumerState<NavigationShell> createState() => _NavigationShellState(); // YENİ: State -> ConsumerState
}

class _NavigationShellState extends ConsumerState<NavigationShell> { // YENİ: State -> ConsumerState
  // int _selectedIndex = 0; // ESKİ: Bu state artık global provider'da

  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    TeamScreen(),
    MarketplaceScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    // ESKİ: setState(() { _selectedIndex = index; });
    // YENİ: Provider'ı güncelle
    ref.read(navigationShellIndexProvider.notifier).state = index;
  }

  @override
  Widget build(BuildContext context) {
    // YENİ: Provider'ı izle
    final selectedIndex = ref.watch(navigationShellIndexProvider);

    return Scaffold(
      body: _screens[selectedIndex], // ESKİ: _screens[_selectedIndex]
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: CustomBottomNavBar(
          selectedIndex: selectedIndex, // ESKİ: selectedIndex: _selectedIndex
          onItemTapped: _onItemTapped,
        ),
      ),
    );
  }
}