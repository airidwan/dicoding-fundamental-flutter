import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/configs/app_themes.dart';
import 'package:submission_restaurantapp/app/data/services/get_logger_service.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';
import 'app/controllers/app_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

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
      getPages: AppPages.routes,
      logWriterCallback: GetLoggerService.instance.logWriter,
    );
  }
}

_initApps() async {
  WidgetsBinding widgetBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetBinding);
  CachedNetworkImage.logLevel = CacheManagerLogLevel.debug;
  await HiveServices.instance.init();
  Get.put<AppController>(AppController(), permanent: true);
}
