import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:zakate/core/constant/images.dart';
import '../../../../controller/auth/otp_controoler.dart';

class Otp extends StatelessWidget{
  const Otp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OtpControllerImp controller=Get.put(OtpControllerImp());
    return Scaffold(
      backgroundColor: Colors.white,
      body:   SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: FittedBox(
                    child: Container(
                      margin: const EdgeInsets.only(top: 25),
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        AppImages.otpimage,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child:
                  Column(
                    children: [
                      const Text('Enter OTP',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35),
                      ),
                      const Text('An 5 digit code has been set to ',
                        style: TextStyle(fontSize: 18,height: 1.5),
                      ),
                      Text('+20 ${controller.phone.toString()} ',
                        style: TextStyle(fontSize: 18,height: 1.5,color: Colors.blue[400]),
                      )
                    ],
                  )),
              const SizedBox(height: 40,),
              Expanded(
                flex: 3,
                child:Container(
                  alignment: Alignment.topCenter,
                child: OtpTextField(
                  fieldWidth: 50,
                  borderRadius:const BorderRadius.all( Radius.circular(20)),
                  numberOfFields: 5,
                  borderColor: const Color(0xFF512DA8),
                  showFieldAsBox: true,
                  onCodeChanged: (String code) {
                  },
                  onSubmit: (String verificationCode){
                   controller.Vcode = verificationCode;
                   controller.gotoResetPassword();
                  }, // end onSubmit
                ),
               ),
              ),
              const SizedBox(height: 40,),
            ],
          ),
        ),
      ),
    );
  }
}