import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zakate/core/services/myservices.dart';

class AuthMiddlewareOnboarding extends GetMiddleware{
   MyServices myServices=Get.find();
  @override
  int? get priority => 1;
  @override
  RouteSettings? redirect(String? r){
    if(myServices.sharedPreferences.getString('isonboarding')=='true'){
      return const RouteSettings(name: '/login');
    }
  }
}