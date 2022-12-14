import 'package:algostudio_flutter_test/app/data/models/meme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/detail_meme_controller.dart';

class DetailMemeView extends GetView<DetailMemeController> {
  const DetailMemeView({super.key});

  @override
  Widget build(BuildContext context) {
    MemeElement memes = Get.arguments;
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
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            SizedBox(
              // height: Get.height,
              width: Get.width,
              child: Image.network(memes.url!),
            ),

            ...List.generate(
              controller.textList.length,
              (index) => DragTarget<String>(
                onAccept: (data) => controller.textList[index] = data,
                builder: (context, __, ___) => SizedBox(
                  // color: Colors.blue,
                  height: Get.height,
                  width: Get.width,
                  child: Text(
                    __.isNotEmpty ? controller.textList[index] : '',
                  ),
                ),
              ),
            ),
            ...List.generate(
              controller.textList.length,
              (i) => Obx(
                () => Positioned(
                  top: controller.top.value,
                  left: controller.left.value,
                  child: GestureDetector(
                    onPanUpdate: (details) => controller.dragText(details),
                    child: Text(
                      controller.textList[i],
                    ),
                  ),
                ),
              ),
            ),
            // ...List.generate(
            //   controller.textList.length,
            //   (index) => Obx(
            //     () => Positioned(
            //       bottom: 100,
            //       left: 26,
            //       child: Draggable(
            //         data: controller.textList[index],
            //         feedback: Container(
            //           padding: const EdgeInsets.all(4),
            //           child: Text(
            //             controller.textList[index],
            //           ),
            //         ),
            //         onDraggableCanceled: (velocity, offset) {},
            //         child: Container(
            //           padding: const EdgeInsets.all(4),
            //           child: Text(
            //             controller.textList[index],
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            Positioned(
              bottom: 22,
              left: 22,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Logo',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const Icon(
                          Icons.image,
                          // size: 28,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  InkWell(
                    onTap: () {
                      Get.defaultDialog(
                        content: Column(
                          children: [
                            Obx(() => TextFormField(
                                  controller: controller.textController.value,
                                )),
                          ],
                        ),
                        confirm: ElevatedButton(
                          onPressed: () => controller.addText(),
                          child: const Text('OK'),
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Add Text',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'T',
                          style: GoogleFonts.poppins(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
