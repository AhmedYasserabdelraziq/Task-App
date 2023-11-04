import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import '../view/home_screen.dart';

class DotsIndicatorWidget extends StatelessWidget {
  const DotsIndicatorWidget({
    super.key,
    required this.widget,
  });

  final HomeView widget;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: widget.viewModel.currentIndex,
      decorator: DotsDecorator(
        spacing: const EdgeInsets.all(2),
        size: const Size(6, 6),
        activeSize: const Size(25.0, 6.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        color: AppColors.dotsColor,
        activeColor: AppColors.primary,
      ),
    );
  }
}
