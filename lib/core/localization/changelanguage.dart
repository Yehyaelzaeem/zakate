import 'dart:ui';

import 'package:get/get.dart';

import '../services/myservices.dart';

class Changelang extends GetxController{
  MyServices myServices =Get.find();
  Locale? language;
   changelanguage(codelang){
    Locale locale =Locale(codelang);
    myServices.sharedPreferences!.setString('lang', codelang);
    Get.updateLocale(locale);
  }
  @override
  void onInit(){
    String? lan=myServices.sharedPreferences!.getString('lang');
    if(lan =='ar'){
      language = const Locale('ar');
    }else if(lan =='en'){
      language =const Locale('en');
    }else{
      language =Locale(Get.deviceLocale!.languageCode);
    }

  }

}