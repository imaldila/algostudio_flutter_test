import 'package:get/get.dart';

import '../controllers/detail_meme_controller.dart';

class DetailMemeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailMemeController>(
      () => DetailMemeController(),
    );
  }
}
