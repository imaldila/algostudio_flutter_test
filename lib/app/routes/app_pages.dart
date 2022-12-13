import 'package:get/get.dart';

import '../modules/detail_meme/bindings/detail_meme_binding.dart';
import '../modules/detail_meme/views/detail_meme_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.detailMeme,
      page: () => const DetailMemeView(),
      binding: DetailMemeBinding(),
    ),
  ];
}
