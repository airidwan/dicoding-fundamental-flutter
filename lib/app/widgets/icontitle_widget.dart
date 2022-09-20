import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class IconTitleWidget extends StatelessWidget {
  final IconData iconData;
  final Color? iconColor, fontColor;
  final String textTitle;
  const IconTitleWidget({
    Key? key,
    required this.iconData,
    this.textTitle = '',
    this.iconColor,
    this.fontColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          iconData,
          size: 14,
          color: iconColor,
        ),
        5.widthBox,
        textTitle.text.sm.semiBold.color(fontColor).make(),
      ],
    );
  }
}
