import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

import '../restaurant_detail_controller.dart';

class ReviewInputWidget extends GetWidget<RestaurantDetailController> {
  const ReviewInputWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              20.heightBox,
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(height: 35, width: Get.width * .40),
                child: TextField(
                  controller: controller.nameController,
                  style: TextStyle(fontSize: 12),
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    labelStyle: TextStyle(fontSize: 12),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.all(8),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: TextField(
                  controller: controller.reviewController,
                  style: TextStyle(fontSize: 12),
                  minLines: 5,
                  maxLines: 10,
                  decoration: InputDecoration(
                    labelText: 'Review',
                    isDense: true,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    hintStyle: TextStyle(fontSize: 10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  ),
                ),
              ),
              5.heightBox,
              ElevatedButton(
                onPressed: () => controller.submitReview(),
                style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2), fixedSize: const Size(150, 35)),
                child: 'Submit'.text.make(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
