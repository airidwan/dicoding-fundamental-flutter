import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';
import 'package:submission_restaurantapp/app/widgets/app_info_screen_widget.dart';

class AppErrorWidget extends StatelessWidget {
  final String message;
  final VoidCallback? onPressed;
  const AppErrorWidget({Key? key, this.message = '', this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppInfoScreenWidget(
        msgInfo: message,
        image: Assets.errorNetwork,
        onPresed: onPressed,
      ),
    );
  }
}
