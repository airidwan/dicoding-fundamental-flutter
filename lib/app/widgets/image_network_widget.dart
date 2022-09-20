import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:submission_restaurantapp/app/data/constants/assets.gen.dart';

import 'loading_widget.dart';

class ImageNetworkWidget extends StatelessWidget {
  final String imageUrl;
  final Widget? loadingImage;
  final Widget? erroroWidget;
  final Widget? placeHolderWidget;
  final BoxFit fit;
  final double? height;
  final double? width;
  const ImageNetworkWidget({
    Key? key,
    this.imageUrl = '',
    this.loadingImage,
    this.erroroWidget,
    this.placeHolderWidget,
    this.fit = BoxFit.fill,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        fit: fit,
        width: width,
        height: height,
        progressIndicatorBuilder: (context, url, progress) => loadingImage ?? LoadingWidget(),
        errorWidget: (context, url, error) => erroroWidget ?? Assets.noImage.svg(),
      ),
    );
  }
}
