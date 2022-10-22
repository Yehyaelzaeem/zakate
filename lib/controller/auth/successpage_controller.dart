import 'package:get/get.dart';

abstract class SuccessController extends GetxController{
  signin();
}
class SuccessControllerImp extends SuccessController{
  @override
  signin() {
    Get.back();
  }

}