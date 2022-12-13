import 'package:algostudio_flutter_test/app/widgets/cache_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

// ignore: use_key_in_widget_constructors
class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MimGenerator'),
        centerTitle: true,
      ),
      body: GetBuilder<HomeController>(
        builder: (_) {
          if (_.isFetching.isTrue) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (_.meme.memes!.isNotEmpty) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
              ),
              itemCount: _.meme.memes?.length,
              itemBuilder: (context, index) {
                var memes = _.meme.memes?[index];
                return Card(
                    color: Colors.amber,
                    child: CacheImage(
                      imageUrl: memes?.url ?? '-',
                    ));
              },
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
