import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/controllers/app_scroll_controller.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';
import 'package:submission_restaurantapp/app/data/services/local_fav_services.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';

class RestaurantListController extends GetxController with StateMixin {
  static RestaurantListController get to => Get.find();
  final appScroll = Get.put(AppScrollController(), tag: 'listResto');
  final data = ApiresultModel<List<RestaurantModel>>().obs;
  final restoPopular = <RestaurantModel>[].obs;

  @override
  void onInit() {
    getRestaurantList();
    super.onInit();
  }

  void navToSearchView() {
    Get.toNamed(Routes.RESTAURANT_SEARCH);
  }

  void navToDetail(BuildContext context, RestaurantModel _data) {
    // Get.toNamed(Routes.RESTAURANT_DETAIL, arguments: _data);
    Navigator.pushNamed(context, Routes.RESTAURANT_DETAIL, arguments: _data);
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
    await ApiServices.i.fetchListRestaurantListAll().then((value) {
      data(value);
      getRandomList();
      change(data, status: RxStatus.success());
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  getRandomList() {
    final _list = ApiServices.i.getRestaurantByRandomList(data.value.data ?? []);
    restoPopular(_list);
    update();
  }

  Future refreshData() async {
    await getRestaurantList();
  }
}
