import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
      ),
      body: Obx(
        (() {
          final _userData = controller.userData.value;
          return SafeArea(
            child: SizedBox(
              width: Get.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  10.heightBox,
                  ClipOval(
                    child: Material(
                      child: CachedNetworkImage(
                        imageUrl: _userData.imageUrl,
                        progressIndicatorBuilder: (context, url, progress) => LoadingWidget(),
                        errorWidget: (context, url, error) => Assets.noImage.svg(),
                        width: 180,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  5.heightBox,
                  Column(
                    children: [
                      _buildTile('Username', _userData.userName),
                      _buildTile('Full Name', _userData.name),
                      _buildTile('Email', _userData.email),
                      _buildTile('Contact', _userData.contact),
                      _buildTile('Address', _userData.alamat),
                    ],
                  ),
                  5.heightBox,
                  ValueListenableBuilder(
                    valueListenable: HiveServices.instance.box.listenable(),
                    builder: (BuildContext context, box, Widget? child) {
                      return Center(
                        child: ListView(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          children: [
                            _buildSetting(
                              'Restaurant Notification',
                              child: Switch.adaptive(
                                value: controller.localbox.isDailyReminderActive,
                                onChanged: controller.setDailyReminder,
                              ),
                            ),
                            5.heightBox,
                            _buildSetting(
                              'Dark theme',
                              child: Switch.adaptive(
                                value: controller.localbox.isDarkTheme,
                                onChanged: controller.changeThemeMode,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildTile(String label, String title) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      width: Get.width,
      margin: EdgeInsets.only(bottom: 5),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          label.text.size(12).make(),
          3.heightBox,
          title.text.sm.color(Colors.grey).make(),
        ],
      ),
    );
  }

  Widget _buildSetting(String label, {Widget? child}) {
    return Material(
      color: Colors.white,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16),
        // color: Colors.white,
        width: Get.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            label.text.gray600.make(),
            child ?? SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
