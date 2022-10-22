
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../../Controller/auth/eyeshowcontroller.dart';

class CustomTextFieldPassword extends StatelessWidget{
  TextEditingController? mycontrollerpass;
  String? hinttext;
  String? labletext;
  String? Function(String?)? validator;

  CustomTextFieldPassword({Key? key,required this.labletext,required this.validator,required this.hinttext, required this.mycontrollerpass}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    EyeContrroller contrroller=Get.put(EyeContrroller());
    return
      Container(
          margin: EdgeInsets.only(bottom: 0),
          alignment: Alignment.center,
          child: GetBuilder<EyeContrroller>(
            builder: (c) =>
                TextFormField(
              validator:validator ,
              controller: mycontrollerpass,
              textInputAction: TextInputAction.done,
              obscureText: !c.show1,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  prefixIcon:const Icon(Icons.lock) ,
                  label: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 9),
                    child: Text(labletext!),
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  hintStyle: TextStyle(fontSize: 14),
                  hintText: hinttext!,
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  suffixIcon: IconButton(
                      onPressed: () {
                        c.showeyes();
                      },
                      icon: Icon(
                        c.show1 == true ? Icons.visibility : Icons.visibility_off,
                        color: c.show1 == true ? Colors.blue : Colors.grey,
                      ))),
            ),
          ));

  }
}