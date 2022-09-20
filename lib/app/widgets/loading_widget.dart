import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';

class LoadingWidget extends StatelessWidget {
  final double width;
  final double height;
  final double strokeWidth;
  const LoadingWidget({
    Key? key,
    this.width = 60,
    this.height = 60,
    this.strokeWidth = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            CircleAvatar(
              backgroundImage: Assets.icon.image().image,
            ),
            SizedBox(
              width: width,
              height: height,
              child: CircularProgressIndicator(strokeWidth: strokeWidth),
            ),
          ],
        ),
      ),
    );
  }
}
