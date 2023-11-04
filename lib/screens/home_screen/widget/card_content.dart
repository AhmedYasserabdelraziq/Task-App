import 'package:flutter/material.dart';
import 'package:task_test/core/utils/colors.dart';

import '../../../core/utils/common_functions.dart';
import '../../../core/widget/app_buttons.dart';
import '../model/swiper_model.dart';

class ContentCard extends StatelessWidget {
  final SwiperModel dataOfSwiper;

  const ContentCard({
    super.key,
    required this.dataOfSwiper,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 8),
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
                    dataOfSwiper.titleServices,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                ),
                heightSpace(16),
                primaryButton(dataOfSwiper.titleButton),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(dataOfSwiper.imgOfServices),
          ),
        ],
      ),
    );
  }
}
