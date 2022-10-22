import 'package:flutter/cupertino.dart';

class CustomRowPrayers extends StatelessWidget{
  String? title;
  String? time;
  CustomRowPrayers({super.key, required this.title,required this.time});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           SizedBox(
               width: 80,
               child: Text(title!)),
          const SizedBox(width:0,),
          const Text(':'),
          const SizedBox(width: 10,),
          Text(time!),
        ],
      ),
    );
  }
}