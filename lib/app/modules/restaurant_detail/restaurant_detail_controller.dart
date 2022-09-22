import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/controllers/app_scroll_controller.dart';
import 'package:submission_restaurantapp/app/data/model/common_enum.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/data/services/api_services.dart';
import 'package:submission_restaurantapp/app/data/services/local_fav_services.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_detail/widgets/review_input_widget.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';

class RestaurantDetailController extends GetxController with StateMixin {
  final data = RestaurantModel().obs;
  final appScroll = Get.put(AppScrollController(), tag: 'detailResto');
  final dataResult = ApiresultModel<RestaurantModel>().obs;

  final apiStatus = XStatus.loading.obs;
  final isFirtloading = true.obs;

  final nameController = TextEditingController();
  final reviewController = TextEditingController();

  @override
  void onInit() async {
    data(Get.arguments);
    super.onInit();
  }

  @override
  void onReady() async {
    firstInit();
    super.onReady();
  }

  @override
  void onClose() async {
    super.onClose();
    appScroll.dispose();
    nameController.dispose();
    reviewController.dispose();
  }

  Future getRestaurantDetailById() async {
    await ApiServices.i.getRestaurantDetailById(data.value.id).then((value) {
      dataResult(value);
      data(value.data);
      if (isFirtloading.isFalse) {
        change(data, status: RxStatus.success());
      }
      apiStatus(XStatus.success);

      data.refresh();
    }, onError: (err) {
      change(null, status: RxStatus.error(err.toString()));
      apiStatus(XStatus.error);
    });
    update();
  }

  Future<void> refreshData() async {
    isFirtloading(false);
    change(null, status: RxStatus.loading());
    apiStatus(XStatus.loading);
    getRestaurantDetailById();
  }

  Future firstInit() async {
    isFirtloading(true);
    change(data, status: RxStatus.success());
    apiStatus(XStatus.loading);
    await getRestaurantDetailById();

    isFirtloading(false);
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

  Future addReview(String name, String review) async {
    Get.dialog(LoadingWidget());
    await ApiServices.i
        .addRestaurantReview(
      id: data.value.id,
      name: name,
      review: review,
    )
        .then((value) {
      if (value.data != null) {
        data.value.customerReviews = value.data!;
        data.refresh();
        update();
      }
      Get.back();
      Get.snackbar('Info', 'Berhasil menambahkan review');
    }, onError: (err) {
      Get.back();
      Get.snackbar('Info', 'Gagal menambahkan review');
    });
  }

  void showInput() async {
    await Get.bottomSheet(ReviewInputWidget());
  }

  void submitReview() {
    if (nameController.text.isNotEmpty && reviewController.text.isNotEmpty) {
      Get.back();
      addReview(nameController.text, reviewController.text);
    } else {
      Get.snackbar('Info', 'Data masih kosong');
      return;
    }
  }
}
