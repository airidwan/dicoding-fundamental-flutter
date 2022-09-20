import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';
import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantItemWidget extends StatelessWidget {
  final RestaurantModel dataItem;
  final VoidCallback? onTap;
  final VoidCallback? iconOnpressed;
  final Widget? iconButton;
  const RestaurantItemWidget({
    Key? key,
    required this.dataItem,
    this.onTap,
    this.iconOnpressed,
    this.iconButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _km = Random().nextDouble() * 10.0;
    return Container(
      width: Get.width,
      child: Card(
        child: Container(
          padding: EdgeInsets.all(5),
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: onTap,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 120,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ImageNetworkWidget(
                      imageUrl: ApiKeys.urlImageSmall(dataItem.pictureId),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        dataItem.name.text.bold.make(),
                        5.heightBox,
                        IconTitleWidget(
                          iconData: Icons.location_on,
                          textTitle: dataItem.city,
                        ),
                        8.heightBox,
                        IconTitleWidget(
                          iconData: Icons.star,
                          textTitle: '${dataItem.rating}',
                          iconColor: AppColors.lightOrange,
                        ),
                        5.heightBox,
                        '${_km.toDoubleStringAsFixed()} Kilometer lagi'.text.maxLines(2).overflow(TextOverflow.ellipsis).sm.gray700.make(),
                      ],
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    child: IconButton(
                        onPressed: iconOnpressed,
                        icon: iconButton ??
                            Icon(
                              dataItem.isFav ? Icons.favorite : Icons.favorite_border,
                              color: AppColors.lightOrange,
                            )),
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
