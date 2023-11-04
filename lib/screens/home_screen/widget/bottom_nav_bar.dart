import 'package:flutter/material.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';

import '../../../core/utils/colors.dart';

class BottomNavBar extends StatelessWidget {
  final HomeScreenViewModel viewModel;

  const BottomNavBar({
    super.key,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 5,
      backgroundColor: AppColors.whiteColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: viewModel.currentNum,
      onTap: (index) {
        viewModel.currentNavNum(index);
      },
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.navBarDisableColor,
      items: [
        BottomNavigationBarItem(
          icon: Image.asset(
            color: viewModel.currentNum == 0
                ? AppColors.primary
                : AppColors.navBarDisableColor,
            scale: 1,
            'assets/icons/home_icon.png',
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            color: viewModel.currentNum == 1
                ? AppColors.primary
                : AppColors.navBarDisableColor,
            scale: 1,
            'assets/icons/assets_icon.png',
          ),
          label: 'Assets',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            color: viewModel.currentNum == 2
                ? AppColors.primary
                : AppColors.navBarDisableColor,
            scale: 1.5,
            'assets/icons/support_icon.png',
          ),
          label: 'Support',
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            color: viewModel.currentNum == 3
                ? AppColors.primary
                : AppColors.navBarDisableColor,
            scale: 1.5,
            'assets/icons/profile_icon.png',
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
