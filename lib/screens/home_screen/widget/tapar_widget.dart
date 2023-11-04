import 'package:flutter/material.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';

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

class TabBarViewWidget extends StatelessWidget {
  final TabController controller;
  final HomeScreenViewModel viewModel;

  const TabBarViewWidget({
    super.key,
    required this.controller,
    required this.viewModel,
  });

  @override
  Widget build(BuildContext context) {
    return TabBarView(
      controller: controller,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Categories View',
                  style: TextStyle(
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  'see all',
                  style: TextStyle(
                      color: AppColors.lightGrey,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: viewModel.myPlaceholder.length,
                  itemBuilder: (ctx, index) {
                    return Column(
                      children: [
                        Card(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(12),
                              bottomRight: Radius.circular(12),
                            ),
                          ),
                          color: Theme.of(context).colorScheme.primary,
                          elevation: .3,
                          child: ListTile(
                            leading: Text(
                              viewModel.myPlaceholder[index].id.toString(),
                              style: const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            title: Text(
                              viewModel.myPlaceholder[index].name.toString(),
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                        heightSpace(8),
                      ],
                    );
                  }),
            ),
          ],
        ),
        const Center(child: Text('Services')),
        SingleChildScrollView(
          child: Column(
            children: [
              Image.asset('assets/images/not_found.png'),
              const Text(
                'No results found',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Text(
                'you can place your needed orders to let serve you.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.lightGrey,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
