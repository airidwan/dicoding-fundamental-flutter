import 'dart:developer';
import 'dart:isolate';
import 'dart:ui';

import 'package:submission_restaurantapp/app/data/services/api_services.dart';

import 'app_notification_service.dart';

final ReceivePort port = ReceivePort();

class AppBackgroundService {
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  static AppBackgroundService? _instance;
  AppBackgroundService._internal() {
    _instance = this;
  }

  factory AppBackgroundService() => _instance ?? AppBackgroundService._internal();

  void initializeIsolate() {
    IsolateNameServer.registerPortWithName(
      port.sendPort,
      _isolateName,
    );
  }

  static Future<void> callback() async {
    log('${DateTime.now()} notif alarm --> Eksekusi');
    final restaurant = await ApiServices.i.getRestaurantByRandom([]);
    await AppNotificationService().showRestaurantRecomendation(restaurant);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}
