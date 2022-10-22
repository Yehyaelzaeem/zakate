
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:zakate/controller/offline_controller.dart';
import 'package:learning_input_image/learning_input_image.dart';

import '../../../controller/test.dart';

class TextRecognitions extends StatelessWidget{

  Future<void> _startRecognition(InputImage image) async {

    TextRecognitionState state =Get.put(TextRecognitionState()) ;

    if (state.isNotProcessing) {
      state.startProcessing();
      state.image = image;
      state.data = await state.textRecognition?.process(image);
      state.stopProcessing();
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: InputCameraView(
            mode: InputCameraMode.gallery,
            // resolutionPreset: ResolutionPreset.high,
            title: 'Text Recognition',
            onImage: _startRecognition,
            overlay: GetBuilder<TextRecognitionState>(
              builder: (state) {
                if (state.isNotEmpty) {
                  return Center(
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      ),
                      child: Text(
                        state.text,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ),
        ),
      );
  }
}
