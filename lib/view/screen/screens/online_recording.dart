import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/controller/onlineRecordingController.dart';
import 'package:zakate/core/function/vaildata.dart';
import 'package:zakate/view/widget/onlinerecording/customonlinetextfield.dart';

class OnlineRecording extends StatelessWidget{



  bool _load =false;

  date1() {
    final DateTime now = DateTime.now();
    return formatDate(now, [yyyy, '-', mm, '-', dd]);
  }

  time1() {
    final DateTime now = DateTime.now();
    return formatDate(now, [HH, ':', nn]);
  }

  @override
  Widget build(BuildContext context) {
    OnlineRecordingControllerImp controller =Get.put(OnlineRecordingControllerImp());
    return Scaffold(
      body:   Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Image.asset(
              "assets/m1.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Form(
              key: controller.formstate,
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height*0.30,),
                 GetBuilder<OnlineRecordingControllerImp>(builder: (c){
                   return
                     Container(
                     decoration: const BoxDecoration(
                       boxShadow: [BoxShadow(color: Colors.black26,blurRadius: 5)],
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                       color: Colors.white70,
                     ),
                     child: Column(
                       children: [
                         CustomOnlineTextField(
                             validator: (val){
                               return validInput(val!, 5,30, 'username');
                             },
                             lableText: 'op1'.tr,
                             mycontroller: c.msname,
                             iconData: Icons.mosque,
                             hintText: 'op2'.tr,
                             textInputAction: TextInputAction.next,
                             isNumber: false),
                         CustomOnlineTextField(
                             validator: (val){
                               return validInput(val!, 5, 100, 'email');
                             },
                             lableText: 'op3'.tr,
                             mycontroller: c.email,
                             iconData: Icons.email_outlined,
                             hintText: 'op4'.tr,
                             textInputAction: TextInputAction.next,
                             isNumber: false),
                         CustomOnlineTextField(
                             validator: (val){
                               return validInput(val!, 6, 15, 'password');
                             },
                             lableText: 'op5'.tr,
                             mycontroller: c.password,
                             iconData: Icons.security,
                             hintText: 'op6'.tr,
                             textInputAction: TextInputAction.done,
                             isNumber: true),

                       ],
                     ),
                   );

                 }),
                  const SizedBox(
                    height: 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: MaterialButton(
                            onPressed: () async {
                              controller.log();
                            },
                            color: Colors.green[300],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              //     side: BorderSide(color: Colors.white),
                            ),
                            child:  Text('op7'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),

                        Container(
                          width: MediaQuery.of(context).size.width * 0.60,
                          child: MaterialButton(
                            onPressed: () async {
                            controller.create();
                            },
                            color: Colors.green[300],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              //     side: BorderSide(color: Colors.white),
                            ),
                            child: Text('op8'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                          ),
                        ),

                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}