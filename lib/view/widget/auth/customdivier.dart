import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDivier extends StatelessWidget{


  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.only(right: 25.0,left: 25.0,top: 15,bottom: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [
            const Expanded(
                flex:3,
                child: Divider(color: Colors.black38,thickness: 0.5,)),
            Expanded(
              flex:2,
              child:  Center(child: Text('log9'.tr)),),
            const Expanded(
                flex:3,
                child: Divider(color: Colors.black38,thickness: 0.5,)),

          ],
        ),
      );


  }
}