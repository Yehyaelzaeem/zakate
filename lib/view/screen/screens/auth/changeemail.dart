import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/controller/account_controller.dart';
import 'package:zakate/view/widget/auth/customtextfield.dart';

import '../../../../controller/auth/resetpasswordcontroller.dart';
import '../../../../core/constant/images.dart';
import '../../../../core/function/vaildata.dart';
import '../../../widget/auth/custombuttonAuth.dart';
import '../../../widget/auth/customtextfieldpassword.dart';
import '../../../widget/auth/customtitle.dart';

class ChangeEmail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    AccountControllerImp controller = Get.put(AccountControllerImp());
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
                    AppImages.signupimage2,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomTitle(
                title: 'Change Email',
              ),
              const SizedBox(
                height: 50,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 18.0,right: 18.0),
                child: CustomTextField(
                  validator: (val) {
                    return validInput(val!, 5, 100, 'email');
                  },
                  mycontroller: controller.email,
                  hintText: 'Enter Your New Email',
                  lableText: 'New Email',
                  iconData: Icons.email_outlined,
                  isNumber:false,
                  textInputAction: TextInputAction.done,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              CustomButtonAuth(
                onpressed: () {
                  controller.changeemail();
                },
                text: 'Save',
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