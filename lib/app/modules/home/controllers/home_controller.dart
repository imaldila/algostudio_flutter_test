import 'package:algostudio_flutter_test/app/data/models/meme.dart';
import 'package:algostudio_flutter_test/app/data/services/meme_repository.dart';
import 'package:algostudio_flutter_test/app/data/services/meme_service.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final MemeRepositry _memeRepositry = MemeService();
  RxBool isFetching = false.obs;

  final _meme = <MemeElement>[].obs;
  List<MemeElement> get meme => _meme;

  @override
  void onInit() {
    getMemes();
    super.onInit();
  }

  @override
  void onClose() {}

  Future<void> getMemes() async {
    try {
      isFetching.value = true;
      var dataMeme = await _memeRepositry.getMeme();
      _meme.addAll(dataMeme.data!.memes!);
      isFetching.value = false;
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future onRefresh() async {
    try {
      isFetching.value = true;
      await Future.delayed(const Duration(seconds: 2));
      _meme.clear();
      getMemes();
      _meme.refresh();
      isFetching.value = false;
      update();
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
