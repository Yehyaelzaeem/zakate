import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/core/constant/images.dart';
import 'package:zakate/core/services/myservices.dart';

import '../../../../controller/auth/login_controller.dart';
import '../../../../core/function/alert.dart';
import '../../../../core/function/vaildata.dart';
import '../../../widget/auth/custombuttonAuth.dart';
import '../../../widget/auth/customdivier.dart';
import '../../../widget/auth/customloginwithgoogle.dart';
import '../../../widget/auth/customtextbutton.dart';
import '../../../widget/auth/customtextfield.dart';
import '../../../widget/auth/customtextfieldpassword.dart';
import '../../../widget/auth/customtitle.dart';
import '../home.dart';
class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyServices myServices =Get.find();
    var lan =myServices.sharedPreferences!.getString('lang');
    print(lan);
    LoginControllerImp controller=Get.put(LoginControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body:WillPopScope(
        onWillPop: ()=>alart(context) ,
        child:Form(key: controller.formstate,
          child: Padding(
            padding:  const EdgeInsets.only(right: 20,left: 20),
            child: ListView(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height:MediaQuery.of(context).size.height*0.35 ,
                  child: FittedBox(
                    child: Image.asset(
                      AppImages.loginimage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                    alignment: lan=='ar'? Alignment.topRight:Alignment.topLeft,
                    child: CustomTitle(title: 'log1'.tr,)),
                const SizedBox(height: 20,),
                CustomTextField(
                  textInputAction: TextInputAction.next,
                  iconData: Icons.alternate_email_outlined,
                  hintText: 'log3'.tr,
                  mycontroller: controller.email,
                  validator: (val) {
                    return validInput(val!,5,100,'email');
                  },
                  lableText: 'log2'.tr,
                  isNumber: false,),
                CustomTextFieldPassword(
                  validator: (val ) {
                    return validInput(val!, 6, 30, 'password');
                  },
                  mycontrollerpass:
                  controller.password,
                  hinttext: 'log5'.tr,
                  labletext: 'log4'.tr,
                ),

                CustomTextButtom(
                  text: 'log6'.tr,
                  onPressed: () {
                    controller.forgetpassword();
                  },
                  color:  Colors.blue[700],
                ),
                const SizedBox(height: 10,),
                CustomButtonAuth(onpressed: () {
                  controller.login();
                },
                  text: 'log7'.tr,),
                CustomDivier(),
                CustomButtomGoogle(ontap: () {
                controller.loginwithgoogle();

                },),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     Text("log8".tr,style:
                    const TextStyle(fontWeight: FontWeight.normal,
                        fontSize: 16
                    ),),
                    CustomTextButtom(text: 'log11'.tr,
                        color: Colors.blue[700],
                        onPressed: (){
                          controller.gotoSignUp();
                        }),
                  ],
                )
              ],
            ),
          ),
        ),

      )
    );
  }
}
