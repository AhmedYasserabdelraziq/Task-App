import 'package:flutter/material.dart';
import 'package:task_test/core/utils/colors.dart';

Widget primaryButton(String title) {
  return Container(
    width: 150,
    height: 37,
    alignment: Alignment.center,
    //padding: const EdgeInsets.symmetric(vertical: 16),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30),
      color: AppColors.primary,
    ),
    child: Text(
      title,
      style: TextStyle(
        color: AppColors.whiteColor,
        fontSize: 15,
      ),
    ),
  );
}
