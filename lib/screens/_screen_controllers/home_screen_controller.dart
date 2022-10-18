// ignore_for_file: unnecessary_overrides

import 'package:caregigsworkabroad/utils/common_imports.dart';
import 'package:flutter/rendering.dart';

class HomeScreenController extends GetxController {
  RxDouble hContainer = 100.0.obs;
  RxBool showImage = false.obs;
  RxString imageString = ''.obs;
  ScrollController feedController = ScrollController();
  late ScrollDirection direction;
  final PageStorageBucket pageStorageBucket = PageStorageBucket();
  reduceHeight() {
    if (hContainer.value > 0) {
      hContainer(hContainer.value - 5);
    }
  }

  increaseHeight(int offset) {
    if (hContainer.value < 100 && offset < 150) {
      hContainer(hContainer.value + 5);
    }
  }

  scrollListener() {
    feedController.addListener(() {
      //   print(pixels);
      int pixels = feedController.position.pixels.toInt();

      if (direction == ScrollDirection.reverse) {
        reduceHeight();
      } else if (direction == ScrollDirection.forward) {
        increaseHeight(pixels);
        //  print(pixels);
        if (pixels == 0) {
          hContainer(100);
        }
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    scrollListener();
    super.onReady();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
