import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/core/constant/images.dart';
import '../../../../controller/auth/signup_controller.dart';
import '../../../../core/function/vaildata.dart';
import '../../../widget/auth/custombuttonAuth.dart';
import '../../../widget/auth/customtextbutton.dart';
import '../../../widget/auth/customtextfield.dart';
import '../../../widget/auth/customtextfieldpassword.dart';
import '../../../widget/auth/customtitle.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignUpControllerImp controller = Get.put(SignUpControllerImp());
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Form(
        key: controller.formstate,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 2,),
                SizedBox(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.width,
                  child: FittedBox(
                    child: Image.asset(
                     AppImages.signupimage2,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                CustomTitle(
                  title: 'sin1'.tr,
                ),
                const SizedBox(height: 10,),
                CustomTextField(
                  validator: (val) {
                  return validInput(val!, 6, 25, 'username');
                  },
                  textInputAction: TextInputAction.next,
                  iconData: Icons.person,
                  hintText: 'sin3'.tr,
                  mycontroller: controller.username,
                  lableText: 'sin2'.tr,
                  isNumber: false,

                ),
                const SizedBox(height: 10,),
                CustomTextField(
                  validator: (val) {
                    return validInput(val!,5, 100, 'email');
                  },
                  textInputAction: TextInputAction.next,
                  iconData: Icons.alternate_email_outlined,
                  hintText: 'sin5'.tr,
                  mycontroller: controller.email,
                  lableText: 'sin4'.tr,
                  isNumber: false,
                ),
                const SizedBox(height: 10,),
                CustomTextFieldPassword(
                  validator: (val ) {
                    return validInput(val!, 6, 30, 'password');
                  },
                  mycontrollerpass: controller.password,
                  hinttext: 'sin7'.tr,
                  labletext: 'sin6'.tr,
                ),
                 SizedBox(
                  height: Get.height/25,),
                CustomButtonAuth(
                  onpressed: () {
                    controller.signup2();
                  },
                  text: 'sin8'.tr,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text("sin9".tr,style:
                      const TextStyle(fontWeight: FontWeight.normal,
                          fontSize: 16
                      ),),
                      CustomTextButtom(
                          text: 'sin10'.tr,
                          color: Colors.blue[700],
                          onPressed: () {
                            controller.gotoLogin();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
