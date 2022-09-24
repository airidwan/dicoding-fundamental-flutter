import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/widgets/btn_to_top_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:submission_restaurantapp/app/widgets/index.dart';

import 'restaurant_list_controller.dart';

class RestaurantListView extends GetView<RestaurantListController> {
  const RestaurantListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(context),
      floatingActionButton: Obx(() {
        return controller.appScroll.isShow.isFalse
            ? SizedBox.shrink()
            : BtnToTopWidget(
                onPressed: controller.appScroll.scrollToTop,
              );
      }),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      title: 'Restaurant List'.text.make(),
      centerTitle: true,
      actions: [
        IconButton(
          padding: EdgeInsets.zero,
          onPressed: controller.navToSearchView,
          icon: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshData,
      child: SingleChildScrollView(
        controller: controller.appScroll.scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: controller.obx(
            (state) => _buildContent(context),
            onLoading: Container(
              alignment: Alignment.center,
              height: Get.height * .8,
              child: Center(child: LoadingWidget()),
            ),
            onError: (error) => Container(
              alignment: Alignment.center,
              height: Get.height * .8,
              child: AppErrorWidget(message: error ?? ''),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return GetBuilder<RestaurantListController>(
      builder: ((_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHorizontal(),
            _buildListVertical(),
          ],
        );
      }),
    );
  }

  Widget _buildHorizontal() {
    final _dataList = controller.restoPopular;
    if (_dataList.isEmpty) return SizedBox.shrink();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        5.heightBox,
        'Recomendation'.text.bold.make(),
        10.heightBox,
        SizedBox(
          height: Get.height * .25,
          child: ListView.separated(
            itemCount: _dataList.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: ((context, index) => const Padding(padding: EdgeInsets.only(left: 16))),
            itemBuilder: ((context, index) {
              final _item = _dataList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: InkWell(
                      onTap: () => controller.navToDetail(context, _item),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: ImageNetworkWidget(
                          imageUrl: ApiKeys.urlImageSmall(_item.pictureId),
                          height: 150,
                          width: 200,
                        ),
                      ),
                    ),
                  ),
                  8.heightBox,
                  _item.name.text.size(12).fontWeight(FontWeight.w600).maxLines(2).overflow(TextOverflow.ellipsis).make(),
                  Row(children: [
                    AppRatingWidget(
                      rating: _item.rating,
                      itemSize: 18,
                    ),
                    5.widthBox,
                    '${_item.rating}'.text.sm.semiBold.make()
                  ]),
                ],
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildListVertical() {
    final _dataList = controller.data.value.data ?? [];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        'Semua'.text.bold.make(),
        ListView.builder(
          itemCount: _dataList.length,
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(vertical: 0),
          itemBuilder: (BuildContext context, int index) {
            final _item = _dataList[index];
            return RestaurantItemWidget(
              dataItem: _item,
              onTap: () => controller.navToDetail(context, _item),
              iconOnpressed: () => controller.onPressedFavButton(_item),
            );
          },
        ),
      ],
    );
  }
}
