import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/model/restaourant_fav_model.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

class LocalFavServices {
  static LocalFavServices? _instance;
  // Avoid self isntance
  LocalFavServices._();
  static LocalFavServices get instance {
    _instance ??= LocalFavServices._();
    return _instance!;
  }

  List<RestaourantFavModel> getAll() {
    return HiveServices.instance.favLocal.values.toList();
  }

  RestaourantFavModel? getById(String id) {
    return HiveServices.instance.favLocal.get(id);
  }

  Future add(RestaurantModel data) async {
    final _data = RestaourantFavModel.fromMap(data.toMap());
    await HiveServices.instance.favLocal.put(_data.id, _data);
  }

  Future delete(RestaurantModel data) async {
    await HiveServices.instance.favLocal.delete(data.id);
  }

  bool isFav(String id) => getById(id) != null;
}
