import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

class NotificationService {
  static NotificationService? _instance;
  NotificationService._();
  static NotificationService get instance {
    _instance ??= NotificationService._();
    return _instance!;
  }

  Future initNotification() async {}

  void cancellAll() async => flutterLocalNotificationsPlugin.cancelAll();

  void showNotification() async {}
}
