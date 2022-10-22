import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:zakate/controller/middleware/middlewarelogin.dart';
import 'package:zakate/core/localization/changelanguage.dart';
import 'package:zakate/view/screen/onboarding.dart';
import 'package:zakate/view/screen/screens/auth/changeemail.dart';
import 'package:zakate/view/screen/screens/auth/login.dart';
import 'package:zakate/view/screen/screens/auth/signup.dart';
import 'package:zakate/view/screen/screens/home.dart';
import 'package:get/get.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'controller/middleware/middlewareonboarding.dart';
import 'core/localization/translatios.dart';
import 'core/services/myservices.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await initialServices();
  runApp(DevicePreview(
      enabled: false,
      builder:(context)=>  const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    Changelang c =Get.put(Changelang());
    return GetMaterialApp(
      locale:c.language,
      translations: Translation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     initialRoute: '/',
     getPages: [
       // GetPage(name: '/', page: ()=>Login()),
       GetPage(name: '/', page: ()=>Onboarding(),middlewares:[ AuthMiddlewareOnboarding(),]),
       GetPage(name: '/login', page: ()=>const Login(),middlewares: [AuthMiddlewareLogin()]),
       GetPage(name: '/home', page: ()=>Home()),
     ],
    );
  }
}
