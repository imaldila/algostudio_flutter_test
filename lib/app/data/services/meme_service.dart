import 'package:algostudio_flutter_test/app/data/models/meme.dart';
import 'package:algostudio_flutter_test/app/data/network/network_dio.dart';
import 'package:algostudio_flutter_test/app/data/services/meme_repository.dart';
import 'package:dio/dio.dart';

class MemeService extends MemeRepositry {
  Dio get _dio => NetworkDio.createDio();

  @override
  Future<Meme> getMeme() async {
    try {
      Response response = await _dio.get('/get_memes');
      return memeFromJson(response.data);
    } on DioError catch (e) {
      throw e.message;
    }
  }
}
