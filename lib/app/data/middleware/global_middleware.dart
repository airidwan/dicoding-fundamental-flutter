import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/controllers/app_controller.dart';
import 'package:submission_restaurantapp/app/routes/app_pages.dart';

class GlobalMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    return AppController.to.islogedin ? null : RouteSettings(name: Routes.LOGIN);
  }
}
