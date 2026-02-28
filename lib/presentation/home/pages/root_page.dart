import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/theme/app_pallete.dart';
import '../../profile/profile_page.dart';
import 'home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        tabs: [
          PersistentTabConfig(
            screen: HomePage(),
            item: ItemConfig(icon: Icon(Icons.home), title: 'Beranda'),
          ),
          PersistentTabConfig(
            screen: ProfilePage(),
            item: ItemConfig(icon: Icon(Icons.person), title: 'Akun'),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style4BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration: NavBarDecoration(color: AppPallete.primaryLight),
        ),
      ),
    );
  }
}
