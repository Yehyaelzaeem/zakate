
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Future<bool> alart(context){
  AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    closeIcon: const Icon(Icons.close_fullscreen_outlined),
    title: 'Warning',
    desc:
    'Are you sure you want to exit this app?',
    btnCancelOnPress: () {},
    onDismissCallback: (type) {
      debugPrint('Dialog Dismiss from callback $type');
      // Navigator.pop(context);
    },
    btnOkOnPress: () {
      exit(0);
    },
  ).show();
  return Future.value(true);
}