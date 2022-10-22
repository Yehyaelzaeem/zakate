import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/services/myservices.dart';

class AuthMiddlewareLogin extends GetMiddleware{
  MyServices myServices=Get.find();
  @override
  int? get priority => 2;
  @override
  RouteSettings? redirect(String? route){
    if(myServices.sharedPreferences.getString('islogin')=='yes'){
     return RouteSettings(name: '/home');
    }
  }
}