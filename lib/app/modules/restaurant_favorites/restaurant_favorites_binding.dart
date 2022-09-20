import 'package:get/get.dart';

import 'restaurant_favorites_controller.dart';

class RestaurantFavoritesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantFavoritesController>(
      () => RestaurantFavoritesController(),
    );
  }
}
