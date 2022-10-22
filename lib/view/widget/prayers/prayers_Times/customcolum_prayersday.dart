import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'customrow_oneprayer.dart';

class CustomColumPrayers extends StatelessWidget{
  String? x1;
  String? x2;
  String? x3;
  String? x4;
  String? x5;

  CustomColumPrayers(
  {
    required this.x1,required this.x2,required this.x3,required this.x4,
    required this.x5,required this.x6,required this.x7
});

  String? x6;
  String? x7;
  @override
  Widget build(BuildContext context) {
    return   FittedBox(
      child: Column(
        children: [
          CustomRowPrayers(
            title: 'pr2'.tr,
            time: x1,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr3'.tr,
            time:x2,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr4'.tr,
            time: x3,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr5'.tr,
            time: x4,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr6'.tr,
            time: x5,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr7'.tr,
            time: x6,
          ),
          Container(
              width: MediaQuery.of(context).size.width/3,
              child: const Divider(color: Colors.black45)),
          CustomRowPrayers(
            title: 'pr8'.tr,
            time:x7,
          ),
        ],
      ),
    );
  }
}