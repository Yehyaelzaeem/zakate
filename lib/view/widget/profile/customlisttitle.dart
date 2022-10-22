import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomListTitle extends StatelessWidget{
  String? title;
  IconData? icon;
  void Function()? onTap;

  CustomListTitle({super.key,
   required this.title,required this.icon,required this.onTap
});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          borderRadius: const BorderRadius.all(Radius.circular(20))
      ),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child:  ListTile(
        onTap: onTap,
        selectedColor: Colors.grey.shade100,
        leading:  Icon(icon,color: Colors.blue[600],),
        title: Text(title!,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue.shade900
          ),
        ),
        trailing:  Icon(Icons.arrow_forward_ios_rounded,color: Colors.black12,),
      ),
    );
  }
}