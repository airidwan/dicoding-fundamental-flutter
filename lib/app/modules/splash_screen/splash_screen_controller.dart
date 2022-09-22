// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    FlutterNativeSplash.remove();
    startSplashScreen();
    super.onInit();
  }

  Future startSplashScreen() async {
    var duration = const Duration(seconds: 1);
    await Future.delayed(duration).then(
      (value) => Get.offAndToNamed(Routes.HOME),
    );
  }
}
