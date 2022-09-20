import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';
import 'package:submission_restaurantapp/app/modules/login/login_input_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            reverse: true,
            child: Column(
              children: <Widget>[
                'DICODING APPS'.text.bold.size(20).make(),
                10.heightBox,
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Assets.icon.image(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ),
                18.heightBox,
                Obx(
                  () => Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        25.heightBox,
                        LoginInputWidget(txtController: controller.userNameController, hintText: 'Username', onchanged: (value) => controller.onTextChanged(value)),
                        16.heightBox,
                        LoginInputWidget(txtController: controller.passwordController, hintText: 'Password', obscureText: true, onchanged: (value) => controller.onTextChanged(value)),
                        20.heightBox,
                        SizedBox(
                          height: 50,
                          width: 250,
                          child: ElevatedButton.icon(
                            onPressed: controller.buttonEnable.isFalse ? null : controller.onSubmit,
                            icon: Icon(Icons.system_update_alt_sharp, size: 18),
                            label: 'L O G I N'.text.make(),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
