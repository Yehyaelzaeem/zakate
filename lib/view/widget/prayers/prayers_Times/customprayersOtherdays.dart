import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'customcolum_prayersday.dart';


class CustomPrayersOthersday extends StatelessWidget{
  String? y1;
  String? y2;
  String? y3;
  String? y4;
  String? y5;
  String? y6;
  String? y7;
  String? date;
  CustomPrayersOthersday(
  {
    required this.date, required this.y1,required this.y2,required this.y3,required this.y4,
    required this.y5,required this.y6,required this.y7});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 05,bottom: 10),
      width: 140,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0,bottom: 8),
        child:
          Column(children: [
            Expanded(
                flex: 1,
                child: Text(date!,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue.shade900
                ),
                )),
            Expanded(
              flex: 6,
              child:CustomColumPrayers(
              x1: y1,
              x2: y2,
              x3: y3,
              x4: y4,
              x5: y5,
              x6: y6,
              x7: y7,
            ),
            )
          ],)
      ),
    );
  }
}