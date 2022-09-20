import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_detail/restaurant_detail_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantMenusWidget extends GetWidget<RestaurantDetailController> {
  @override
  Widget build(BuildContext context) {
    final data = controller.data.value;
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Menu'.text.bold.make().marginOnly(left: 10),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                6.heightBox,
                'Foods:'.text.size(13).make(),
                Wrap(
                  spacing: 3,
                  runSpacing: 2,
                  children: data.menus.foods
                      .map(
                        (e) => _buildMenuList(e.name),
                      )
                      .toList(),
                ),
                5.heightBox,
                'Drinks:'.text.size(13).make(),
                Wrap(
                  spacing: 3,
                  runSpacing: 2,
                  children: data.menus.drinks
                      .map(
                        (e) => _buildMenuList(e.name),
                      )
                      .toList(),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _buildMenuList(String title) {
    return title.text.color(Colors.white).sm.semiBold.make().pSymmetric(h: 6, v: 5).box.blue400.make().card.make();
  }
}
