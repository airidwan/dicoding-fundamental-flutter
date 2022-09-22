import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/services/local_box_service.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final localRepo = LocalBoxService();
  final _logedin = false.obs;
  bool get islogedin => _logedin.value;
  set logedin(value) => _logedin.value = value;

  @override
  void onInit() {
    _logedin.value = localRepo.box.get(BoxKey.keyIsLogedIn, defaultValue: false) as bool;
    super.onInit();
  }

  Future login(String userName) async {
    Get.dialog(const LoadingWidget());
    await Future.delayed(const Duration(seconds: 2));
    await localRepo.putIsLogedIn(true);
    await localRepo.putUserName(userName);
    logedin = true;
    if (Get.isDialogOpen!) Get.back();
    Get.offAndToNamed(Routes.HOME);
  }

  Future logout() async {
    Get.dialog(const LoadingWidget(), barrierDismissible: false);
    await Future.delayed(const Duration(seconds: 1));
    localRepo.putIsLogedIn(false);
    localRepo.putUserName('');
    logedin = false;
    Get.back();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
