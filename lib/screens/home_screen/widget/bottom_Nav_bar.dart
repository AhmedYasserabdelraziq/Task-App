import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.lightGrey,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            scale: 1,
            'assets/icons/home_icon.png',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            scale: 1,
            'assets/icons/assets_icon.png',
          ),
          label: 'Assets',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            scale: 1.5,
            'assets/icons/support_icon.png',
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            scale: 1.5,
            'assets/icons/profile_icon.png',
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
