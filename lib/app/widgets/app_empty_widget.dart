import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';
import 'package:submission_restaurantapp/app/widgets/app_info_screen_widget.dart';

class AppEmptyWidget extends StatelessWidget {
  final String? message;
  const AppEmptyWidget({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AppInfoScreenWidget(
        msgInfo: message ?? 'Data tidak ditemukan',
        image: Assets.errorNodata,
      ),
    );
  }
}
