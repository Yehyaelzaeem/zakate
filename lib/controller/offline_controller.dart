

import 'dart:io';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:get/get.dart';
import 'package:learning_input_image/learning_input_image.dart';
import 'package:image_picker/image_picker.dart';

abstract class OfflineController extends GetxController{
  getimage();
  photo();
}
class OfflineControllerImp extends OfflineController{
  final imagePicker = ImagePicker();
  File? imageFile;
  String text ='love you baby';
  @override
  getimage() async{
    var image =await imagePicker.getImage(source: ImageSource.gallery);
    imageFile =File(image!.path);
    update();
  }

  @override
  photo() {
    print('yes');
    InputCameraView(
      canSwitchMode: false,
      mode: InputCameraMode.gallery,
      title: 'Text Recognition',
      onImage: (InputImage image) {
        // now we can feed the input image into text recognition process
      },
    );
  }

}