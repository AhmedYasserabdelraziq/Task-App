import 'package:flutter/material.dart';
import 'package:task_test/core/utils/status.dart';
import 'package:task_test/screens/home_screen/model/place_holder_model.dart';
import 'package:task_test/services/api_service.dart';

import '../model/swiper_model.dart';

class HomeScreenViewModel extends ChangeNotifier {
  final ApiService apiService;

  HomeScreenViewModel(this.apiService);

  int currentSwiperIndex = 0;
  var currentNavIndex = 0;
  List<UserModel> myUsers = [];
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

  void getUsers() async {
    var resource = await apiService.getMyUsers();
    if (resource.status == Status.SUCCESS) {
      myUsers = resource.data!;
      notifyListeners();
    }
  }

  void currentNavNum(int index) {
    currentNavIndex = index;
    notifyListeners();
  }

  void currentSwiperNum(int index) {
    currentSwiperIndex = index;
    notifyListeners();
  }

  void refresh() {
    notifyListeners();
  }
}
