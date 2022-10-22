import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zakate/core/constant/images.dart';

class CustomButtomGoogle extends StatelessWidget{
  void Function()? ontap;
  CustomButtomGoogle({Key? key, required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0,bottom: 3.0),
      child: GestureDetector(
          onTap: ontap,
          child: Padding(
            padding: const EdgeInsets.only(right: 10.0,left: 10.0),
            child: Container(
              height: 45,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Image.asset(
                    'assets/s2.png',
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 15.0,
                  ),
                   FittedBox(
                    child: Text('log10'.tr,
                      style: const TextStyle(fontSize: 18,
                      fontWeight: FontWeight.w500
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
    );

  }

}