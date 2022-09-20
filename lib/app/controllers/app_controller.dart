import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';

class AppController extends GetxController {
  static AppController get to => Get.find();
  final localRepo = HiveServices.instance;
  final _logedin = false.obs;
  bool get islogedin => _logedin.value;
  set logedin(value) => this._logedin.value = value;

  @override
  void onInit() {
    _logedin.value = localRepo.box.get(BoxKey.keyIsLogedIn, defaultValue: false) as bool;
    super.onInit();
  }

  Future login(String userName) async {
    Get.dialog(LoadingWidget());
    await Future.delayed(Duration(seconds: 2));
    await localRepo.box.put(BoxKey.keyIsLogedIn, true);
    await localRepo.box.put(BoxKey.keyUserName, userName);
    logedin = true;
    if (Get.isDialogOpen!) Get.back();
    Get.offAndToNamed(Routes.HOME);
  }

  Future logout() async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    await Future.delayed(Duration(seconds: 1));
    localRepo.box.put(BoxKey.keyIsLogedIn, false);
    localRepo.box.put(BoxKey.keyUserName, '');
    logedin = false;
    Get.back();
    Get.offAndToNamed(Routes.LOGIN);
  }
}
