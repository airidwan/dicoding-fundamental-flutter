import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';
import 'package:submission_restaurantapp/app/data/model/common_enum.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_detail/widgets/restaurant_desc_widget.dart';
import 'package:submission_restaurantapp/app/widgets/loading_view_widget.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:submission_restaurantapp/app/data/constants/api_keys.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_detail/widgets/restaurant_review_widget.dart';
import 'package:submission_restaurantapp/app/widgets/index.dart';

import 'restaurant_detail_controller.dart';
import 'widgets/restaurant_menus_widget.dart';

class RestaurantDetailView extends GetView<RestaurantDetailController> {
  const RestaurantDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: controller.refreshData,
      displacement: Get.height * .25,
      child: Scaffold(
        body: _buildBody(context),
        floatingActionButton: Obx(() {
          return controller.appScroll.isShow.isFalse && (controller.apiStatus.value == XStatus.success)
              ? FloatingActionButton.extended(
                  onPressed: () => controller.showInput(),
                  backgroundColor: AppColors.primaryColor,
                  label: 'Add Review'.text.make(),
                )
              : SizedBox.shrink();
        }),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return controller.obx(
      (state) => _buildContent(context),
      onLoading: LoadingWidget(),
      onError: (err) => AppErrorWidget(
        message: err ?? '',
        onPressed: () => controller.refreshData(),
      ),
      onEmpty: AppEmptyWidget(),
    );
  }

  Widget _buildContent(BuildContext context) {
    return GetBuilder<RestaurantDetailController>(
      builder: (_) {
        final data = controller.data.value;
        return CustomScrollView(
          controller: controller.appScroll.scrollController,
          slivers: [
            SliverLayoutBuilder(
              builder: (BuildContext context, constraints) {
                final scrolled = constraints.scrollOffset > 0;
                return SliverAppBar(
                  actions: [
                    IconButton(
                      onPressed: () => controller.onPressedFavButton(data),
                      icon: Icon(
                        data.isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.white,
                      ),
                    ),
                  ],
                  title: !scrolled ? null : data.name.text.make(),
                  automaticallyImplyLeading: scrolled,
                  expandedHeight: Get.height * .285,
                  pinned: true,
                  floating: false,
                  snap: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Hero(
                      tag: data.id,
                      child: ImageNetworkWidget(
                        imageUrl: ApiKeys.urlImageLarge(data.pictureId),
                        fit: BoxFit.fill,
                        // height: Get.height * .30,
                      ),
                    ),
                  ),
                );
              },
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  10.heightBox,
                  data.name.text.size(18).semiBold.make(),
                  5.heightBox,
                  IconTitleWidget(
                    iconData: Icons.location_on_outlined,
                    textTitle: data.city,
                  ),
                  5.heightBox,
                  '${data.address}'.text.sm.make(),
                  5.heightBox,
                  AppRatingWidget(rating: data.rating),
                  5.heightBox,
                  Row(children: [
                    'Category: '.text.sm.make(),
                    Wrap(
                      spacing: 5,
                      children: data.categories.map((e) => e.name.text.sm.make()).toList(),
                    ),
                  ]),
                ],
              ).pSymmetric(h: 10, v: 6),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  10.heightBox,
                  RestaurantDescWidget(data: data),
                  10.heightBox,
                  LoadingViewWidget(
                    status: controller.apiStatus.value,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RestaurantMenusWidget(),
                          5.heightBox,
                          RestaurantReviewWidget(datalist: data.customerReviews),
                        ],
                      ),
                    ),
                    onLoading: Container().skeleton(height: Get.height * .35),
                  ),
                  30.heightBox,
                ],
              ),
            ),
            // SliverFillRemaining(
            //   // hasScrollBody: true,
            //   // child: RestaurantReviewWidget(),
            // ),
          ],
        );
      },
    );
  }
}
