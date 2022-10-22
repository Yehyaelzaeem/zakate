import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/controller/OnlineRecordingController.dart';
import 'package:zakate/core/constant/images.dart';
import 'package:zakate/core/function/vaildata.dart';
import 'package:zakate/view/widget/auth/custombuttonAuth.dart';
import 'package:zakate/view/widget/auth/customtextfield.dart';

import '../../../controller/onlineRecording2Controller.dart';
import '../../widget/onlinerecording/customonlinetextfield.dart';

class OnlineRecording2 extends StatelessWidget{
  OnlineRecording2ControllerImp c=Get.put(OnlineRecording2ControllerImp());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
        GetBuilder<OnlineRecording2ControllerImp>(
          builder: (controller){
            return Form(
              key: controller.formstate,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    const SizedBox(height: 30,),
                    FittedBox(
                      child:
                      Image.asset(AppImages.personwriting)
                      ,
                    ),
                    const SizedBox(height: 20,),
                    controller.t==false?Center():
                    Center(
                      child: CustomOnlineTextField(
                          validator: (val){
                            return validInput(val!,5,50, 'person');
                          },
                          lableText: 'الاسم',
                          mycontroller: controller.name ,
                          iconData: Icons.perm_identity,
                          hintText: 'ادخل اسم الشخص ',
                          textInputAction: TextInputAction.next,
                          isNumber: false),
                    ),
                    const SizedBox(height: 0,),
                    Center(
                      child: CustomOnlineTextField(
                          validator: (val){
                            return validInput(val!,14,14, 'id');
                          },
                          lableText: 'الرقم القومي',
                          mycontroller: controller.id ,
                          iconData: Icons.ad_units,
                          hintText: 'ادخل الرقم القومى',
                          textInputAction: TextInputAction.search,
                          isNumber: true,

                      ),
                    ),
                    const SizedBox(height: 80,),
                    controller.t==false?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: CustomButtonAuth(
                          text: 'Search',
                          onpressed: (){
                            controller.searchbyID();
                          }),
                    ):
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: CustomButtonAuth(
                          text: 'Add Person',
                          onpressed: (){
                            controller.sentdata();
                          }),
                    ),
                    const SizedBox(height: 20),

                    controller.t==true?
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 28.0),
                      child: CustomButtonAuth(
                          text: 'Back',
                          onpressed: (){
                           controller.change();
                          }),
                    ):const SizedBox(height: 0,),
                    const SizedBox(height: 40)

                  ],
                ),
              ),
            );

          },
        )
    );
  }
}