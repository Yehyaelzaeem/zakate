import 'package:get/get.dart';
import 'package:learning_text_recognition/learning_text_recognition.dart';
import 'package:learning_input_image/learning_input_image.dart';

class TextRecognitionState extends GetxController {
  InputImage? _image;
  RecognizedText? _data;
  bool _isProcessing = false;
  TextRecognition? textRecognition = TextRecognition();

  InputImage? get image => _image;
  RecognizedText? get data => _data;
  String get text => _data!.text;
  bool get isNotProcessing => !_isProcessing;
  bool get isNotEmpty => _data != null && text.isNotEmpty;

  void startProcessing() {
    _isProcessing = true;
    update();
  }
  @override
  void dispose() {
    textRecognition?.dispose();
    super.dispose();
  }

  void stopProcessing() {
    _isProcessing = false;
    update();
  }

  set image(InputImage? image) {
    _image = image;
    update();
  }

  set data(RecognizedText? data) {
    _data = data;
    update();
  }
}