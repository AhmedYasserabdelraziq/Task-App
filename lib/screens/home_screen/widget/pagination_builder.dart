import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class CustomPaginationBuilder extends SwiperPlugin {
  final Size activeSize;
  final Size size;
  final Color color;

  CustomPaginationBuilder({
    required this.activeSize,
    required this.size,
    required this.color,
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    List<Widget> dots = [];
    int itemCount = config.itemCount;
    int activeIndex = config.activeIndex;

    for (int i = 0; i < itemCount; i++) {
      bool isActive = i == activeIndex;
      dots.add(Container(
        width: isActive ? activeSize.width : size.width,
        height: isActive ? activeSize.height : size.height,
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          color: isActive ? color : Colors.grey[300],
          borderRadius: BorderRadius.circular(4),
        ),
      ));
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: dots,
      ),
    );
  }
}
