import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/core/services/myservices.dart';

import '../view/screen/screens/onlinerecording2.dart';

abstract class OnlineRecordingController extends GetxController{
  log();
  create();
}
class OnlineRecordingControllerImp extends OnlineRecordingController{
  late TextEditingController msname;
  late TextEditingController email;
  late TextEditingController password;
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  MyServices myServices=Get.find();
  @override
  void onInit() {
   msname=TextEditingController();
   email=TextEditingController();
   password=TextEditingController();
    super.onInit();
  }

  @override
  log() async{
    if(formstate.currentState!.validate()){
      var a1;
      var a2;
      CollectionReference x =FirebaseFirestore.instance.collection(msname.text.trim());
      var y =await x.get();
      y.docs.forEach((element) {
        a1=element['email'];
        a2=element['password'];
      });
      if(a1==email.text && a2==password.text){
        myServices.sharedPreferences.setString('mq', msname.text.trim());
        Get.snackbar(" Success login ", 'You can used your app now ',
          colorText: Colors.black,
          backgroundColor: Colors.blue[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 3000),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );
        Get.delete<OnlineRecordingControllerImp>();
        update();
        Get.to(OnlineRecording2());

      }else{
        Get.snackbar(" Not Valid email or password or not found ", 'You can try again ',
          colorText: Colors.black,
          backgroundColor: Colors.red[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 3000),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );

      }
    }
  }

  @override
  create() async{
    if(formstate.currentState!.validate()){
      var a1;
      var a2;
      CollectionReference x =FirebaseFirestore.instance.collection(msname.text.trim());
      var y =await x.get();
      y.docs.forEach((element) {
        a1=element['email'];
        a2=element['password'];
      });
      if(a1==null || a2==null){

        FirebaseFirestore.instance.collection(msname.text.trim()).add(<String,dynamic>{
          'email':email.text.trim(),
          'password':password.text.trim(),
        });
        Get.delete<OnlineRecordingControllerImp>();
        update();
        Get.snackbar(" Success creating account ....", 'You can log now ',
          colorText: Colors.black,
          backgroundColor: Colors.blue[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 3000),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );
      }else{
        Get.snackbar(" Not Valid email or password or this mosque is found ", 'You can try again ',
          colorText: Colors.black,
          backgroundColor: Colors.red[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 3000),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );

      }
    }
  }
}