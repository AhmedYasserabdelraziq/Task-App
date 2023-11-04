import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:provider/provider.dart';
import 'package:task_test/screens/home_screen/view_model/home_screen_viewmodel.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/common_functions.dart';
import '../widget/bottom_nav_bar.dart';
import '../widget/card_content.dart';
import '../widget/dots_indicator_widget.dart';
import '../widget/tapar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenViewModel>(
      builder: (ctx, viewModel, _) {
        return HomeView(
          viewModel: viewModel,
        );
      },
    );
  }
}

class HomeView extends StatefulWidget {
  final HomeScreenViewModel viewModel;

  const HomeView({super.key, required this.viewModel});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.homeBackground,
      drawer: const Icon(Icons.menu),
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12.0, left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/icons/icon_boy.png',
                      width: 32,
                      height: 32,
                    ),
                    widthSpace(2),
                    const Text(
                      'Hey,Ahmed',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    widthSpace(2),
                    Image.asset('assets/icons/icon_hand.png'),
                  ],
                ),
                heightSpace(24),
                Text(
                  'Multi-Services for Your Real Estate Needs',
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  'Explore diverse real estate services for all your needs: property management, '
                  'construction, insurance and more in one place.',
                  style: TextStyle(
                    fontSize: 15,
                    color: AppColors.lightGrey,
                  ),
                ),
                heightSpace(16),
                SizedBox(
                  height: 170,
                  child: Swiper(
                    onIndexChanged: (index) {
                      widget.viewModel.currentIndexSwiper(index);
                    },
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Opacity(
                        opacity:
                            widget.viewModel.currentIndex == index ? 1.0 : 0.5,
                        child: ContentCard(
                          dataOfSwiper: widget.viewModel.dataOfSwiper[index],
                        ),
                      );
                    },
                  ),
                ),
                heightSpace(10),
                Center(
                  child: DotsIndicatorWidget(widget: widget),
                ),
                heightSpace(16),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
              color: AppColors.whiteColor,
              child: Column(
                children: [
                  Container(
                    height: 55,
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      border:
                          Border.all(color: AppColors.borderColor, width: 1.5),
                      borderRadius: BorderRadius.circular(
                        13,
                      ),
                    ),
                    child: TapBarWidget(
                      controller: controller,
                      viewModel: widget.viewModel,
                    ),
                  ),
                  heightSpace(16),
                  Expanded(
                    child: TabBarViewWidget(
                      controller: controller,
                      widget: widget,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        viewModel: widget.viewModel,
      ),
    );
  }
}
