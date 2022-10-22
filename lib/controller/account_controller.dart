import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:get/get.dart';
import 'package:zakate/core/services/myservices.dart';
import 'package:zakate/view/screen/screens/auth/changeemail.dart';
import 'package:zakate/view/screen/screens/auth/login.dart';
import 'package:zakate/view/screen/screens/backend/changepassword.dart';
import '../core/constant/images.dart';
import '../core/function/vaildata.dart';
import '../view/screen/screens/auth/successpage.dart';
import '../view/widget/auth/customtextfieldpassword.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
abstract class AccountController extends GetxController{
  changeemail();
  gotochnageemail();
  gotochangepassword();
  getImageProfile();
  changelanguage();
  changetheme();
  signout();
  takePhoto();
  getusername();
  getemail();
  chick();
}
class AccountControllerImp extends AccountController{
  late TextEditingController password;
  late TextEditingController email;
  late TextEditingController newpassword;
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  MyServices myServices =Get.find();
  final imagePicker = ImagePicker();
  File? imageFile;
  bool x =false;
   String? imageprofile;
  late Uint8List bytes2;
  @override
  signout() {
    FirebaseAuth instance = FirebaseAuth.instance;
    instance.signOut();
    myServices.sharedPreferences.setString('islogin', 'false');
    Get.back();
    Get.off(const Login());
  }

  @override
  changeemail() {
    var formdata =formstate.currentState;
    if(formdata!.validate()) {
      User user = FirebaseAuth.instance.currentUser!;
      user.updateEmail(email.text).then((_) {
        Get.snackbar('Successfully changed email', 'You are welcome!',
          colorText: Colors.black,
          backgroundColor: Colors.blue[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 2500),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],


        );
        myServices.sharedPreferences.setString('email', email.text);
        Get.off(SuccessPage(text: 'changed email success',));
        Get.delete<AccountControllerImp>();


      }).catchError((error) {
        Get.snackbar("Email can't be changed", 'You can try again!',
          colorText: Colors.black,
          backgroundColor: Colors.blue[100],
          snackPosition: SnackPosition.TOP,
          duration: const Duration(milliseconds: 2500),
          borderRadius: 30,
          boxShadows: [const BoxShadow(color: Colors.black,
              spreadRadius: 2,
              blurRadius: 3,
              offset: Offset(-8.5, 1.0))
          ],

        );
        print("Password can't be changed" + error.toString());
      });
    }
  }

  @override
  changelanguage() {

  }



  @override
  void onInit() {
    chick();

    password=TextEditingController();
    email=TextEditingController();
    newpassword=TextEditingController();
    super.onInit();
  }

  @override
  changetheme() {
  //   if(Get.isDarkMode){
  //     Get.changeTheme(ThemeData.light());
  //   }else{
  //     Get.changeTheme(ThemeData.dark());
  //
  //   }
  }


  @override
  void gotochangepassword() async{
    Get.to(ChangePassword());
  }

  @override
  gotochnageemail() {
    Get.to(ChangeEmail());

  }

  Future<Uint8List> getImagefromGallry() async {
    var image = await imagePicker.getImage(source: ImageSource.gallery);
    imageFile = File(image!.path);
    final bytes = imageFile?.readAsBytesSync();
    String imageString = base64Encode(bytes!);
    myServices.sharedPreferences.setString('imageprofile1', imageString);
    update();
    return bytes;

  }


  @override
  getImageProfile() {
    imageprofile= myServices.sharedPreferences.getString('imageprofile1')!;
    bytes2 = base64Decode(imageprofile!);
    update();
  }
  @override
  takePhoto() async{
     await getImagefromGallry();
    await getImageProfile();
    chick();
  }

  @override
  getusername() {
    var user =myServices.sharedPreferences.getString('username');
    update();
    return user;
  }

  @override
  getemail() {
    var user_email =myServices.sharedPreferences.getString('email');
    update();
    return user_email;
  }

  @override
  chick() {
    if(myServices.sharedPreferences.getString('imageprofile1') !=null){
      getImageProfile();
      x=true;
      update();
      print('image not null');
    }else{
      x=false;
      update();
    }
  }


}