import 'package:flutter/widgets.dart';

import '../model/swiper_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final controller = PageController();
  int currentIndex = 0;
  List<SwiperModel> dataOfSwiper = [
    SwiperModel(
      titleServices: "Multi-Services for Your Real Estate Needs",
      titleButton: 'Order',
      imgOfServices: 'assets/images/card_img.png',
    ),
    SwiperModel(
      titleServices: "Multi-Services for Your Real Estate Needs",
      titleButton: 'Order',
      imgOfServices: 'assets/images/card_img.png',
    ),
    SwiperModel(
      titleServices: "Multi-Services for Your Real Estate Needs",
      titleButton: 'Order',
      imgOfServices: 'assets/images/card_img.png',
    ),
  ];

  void currentIndexSwiper(int index) {
    currentIndex = index;
    notifyListeners();
  }
}
