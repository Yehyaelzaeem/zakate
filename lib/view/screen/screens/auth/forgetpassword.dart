import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/core/constant/images.dart';

import '../../../../controller/auth/forgot_controller.dart';
import '../../../../core/function/vaildata.dart';
import '../../../widget/auth/custombuttonAuth.dart';
import '../../../widget/auth/customtextfield.dart';
import '../../../widget/auth/customtitle.dart';


class ForgetPassword extends StatelessWidget{
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ForgotControllerImp controller =Get.put(ForgotControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body:  Form(
        key: controller.formstate11,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
             const  SizedBox(height: 20,),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.4,
                width: MediaQuery.of(context).size.width,
                child: FittedBox(
                  child: Image.asset(
                   AppImages.forgetimage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              CustomTitle(title: '  Forgot Password?',),
              Container(
                margin: const EdgeInsets.only(left: 25),
                alignment: Alignment.topLeft,
                child: const FittedBox(
                  child:
                  Text("Don't worry! it happens. Please enter the \naddress associated with your account.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15,height: 1.5),
                  ),
                ),
              ),
              const  SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 15.0,right: 15),
                child: CustomTextField(
                  validator: (val) {
                    return validInput(val!, 5, 100, 'email');

                  },
                  iconData: Icons.attach_email,
                  textInputAction: TextInputAction.done,
                  mycontroller: controller.email,
                  hintText: 'Enter your email address',
                  lableText: 'Email',
                  isNumber: false,
                ),
              ),
              const  SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(right: 18.0,left: 18.0),
                child: CustomButtonAuth(onpressed: () {
                  controller.submit();
                }, text: 'Submit',),
              ),
              const  SizedBox(height: 10,)
            ],
          ),
        ),
      ),
    );
  }
}