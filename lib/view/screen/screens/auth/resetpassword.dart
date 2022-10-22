import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/core/constant/images.dart';

import '../../../../controller/auth/resetpasswordcontroller.dart';
import '../../../../core/function/vaildata.dart';
import '../../../widget/auth/custombuttonAuth.dart';
import '../../../widget/auth/customtextfieldpassword.dart';
import '../../../widget/auth/customtitle.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller = Get.put(ResetPasswordControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: controller.formstate,
        child: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
          child: ListView(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.35,
                child: FittedBox(
                  child: Image.asset(
                    AppImages.resetpassword,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomTitle(
                title: 'Reset Password',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFieldPassword(
                validator: (val) {
              return validInput(val!, 6, 30, 'password');
                },
                mycontrollerpass: controller.password,
                hinttext: 'Enter New password',
                labletext: 'Password',
              ),
              const SizedBox(
                height: 30,
              ),
              CustomTextFieldPassword(
                validator: (val) {
              if(controller.password.text ==controller.newpassword.text){
                return validInput(val!, 6, 30, 'password');
              }
              else{
                return 'not confirm';
              }
                },
                mycontrollerpass: controller.newpassword,
                hinttext: 'Confirm new password',
                labletext: 'Confirm password',
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButtonAuth(
                onpressed: () {
                  controller.changepassword();
                },
                text: 'Submiting ...',
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
