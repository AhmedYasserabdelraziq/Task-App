import 'package:flutter/material.dart';

import '../model/swiper_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
  int currentIndex = 0;
  var currentNum = 0;
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
  List categoriesName = [
    'Constructions',
    'Insurances',
    'Legal',
    'Buy & Sell',
    'Accounting Services',
  ];
  List categoriesIcons = [
    'assets/icons/construction_icon.png',
    'assets/icons/instruction.png',
    'assets/icons/legal_icon.png',
    'assets/icons/buy_sell.png',
    'assets/icons/accounting.png',
  ];

  void currentNavNum(int index) {
    currentNum = index;
    notifyListeners();
  }

  void currentIndexSwiper(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
