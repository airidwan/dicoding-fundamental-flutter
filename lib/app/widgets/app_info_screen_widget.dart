import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';
import 'package:velocity_x/velocity_x.dart';

class AppInfoScreenWidget extends StatelessWidget {
  final String msgInfo;
  final VoidCallback? onPresed;
  final SvgGenImage? image;
  const AppInfoScreenWidget({
    Key? key,
    this.msgInfo = '',
    this.onPresed,
    this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (image != null)
              image!.svg(
                fit: BoxFit.contain,
                alignment: Alignment.topCenter,
                width: Get.width * .6,
              ),
            if (msgInfo.isNotEmpty)
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: msgInfo.text.size(12).color(Colors.grey).overflow(TextOverflow.ellipsis).make(),
              ),
            if (onPresed != null)
              Column(
                children: [
                  40.heightBox,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton.icon(
                      onPressed: onPresed,
                      icon: Icon(Icons.undo, size: 18),
                      label: 'Refresh'.text.make(),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
