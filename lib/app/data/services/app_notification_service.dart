import 'dart:developer';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class AppNotificationService {
  static AppNotificationService? _instance;
  AppNotificationService._internal() {
    _instance = this;
  }
  factory AppNotificationService() => _instance ?? AppNotificationService._internal();

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    var initializationSettings = InitializationSettings(android: initializationSettingsAndroid);

    await flutterLocalNotificationsPlugin.initialize(initializationSettings, onSelectNotification: (String? payload) async {
      selectNotificationSubject.add(payload ?? 'empty payload');
    });
  }

  Future<void> showRestaurantRecomendation(RestaurantModel? data) async {
    if (data == null) return;
    const channelId = '1';
    const channelName = 'restaurant_chanel';
    const channelDescription = 'rekomendasi restaurant channel';
    const title = 'Rekomendasi Restoran';
    final ByteArrayAndroidBitmap _photoResto = ByteArrayAndroidBitmap(await ApiServices.i.getImageByUrl(ApiKeys.urlImageLarge(data.pictureId)));
    final ByteArrayAndroidBitmap _photoRestoSmall = ByteArrayAndroidBitmap(await ApiServices.i.getImageByUrl(ApiKeys.urlImageSmall(data.pictureId)));

    final BigPictureStyleInformation bigPictureStyleInformation = BigPictureStyleInformation(
      _photoResto,
      largeIcon: _photoRestoSmall,
      htmlFormatSummaryText: true,
      htmlFormatContentTitle: true,
      contentTitle: title,
      summaryText: '<i>${data.name}</i>',
    );

    final androidPlatformChannelSpecifics = AndroidNotificationDetails(
      channelId,
      channelName,
      channelDescription: channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: bigPictureStyleInformation,
    );

    var platformChannelSpecifics = NotificationDetails(android: androidPlatformChannelSpecifics);

    var payLoad = data.toJson();

    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      data.description.substring(0, 100),
      platformChannelSpecifics,
      payload: payLoad,
    );
  }

  cancelById(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }

  cancelAll() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }

  void showNotification() async {}

  void onSelectNotification(String? payload) {
    selectNotificationSubject.add(payload ?? '');
  }

  void selectNotificationSubjectConfig() {
    selectNotificationSubject.stream.listen((String payload) async {
      log('listeing......... $payload');
      if (payload.isEmpty) return;
      await Get.toNamed(Routes.RESTAURANT_DETAIL, arguments: RestaurantModel.fromJson(payload));
    });
  }

  void selectNotificationSubjectClose() {
    selectNotificationSubject.close();
  }
}
