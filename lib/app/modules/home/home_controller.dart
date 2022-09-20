import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController pageController;
  final selectedPageIndex = 0.obs;
  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPageIndex.value);
    super.onInit();
  }

  void onTapPageIndex(int index) {
    if (selectedPageIndex.value != index) selectedPageIndex(index);
  }

  void onTapBottomNavBaar(int index) {
    if (selectedPageIndex.value != index) {
      selectedPageIndex(index);
      pageController.animateToPage(index, duration: const Duration(milliseconds: 10), curve: Curves.ease);
    }
  }
}
