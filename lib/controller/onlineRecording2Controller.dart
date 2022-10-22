import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/controller/time_controller.dart';
import 'package:zakate/core/services/myservices.dart';

import '../core/function/getdate.dart';

abstract class OnlineRecording2Controller extends GetxController{
  sentdata();
  searchbyID();
}
class OnlineRecording2ControllerImp extends OnlineRecording2Controller{
  MyServices myServices =Get.find();
  TimesController controller =Get.find();
  // MyServices myServices =Get.put(MyServices());
  // TimesController controller =Get.put(TimesController());
  late TextEditingController id ;
  late TextEditingController name ;
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  bool t =false;
  @override
  sentdata() {
    if(formstate.currentState!.validate()){
      var x =myServices.sharedPreferences.getString('mq');
      var username =myServices.sharedPreferences.getString('username');
      var time =controller.time();
      CollectionReference c= FirebaseFirestore.instance.collection('$x').doc('AZunsDPK10nutnoy7mon').collection('data');
      c.add(<String,dynamic>{
        'name':name.text.trim(),
        'id':id.text.trim(),
        'time':time.trim(),
        "admin":username?.trim(),
        'date':date(),
      });
      Get.snackbar(" Success Save new person", 'Welcome!!',
        colorText: Colors.black,
        backgroundColor: Colors.blue[200],
        snackPosition: SnackPosition.TOP,
        duration: const Duration(milliseconds: 3000),
        borderRadius: 30,
        boxShadows: [const BoxShadow(color: Colors.black,
            spreadRadius: 2,
            blurRadius: 3,
            offset: Offset(-8.5, 1.0))
        ],
      );
      id.text='';
      name.text='';
      t=false;
      update();
    }

  }
  @override
  void onInit() {
     id=TextEditingController();
     name=TextEditingController();
     super.onInit();
  }
  change(){
    t=false;
    update();
  }

  @override
  searchbyID() async{
    if(formstate.currentState!.validate()){
      bool f =false;
      var x =myServices.sharedPreferences.getString('mq');
      CollectionReference collectionReference = FirebaseFirestore.instance.collection('$x').doc('AZunsDPK10nutnoy7mon').collection('data');
      var z =await collectionReference.get();
      for(var i in z.docs){
        if(id.text == i["id"]){
          Get.snackbar("sn1".tr, '${'sn2'.tr} \n Mr : ${i["name"]}\n id : ${i['id']} \n by admin : ${i['admin']} \n time : ${i['time']} \n date : ${i['date']}',
            colorText: Colors.black,
            backgroundColor: Colors.red[200],
            snackPosition: SnackPosition.TOP,
            duration: const Duration(milliseconds: 5000),
            borderRadius: 30,
            boxShadows: [const BoxShadow(color: Colors.black,
                spreadRadius: 2,
                blurRadius: 3,
                offset: Offset(-8.5, 1.0))
            ],

          );
          f=true;

          break;
        }
        else{

        }
      }
      if(f==false){
        Get.snackbar("sn3".tr, 'sn4'.tr,
          colorText: Colors.black,
          backgroundColor: Colors.blue[200],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 4000),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );
        t=true;
        update();
      }

    }
  }
  
}
