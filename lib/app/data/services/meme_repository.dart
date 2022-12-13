import 'package:algostudio_flutter_test/app/data/models/meme.dart';

abstract class MemeRepositry {
  Future<Meme> getMeme();
}
