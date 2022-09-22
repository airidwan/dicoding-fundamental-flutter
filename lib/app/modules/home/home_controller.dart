import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/services/app_notification_service.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late PageController pageController;
  final selectedPageIndex = 0.obs;
  final AppNotificationService appNotifService = AppNotificationService();

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPageIndex.value);
    super.onInit();
    appNotifService.selectNotificationSubjectConfig();
  }

  @override
  void onClose() {
    appNotifService.selectNotificationSubjectClose();
    super.onClose();
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
