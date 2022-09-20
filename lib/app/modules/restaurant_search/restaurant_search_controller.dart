import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';
import 'package:submission_restaurantapp/app/data/services/local_fav_services.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';

class RestaurantSearchController extends GetxController with StateMixin {
  final data = ApiresultModel<List<RestaurantModel>>().obs;
  late TextEditingController inputController;
  final textQuery = ''.obs;
  @override
  void onInit() {
    inputController = TextEditingController();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  @override
  void onClose() {
    inputController.dispose();
    super.onClose();
  }

  Future onSubmit(String value) async {
    textQuery(value);
    await getRestaurantList();
  }

  void navToDetail(RestaurantModel _data) {
    Get.toNamed(Routes.RESTAURANT_DETAIL, arguments: _data);
  }

  void onPressedFavButton(RestaurantModel _data) {
    if (_data.isFav) {
      LocalFavServices.instance.delete(_data);
    } else {
      LocalFavServices.instance.add(_data);
    }
    _data.isFav = !_data.isFav;

    update();
  }

  Future getRestaurantList() async {
    change(null, status: RxStatus.loading());
    await ApiServices.i.getRestaurantByQuery(inputController.text).then((value) {
      data(value);
      change(value,  status: value.founded > 0 ? RxStatus.success() : RxStatus.empty());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  Future refreshData() async {
    await getRestaurantList();
  }
}
