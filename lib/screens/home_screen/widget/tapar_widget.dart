import 'package:flutter/material.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';

import '../../../core/utils/colors.dart';

class TapBarWidget extends StatelessWidget {
  final TabController controller;
  final HomeScreenViewModel viewModel;

  const TapBarWidget({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (_) {
        viewModel.refresh();
      },
      indicator: const BoxDecoration(),
      indicatorPadding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      dividerColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      indicatorSize: TabBarIndicatorSize.label,
      controller: controller,
      labelColor: AppColors.whiteColor,
      isScrollable: false,
      tabs: [
        Tab(child: createTab('Categories', controller.index == 0)),
        Tab(child: createTab('Services', controller.index == 1)),
        Tab(child: createTab('Orders(0)', controller.index == 2)),
      ],
    );
  }
}

Widget createTab(String text, bool isSelected) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: isSelected ? Colors.red : Colors.grey.withOpacity(0.3),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Text(
      text,
      style: TextStyle(color: isSelected ? Colors.white : Colors.black),
    ),
  );
}
