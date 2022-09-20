import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AppScrollController extends GetxController {
  ScrollController scrollController = ScrollController();
  final isShow = false.obs;

  @override
  void onInit() {
    super.onInit();
    setScrollListener();
  }

  @override
  void onClose() {
    super.onClose();
    scrollController.removeListener(setScrollListener);
  }

  setScrollListener() {
    scrollController = ScrollController()
      ..addListener(() {
        final _direction = scrollController.position.userScrollDirection;
        if (_direction == ScrollDirection.forward) {
          isShow(true);
        } else if (_direction == ScrollDirection.reverse) {
          isShow(false);
        }
      });
  }

  scrollToTop() async {
    await scrollController.animateTo(0, duration: Duration(milliseconds: 300), curve: Curves.easeOut);
    isShow(false);
  }
}
