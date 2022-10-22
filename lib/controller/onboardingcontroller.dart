import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakate/core/services/myservices.dart';
import 'package:zakate/data/sourcedata/listmodel-onboarding.dart';

import '../view/screen/screens/auth/login.dart';
import '../view/screen/screens/home.dart';

abstract class OnboardingController extends GetxController{

  bool x =true;
  next();
  onchangepage(int i);
  changebackgroundcolor();
}
class OnboardingControllerImp extends OnboardingController{
  MyServices myServices=Get.find();
  late PageController pageController;
  @override
  next() {
   currentpage++;
   changebackgroundcolor();
   if(currentpage >onboardinglist.length-1){
     myServices.sharedPreferences.setString('isonboarding', 'true');
     Get.to(Login());
   }else{
     pageController.animateToPage(
         currentpage,
         duration: Duration(milliseconds: 500),
         curve: Curves.easeInOut);
   }
  }
  int currentpage=0;
  @override
  onchangepage(int i) {
   currentpage=i;
   changebackgroundcolor();
   print(currentpage);
   update();
  }
  @override
  void onInit() {
    changebackgroundcolor();
    pageController=PageController();
    super.onInit();
  }

  @override
  changebackgroundcolor() {
    if(currentpage==0){
      x=true;
    }else{
      x=false;
    }
  }


}