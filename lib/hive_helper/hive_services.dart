import 'package:hive_flutter/hive_flutter.dart';
import 'package:submission_restaurantapp/app/data/model/restaourant_fav_model.dart';
import 'package:submission_restaurantapp/hive_helper/hive_adapters.dart';
import 'package:submission_restaurantapp/hive_helper/register_adapters.dart';

class HiveServices {
  static HiveServices? _instance;
  HiveServices._();
  static HiveServices get instance {
    _instance ??= HiveServices._();
    return _instance!;
  }

  Box get box => Hive.box(HiveAdapters.box);
  Box<RestaourantFavModel> get favLocal => Hive.box<RestaourantFavModel>(HiveAdapters.restaourantFavModel);

  init() async {
    await Hive.initFlutter();
    registerAdapters();
    await open();
  }

  open() async {
    await Hive.openBox(HiveAdapters.box);
    await Hive.openBox<RestaourantFavModel>(HiveAdapters.restaourantFavModel);
  }

  close() async {
    await box.close();
    await favLocal.close();
  }
}

class BoxKey {
  static const String keyIsLogedIn = 'isLogedIn';
  static const String keyUserName = 'userName';
}
