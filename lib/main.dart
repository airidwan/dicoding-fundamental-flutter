import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/data/app_configs.dart';
import 'package:submission_restaurantapp/data/routes_nav.dart';
import 'package:submission_restaurantapp/view/home_view.dart';
import 'package:submission_restaurantapp/view/restaurant_detail_view.dart';
import 'package:submission_restaurantapp/data/restaurant_model.dart';
import 'package:submission_restaurantapp/view/splashscreen_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurants App',
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
      ),
      initialRoute: RoutesName.splashScreen,
      routes: {
        RoutesName.home: (context) => const HomeView(),
        RoutesName.splashScreen: (context) => const SplashscreenView(),
        RoutesName.restauranDetail: (context) => RestaurantDetailView(data: ModalRoute.of(context)?.settings.arguments as RestaurantModel),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/') {
          return MaterialPageRoute(
            builder: (context) => HomeView(),
            settings: settings,
          );
        }
      },
    );
  }
}
