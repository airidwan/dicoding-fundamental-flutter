import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:submission_restaurantapp/app/data/model/index.dart';
import 'package:velocity_x/velocity_x.dart';

class RestaurantDescWidget extends StatelessWidget {
  final RestaurantModel data;

  const RestaurantDescWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          'Description'.text.bold.make(),
          ReadMoreText(
            data.description,
            style: TextStyle(fontSize: 12),
          ).pSymmetric(v: 6),
        ],
      ),
    );
  }
}
