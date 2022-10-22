import 'package:flutter/material.dart';
class CustomButtonAuth extends StatelessWidget{
   String? text;
   void Function()? onpressed;

   CustomButtonAuth({Key? key, required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 3,bottom: 3),
      child: SizedBox(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: MaterialButton(
          onPressed:onpressed,
          textColor: Colors.white,
          color: Colors.blue[400],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
          child:  FittedBox(
            child: Text(
              text!,
              style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
          ),
        ),
      ),
    );

  }
}