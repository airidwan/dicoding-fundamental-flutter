// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:submission_restaurantapp/app/data/middleware/global_middleware.dart';

import '../modules/home/home_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/login/login_binding.dart';
import '../modules/login/login_view.dart';
import '../modules/profile/profile_binding.dart';
import '../modules/profile/profile_view.dart';
import '../modules/restaurant_detail/restaurant_detail_binding.dart';
import '../modules/restaurant_detail/restaurant_detail_view.dart';
import '../modules/restaurant_favorites/restaurant_favorites_binding.dart';
import '../modules/restaurant_favorites/restaurant_favorites_view.dart';
import '../modules/restaurant_list/restaurant_list_binding.dart';
import '../modules/restaurant_list/restaurant_list_view.dart';
import '../modules/restaurant_search/restaurant_search_binding.dart';
import '../modules/restaurant_search/restaurant_search_view.dart';
import '../modules/splash_screen/splash_screen_binding.dart';
import '../modules/splash_screen/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.RESTAURANT_LIST,
      page: () => const RestaurantListView(),
      binding: RestaurantListBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      middlewares: [GlobalMiddleware()],
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_DETAIL,
      middlewares: [GlobalMiddleware()],
      page: () => const RestaurantDetailView(),
      binding: RestaurantDetailBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_FAVORITES,
      page: () => const RestaurantFavoritesView(),
      binding: RestaurantFavoritesBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.RESTAURANT_SEARCH,
      middlewares: [GlobalMiddleware()],
      page: () => const RestaurantSearchView(),
      binding: RestaurantSearchBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
