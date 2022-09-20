import 'dart:math';

import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantReviewWidget extends StatelessWidget {
  final List<CustomerReviewsModel> datalist;
  const RestaurantReviewWidget({Key? key, this.datalist = const []}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        'Reviews'.text.bold.make().marginOnly(top: 10, left: 10),
        ListView.separated(
          itemCount: datalist.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext context, int index) {
            final _data = datalist[index];
            return Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _data.name.text.semiBold.size(11).make(),
                  3.heightBox,
                  AppRatingWidget(
                    rating: Random().nextDouble() * 5.0,
                    itemSize: 10,
                  ),
                  5.heightBox,
                  Container(
                    child: ReadMoreText(
                      _data.review,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  10.heightBox,
                  _data.date.text.sm.gray800.make(),
                ],
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) => Divider(),
        ),
      ]),
    );
  }
}
