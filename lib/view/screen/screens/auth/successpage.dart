import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/auth/successpage_controller.dart';
import '../../../widget/auth/custombuttonAuth.dart';

class SuccessPage extends StatelessWidget {
  String? text;

  SuccessPage({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    SuccessControllerImp controller =Get.put(SuccessControllerImp());
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.08,
              ),
                Center(
                  child: Text(
                'sc2'.tr,
                style: const TextStyle(
                    fontSize: 40,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              )),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Container(
                child: Icon(
                  Icons.check_circle_outline,
                  size: 200,
                  color: Colors.blue[500],
                ),
              ),
               SizedBox(height: 30,),
               FittedBox(
                child:  Text("${'sc3'.tr}${'sc1'.tr}${'sc4'.tr}",
                style: const TextStyle(fontSize: 18,
                  fontWeight: FontWeight.w500,height: 1.2,),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: Get.height/5,
              ),
              Container(
                child:
                CustomButtonAuth(text: 'sc5'.tr, onpressed: () {
                  controller.signin();
                },)
                ,
              )
            ],
          ),
        ),
      ),
    );
  }
}
