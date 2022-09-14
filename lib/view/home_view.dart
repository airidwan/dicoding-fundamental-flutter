import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/view/restaurant_list_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant List'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: RestaurantListView(),
    );
  }
}
