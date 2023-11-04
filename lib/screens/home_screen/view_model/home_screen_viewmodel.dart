import 'package:flutter/material.dart';
import 'package:task_test/core/utils/status.dart';
import 'package:task_test/screens/home_screen/model/place_holder_model.dart';
import 'package:task_test/services/api_service.dart';

import '../model/swiper_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ApiService apiService;

  HomeScreenViewModel(this.apiService);

  int currentIndex = 0;
  var currentNum = 0;
  List<PlaceHolderModel> myPlaceholder = [];
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

  void getPlaceHolder() async {
    var resource = await apiService.getMyPlaceHolder();
    if (resource.status == Status.SUCCESS) {
      myPlaceholder = resource.data!;
      notifyListeners();
    }
  }

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
