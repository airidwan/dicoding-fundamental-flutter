import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/controllers/app_controller.dart';

class LoginController extends GetxController {
  AppController appCtrl = Get.find<AppController>();
  late TextEditingController userNameController;
  late TextEditingController passwordController;
  final buttonEnable = false.obs;

  @override
  void onInit() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void onTextChanged(String value) {
    if (userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      buttonEnable(true);
    } else {
      buttonEnable(false);
    }
  }

  void onSubmit() {
    appCtrl.login(userNameController.text);
  }
}
