import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';
import 'package:velocity_x/velocity_x.dart';

class AppRatingWidget extends StatelessWidget {
  final double rating;
  final double itemSize;
  const AppRatingWidget({Key? key, required this.rating, this.itemSize = 18.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxRating(
      onRatingUpdate: (_) {},
      size: itemSize,
      count: 5,
      value: rating,
      normalColor: Colors.orange.shade100,
      selectionColor: AppColors.lightOrange,
      maxRating: 5,
    );
   
  }
}
