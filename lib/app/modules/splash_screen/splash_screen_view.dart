import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';

import 'splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  const SplashScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: LoadingWidget(width: 100, height: 100, strokeWidth: 10),
    );
  }
}
