import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qwilt/src/providers/providers.dart';

class Navigation extends StatelessWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final currentIndex = navigationProvider.selectedMenuOpt;
    return BottomNavigationBar(
      onTap: (int index) => navigationProvider.selectedMenuOpt = index,
      currentIndex: currentIndex,
      elevation: 0,
      showUnselectedLabels: true,
      selectedItemColor: Colors.deepOrangeAccent,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Portfolios',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Properties',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.feed_outlined),
          label: 'Leases',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.supervised_user_circle),
          label: 'Contacts',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
