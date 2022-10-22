import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/screen/screens/auth/successpage.dart';

abstract class ResetPasswordController extends GetxController{
  late TextEditingController password;
  late TextEditingController newpassword;
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  changepassword();
}
class ResetPasswordControllerImp extends ResetPasswordController{
  @override
  changepassword() {

    var formdata =formstate.currentState;
    if(formdata!.validate()){
      if(password.text ==newpassword.text){
        User user = FirebaseAuth.instance.currentUser!;
        user.updatePassword(password.text).then((_){
          Get.snackbar('Successfully changed password','You are welcome!',
            colorText: Colors.black,
            backgroundColor: Colors.blue[100],
            snackPosition: SnackPosition.TOP,
            duration:  const Duration(milliseconds: 1000),
            borderRadius:30,
            boxShadows: [const BoxShadow(color: Colors.black,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(-8.5,1.0))],

          );
          print("Successfully changed password");
        }).catchError((error){
          Get.snackbar("Password can't be changed",'You can try again!',
            colorText: Colors.black,
            backgroundColor: Colors.blue[100],
            snackPosition: SnackPosition.TOP,
            duration:  const Duration(milliseconds: 2000),
            borderRadius:30,
            boxShadows: [const BoxShadow(color: Colors.black,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(-8.5,1.0))],

          );
          print("Password can't be changed" + error.toString());
        });
        Get.off(SuccessPage(text: 'changed password success',));
      }
      else{
        return 'not confirm';
      }
    }else{
      print('error for password');
    }
  }
  @override
  void onInit() {
    password=TextEditingController();
    newpassword=TextEditingController();
    super.onInit();
  }

}