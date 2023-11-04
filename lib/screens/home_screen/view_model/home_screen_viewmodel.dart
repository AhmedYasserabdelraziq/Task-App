import 'package:flutter/material.dart';

import '../model/swiper_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
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

  void refresh() {
    notifyListeners();
  }
}
