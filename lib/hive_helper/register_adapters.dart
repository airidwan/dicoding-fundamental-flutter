import 'package:hive/hive.dart';
import 'package:submission_restaurantapp/app/data/model/restaourant_fav_model.dart';

void registerAdapters() {
  Hive.registerAdapter(RestaourantFavModelAdapter());
}
