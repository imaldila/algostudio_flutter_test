import 'package:algostudio_flutter_test/app/widgets/cache_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[200],
        title: Text(
          'MimGenerator',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () => controller.onRefresh(),
        child: GetBuilder<HomeController>(
          builder: (_) {
            if (_.isFetching.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (_.meme.isNotEmpty) {
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: _.meme.length,
                itemBuilder: (context, index) {
                  var memes = _.meme[index];
                  return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.blueAccent,
                      child: CacheImage(
                        imageUrl: memes.url ?? '-',
                      ));
                },
              );
            } else {
              return Center(
                child: Text(
                  'Loading...',
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
