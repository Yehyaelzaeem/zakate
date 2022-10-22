import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/core/services/myservices.dart';
import '../../view/screen/screens/auth/forgetpassword.dart';
import '../../view/screen/screens/auth/signup.dart';
import '../../view/screen/screens/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
abstract class LoginController extends GetxController{
  login();
  loginwithgoogle();
  gotoSignUp();
  forgetpassword();
  bool isnotvalid =false;
}
class LoginControllerImp extends LoginController{
  GlobalKey<FormState> formstate =GlobalKey<FormState>();
  MyServices myServices =Get.find();
 late TextEditingController email;
 late TextEditingController password;


  @override
  login() async{
    var formdata =formstate.currentState;
    if(formdata!.validate()){
      try {
        final credential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email.text.trim(),
            password: password.text.trim()
        );
        myServices.sharedPreferences.setString('islogin', 'yes');
        myServices.sharedPreferences.setString('password',password.text.trim());
        myServices.sharedPreferences.setString('email',email.text);
        Get.to(Home());
        Get.delete<LoginControllerImp>();
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found') {
          Get.defaultDialog(
              content: const Center(
                child: Text('No user found for that email.'),
              )
          );
        } else if (e.code == 'wrong-password') {
          Get.defaultDialog(
              content: const Center(
                child: Text('Wrong password provided for that user.'),
              )
          );
        }
      }
      print('login valid');
    }
    else{
      print('login not valid');

    }
  }



  @override
  loginwithgoogle()async {
    UserCredential us = await signInWithGoogle();
    myServices.sharedPreferences.setString('islogin', 'yes');
    myServices.sharedPreferences.setString('username', '${us.user?.displayName}');
    myServices.sharedPreferences.setString('email', '${us.user?.email}');
    Get.to(Home());
    Get.delete<LoginControllerImp>();

  }

  @override
  gotoSignUp() {
   Get.to(const SignUp());
   Get.delete<LoginControllerImp>();

  }

  @override
  forgetpassword()async {
    String x ="yehyaelzaeem7@gmail.com";
  FirebaseAuth.instance.sendPasswordResetEmail(email: x.trim());

    print('sent = $x');
   // Get.to(const ForgetPassword());
   // Get.delete<LoginControllerImp>();
  }
  @override
  void onInit() {
    email=TextEditingController();
    password=TextEditingController();
    super.onInit();
  }
  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }





  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}