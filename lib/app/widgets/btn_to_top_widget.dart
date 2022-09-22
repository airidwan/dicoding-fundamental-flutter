import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/configs/app_configs.dart';

class BtnToTopWidget extends StatelessWidget {
  final VoidCallback onPressed;
  const BtnToTopWidget({Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      mini: true,
      backgroundColor: AppColors.primaryColor,
      child: Center(
        child: Icon(Icons.keyboard_arrow_up),
      ),
    );
  }
}
