import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget{
  String? title;

  CustomTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
       margin: const EdgeInsets.only(left: 8),
      child: FittedBox(
        child: Text(
          title!,
          style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.blueGrey[800]),
        ),
      ),
    );

  }
}