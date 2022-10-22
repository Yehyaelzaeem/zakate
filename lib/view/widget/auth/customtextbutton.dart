import 'package:flutter/material.dart';

class CustomTextButtom extends StatelessWidget{
  String? text;
  Color? color;
  void Function()? onPressed;

  CustomTextButtom({Key? key, required this.text, required this.color,required  this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: FittedBox(
          child: Text(text!,style:
          TextStyle(fontWeight: FontWeight.bold,
              color: color,
              fontSize: 16
          ),
          ),
        ),
      ),
    );

  }
}