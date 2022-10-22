import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/view/screen/screens/auth/successpage.dart';

import '../../core/services/myservices.dart';
abstract class SignUpController extends GetxController{
  signup2();
  gotoLogin();
}
class SignUpControllerImp extends SignUpController{
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  MyServices myServices =Get.put(MyServices());

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  @override
  gotoLogin() {
   Get.back();
  }

  @override
  signup2()async {
    var formdata =formstate.currentState;
    username.text.trim();
    if(formdata!.validate()){
      try {
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email.text.trim(),
          password: password.text.trim(),
        );
         myServices.sharedPreferences.setString('username', username.text);
         myServices.sharedPreferences.setString('email', email.text);
         Get.off( SuccessPage(text: 'sc'.tr));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          Get.defaultDialog(
            content: const Center(
              child: Text('The password provided is too weak.'),
            )
          );
        } else if (e.code == 'email-already-in-use') {
          Get.defaultDialog(
              content: const Center(
                child: Text('The account already exists for that email.'),
              )
          );
        }
      } catch (e) {
        print(e);
      }
    }
    else{
      print('login not valid');

    }
  }

  @override
  void onInit() {
    username=TextEditingController();
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }


}