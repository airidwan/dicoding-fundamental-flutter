import 'package:get/get.dart';

import 'restaurant_search_controller.dart';

class RestaurantSearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RestaurantSearchController>(
      () => RestaurantSearchController(),
    );
  }
}
