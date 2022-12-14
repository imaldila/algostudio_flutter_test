import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailMemeController extends GetxController {
  late Rx<TextEditingController> textController;
  var textMemes = ''.obs;
  final textList = <String>[].obs;
  // List<String> get textList => _textList;
  RxDouble left = 0.0.obs;
  RxDouble top = 0.0.obs;

  @override
  void onInit() {
    textController = TextEditingController().obs;
    // textController.addListener(() {
    //   update();
    // });
    super.onInit();
  }

  @override
  void dispose() {
    textController.value.dispose();
    super.dispose();
  }

  void addText() {
    textList.add(textController.value.text);
    textList.refresh();
    Get.back();
    update();
  }

  void dragText(DragUpdateDetails details) {
    left.value = max(0, left.value + details.delta.dx);
    top.value = max(0, top.value + details.delta.dy);
  }
}
