import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:submission_restaurantapp/hive_helper/hive_services.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'restaurant_favorites_controller.dart';

class RestaurantFavoritesView extends GetView<RestaurantFavoritesController> {
  const RestaurantFavoritesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites Restaurant'),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: HiveServices.instance.favLocal.listenable(),
        builder: (context, box, widget) {
          final _dataList = box.values.toList();
          if (_dataList.isEmpty) {
            return AppEmptyWidget(
              message: 'Belum ada data yang ditambahkan',
            );
          }
          return ListView.builder(
            itemCount: _dataList.length,
            shrinkWrap: true,
            physics: ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              final _item = RestaurantModel.fromMap(_dataList[index].toMap());
              return RestaurantItemWidget(
                dataItem: _item,
                onTap: () => controller.navToDetail(_item),
                iconOnpressed: () => controller.onPressedFavButton(_item),
                iconButton: Icon(
                  Icons.delete,
                  color: Colors.grey,
                ),
              );
            },
          );
        });
  }
}
