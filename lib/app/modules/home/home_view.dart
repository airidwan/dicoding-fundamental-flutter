import 'package:flutter/material.dart';

import 'package:get/get.dart';
// import 'package:getxbottombar/getxbottombar.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';
import 'package:submission_restaurantapp/app/data/constants/keys.dart';
import 'package:submission_restaurantapp/app/modules/profile/profile_view.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_favorites/restaurant_favorites_view.dart';
import 'package:submission_restaurantapp/app/modules/restaurant_list/restaurant_list_view.dart';
// import 'package:submission_restaurantapp/app/routes/app_pages.dart';
// import 'package:velocity_x/velocity_x.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      key: controller.scaffoldKey,
      child: Scaffold(
        body: _buildBody(),
        bottomNavigationBar: _buildNavBarItems(),
      ),
    );
  }

  PageView _buildBody() {
    return PageView(
      controller: controller.pageController,
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: controller.onTapPageIndex,
      children: [
        RestaurantListView(),
        ProfileView(),
        RestaurantFavoritesView(),
      ],
    );
  }

  Widget _buildNavBarItems() {
    return Obx(
      () {
        return BottomNavigationBar(
          backgroundColor: AppColors.backGroundColor,
          type: BottomNavigationBarType.fixed,
          elevation: 5,
          currentIndex: controller.selectedPageIndex.value,
          onTap: controller.onTapBottomNavBaar,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home, key: Keys.NAV_RESTAURANT),
              label: 'Restaurant',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person, key: Keys.NAV_PROFILE),
              label: 'Profile',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite, key: Keys.NAV_FAVORITES),
              label: 'Favorites',
            ),
          ],
        );
      },
    );
  }
}
