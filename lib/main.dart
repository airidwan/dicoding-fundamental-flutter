import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';

import 'package:submission_restaurantapp/app/data/configs/app_themes.dart';
import 'package:submission_restaurantapp/app/data/services/app_background_service.dart';
import 'package:submission_restaurantapp/app/data/services/app_notification_service.dart';
import 'package:submission_restaurantapp/app/data/services/get_logger_service.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

import 'app/controllers/app_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await _initApps();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: Routes.SPLASH_SCREEN,
      theme: AppThemes.theme,
      darkTheme: AppThemes.darkTheme,
      themeMode: ThemeMode.light,
      getPages: AppPages.routes,
      logWriterCallback: GetLoggerService.instance.logWriter,
    );
  }
}

_initApps() async {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);

  final AppNotificationService appNotifService = AppNotificationService();
  await appNotifService.init();

  final AppBackgroundService appService = AppBackgroundService();
  appService.initializeIsolate();

  if (Platform.isAndroid) {
    await AndroidAlarmManager.initialize();
  }
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;

  await HiveServices.instance.init();

  Get.put<AppController>(AppController(), permanent: true);
}
