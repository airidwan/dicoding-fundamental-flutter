import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/modules/profile/profile_controller.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_favorites/restaurant_favorites_controller.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_list/restaurant_list_controller.dart';

import 'home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<RestaurantListController>(() => RestaurantListController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<RestaurantFavoritesController>(() => RestaurantFavoritesController());
  }
}
