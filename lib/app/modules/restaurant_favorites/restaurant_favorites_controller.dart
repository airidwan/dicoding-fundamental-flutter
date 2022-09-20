import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_list/restaurant_list_controller.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';

class RestaurantFavoritesController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  void onPressedFavButton(RestaurantModel _data) async {
    // await LocalFavServices.instance.delete(_data);

    RestaurantListController.to.onPressedFavButton(_data);
    update();
  }

  void navToDetail(RestaurantModel _data) {
    Get.toNamed(Routes.RESTAURANT_DETAIL, arguments: _data);
  }
}
