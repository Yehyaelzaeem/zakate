import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/screens/auth/otp.dart';

abstract class ForgotController extends GetxController{
  submit();
  GlobalKey<FormState> formstate11 =GlobalKey<FormState>();

}
class ForgotControllerImp extends ForgotController{
  late TextEditingController email;
  @override
  submit()async {
    var formdata =formstate11.currentState;
    if(formdata!.validate()){
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email.text.trim());
      print(email.text);
    }
    else{
     print('error forgotpassword');
    }

  }

  @override
  void onInit() {
    email =TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    super.dispose();
  }


}