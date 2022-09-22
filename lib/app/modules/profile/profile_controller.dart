import 'dart:developer';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/model/user_profile_model.dart';
import 'package:submission_restaurantapp/app/data/services/app_background_service.dart';
import 'package:submission_restaurantapp/app/data/services/local_box_service.dart';
import 'package:submission_restaurantapp/app/utils/date_time_helper.dart';

class ProfileController extends GetxController {
  final userData = UserProfileModel().obs;
  final localbox = LocalBoxService();

  @override
  void onInit() {
    super.onInit();
    userData(UserProfileModel(
      name: 'Ade Iwan Ridwanudin',
      email: 'ridwanudin45@gmail.com',
      bird: '28 April 1988',
      contact: '087772223333',
      birdPlace: 'Lebak',
      alamat: 'Cilaja Hilir, Maja, Lebak - Banten, 42381',
      userName: localbox.getUserName,
      imageUrl: 'https://avatars.githubusercontent.com/u/9293764?s=400&u=30a12020e34b9f06b41989acfa2d890c237ad933&v=4',
    ));
  }

  void changeThemeMode(bool value) {
    localbox.setDarkTheme(value);
    Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
  }

  void setDailyReminder(bool value) {
    localbox.setDailyReminder(value);
    scheduleNotification(value);
  }

  Future<bool> scheduleNotification(bool value) async {
    if (value) {
      log('[${DateTime.now()}] - scheduleNotification activated');
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        AppBackgroundService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    } else {
      return await AndroidAlarmManager.cancel(1);
    }
  }
}
