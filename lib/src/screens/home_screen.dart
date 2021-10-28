import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/providers/providers.dart';
import 'package:qwilt/src/screens/contacts_screen.dart';
import 'package:qwilt/src/screens/leases_screen.dart';
import 'package:qwilt/src/screens/screens.dart';
import 'package:qwilt/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _HomePageNavigation(), bottomNavigationBar: const Navigation());
  }
}

class _HomePageNavigation extends StatelessWidget {
  const _HomePageNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;

    switch (currentIndex) {
      case 0:
        return const PortfolioScreen();
      case 1:
        return const PropertiesScreen();
      case 2:
        return const LeasesScreen();
      case 3:
        return const ContactsScreen();
      case 4:
        return const SettingsScreen();
      default:
        return const PortfolioScreen();
    }
  }
}
