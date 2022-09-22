import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_search/widgets/search_input_widget.dart';

import 'restaurant_search_controller.dart';

class RestaurantSearchView extends GetView<RestaurantSearchController> {
  const RestaurantSearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody(context),
    );
  }

  AppBar _buildAppbar(BuildContext context) {
    return AppBar(
      title: SearchInputWidget(
        onSubmitted: controller.onSubmit,
        controller: controller.inputController,
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      elevation: 0.5,
    );
  }

  Widget _buildBody(BuildContext context) {
    return controller.obx(
      (state) => _buildContent(context),
      onLoading: Align(
        alignment: Alignment.center,
        child: LoadingWidget(),
      ),
      onEmpty: AppEmptyWidget(
        message: 'Data yang dicari tidak ditemukan',
      ),
      onError: (error) => Container(
        alignment: Alignment.center,
        child: AppErrorWidget(message: error ?? ''),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return GetBuilder<RestaurantSearchController>(
      builder: ((_) {
        final _dataList = controller.data.value.data ?? [];
        if (_dataList.isEmpty) return Container();
        return ListView.builder(
          itemCount: _dataList.length,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            final _item = _dataList[index];
            return RestaurantItemWidget(
              dataItem: _item,
              onTap: () => controller.navToDetail(_item),
              iconOnpressed: () => controller.onPressedFavButton(_item),
            );
          },
        );
      }),
    );
  }
}
