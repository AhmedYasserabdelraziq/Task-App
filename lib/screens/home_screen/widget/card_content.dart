import 'package:flutter/material.dart';
import 'package:task_test/core/utils/colors.dart';

import '../../../core/utils/common_functions.dart';
import '../../../core/widget/app_buttons.dart';

class ContentCard extends StatelessWidget {
  final String titleServices;
  final String titleButton;
  final String imgOfServices;

  const ContentCard({
    super.key,
    required this.titleServices,
    required this.titleButton,
    required this.imgOfServices,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 26),
      color: AppColors.lightRed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: Text(
                    titleServices,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                heightSpace(16),
                primaryButton(titleButton),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(imgOfServices),
          ),
        ],
      ),
    );
  }
}
