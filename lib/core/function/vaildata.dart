import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

validInput(String val ,int min , int max ,String type){
  if(val.isEmpty){
    return "Can't be Empty";
  }
  if(type =='username'){
    if(!GetUtils.isUsername(val.trim())){
      return'not valid username';

    }
  }
  if(type =='email'){
    if(!GetUtils.isEmail(val.trim())){
      return'not valid email';
    }
  }
  if(type =='phone'){
    if(!GetUtils.isPhoneNumber(val.trim())){
      return 'not valid phone number';
    }
  }
  if(type =='id'){
    if(!GetUtils.isNum((val.trim()))){
      return 'not valid id number';
    }
  }
  if(type =='person'){

  }

  if(val.length > max){
    return "Can't be large than $max";
  }
  if(val.length < min){
    return "Can't be less than $min";
  }

}