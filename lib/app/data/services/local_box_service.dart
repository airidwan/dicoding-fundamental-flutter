import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

class LocalBoxService {
  static LocalBoxService? _instance;
  LocalBoxService._internal() {
    _instance = this;
  }
  factory LocalBoxService() => _instance ?? LocalBoxService._internal();
  final box = HiveServices.instance.box;

  Future<void> setDarkTheme(bool value) async {
    await box.put(BoxKey.darkTheme, value);
  }

  bool get isDarkTheme {
    return box.get(BoxKey.darkTheme, defaultValue: false) as bool;
  }

  Future<void> setDailyReminder(bool value) async {
    await box.put(BoxKey.dailyReminder, value);
  }

  bool get isDailyReminderActive {
    return box.get(BoxKey.dailyReminder, defaultValue: false) as bool;
  }

  Future<void> putIsLogedIn(bool value) async => await box.put(BoxKey.keyIsLogedIn, true);

  bool get isLogedIn => box.get(BoxKey.keyIsLogedIn, defaultValue: false) as bool;

  Future<void> putUserName(String value) async => await box.put(BoxKey.keyUserName, value);

  String get getUserName => box.get(BoxKey.keyUserName, defaultValue: 'airidwan') as String;
}
