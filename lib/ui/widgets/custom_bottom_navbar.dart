import 'package:flutter/material.dart';
import 'package:hk_music/ui/views/discover_page/discover_page.dart';
import 'package:hk_music/ui/views/library_page/library.dart';
import 'package:hk_music/ui/views/profile_page/profile_page.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../common/constants/colors.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: const [
          DiscoverPage(),
          LibraryPage(),
          ProfileScreen(),
        ],
        items: _navBarsItems(),
        navBarStyle: NavBarStyle.style6,
        backgroundColor: AppColors.primaryColor,
      ),
    );
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.home,
          size: 24,
        ),
        title: ("Discover"),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Iconsax.music_library_2,
          size: 24,
        ),
        title: ("Library"),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.person,
          size: 24,
        ), //FontAwesomeIcons.bell
        title: ("Profile"),
        activeColorPrimary: AppColors.textPrimary,
        inactiveColorPrimary: AppColors.textGrey,
      ),
    ];
  }
}
