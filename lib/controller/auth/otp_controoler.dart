import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/screens/auth/resetpassword.dart';

abstract class OtpController extends GetxController{
  String? Vcode ;
  String? phone;
  gotoResetPassword();
}
class OtpControllerImp extends OtpController{
  @override
  gotoResetPassword() {
    print(Vcode);
    Get.off(const ResetPassword());
  }
  @override
  void onInit() {
    phone = Get.arguments['phone'];
    super.onInit();
  }


}