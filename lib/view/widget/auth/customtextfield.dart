import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  IconData? iconData;
  String? hintText;
  String? lableText;
  final bool isNumber;
  TextInputAction? textInputAction;
  TextEditingController? mycontroller;
  String? Function(String?)? validator;

  CustomTextField(
      {Key? key, required this.validator, required this.lableText,
        required this.mycontroller, required this.iconData,
        required this.hintText,
        required this.textInputAction, required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom:20),
      child: TextFormField(
        keyboardType: isNumber
            ? const TextInputType.numberWithOptions(decimal: true)
            : TextInputType.text,
        validator: validator,
        controller: mycontroller,
        textInputAction: textInputAction,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          label: Container(
            margin: EdgeInsets.symmetric(horizontal: 9),
            child: Text(lableText!),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 5),
          hintStyle: const TextStyle(fontSize: 14),
          hintText: hintText!,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          prefixIcon: Icon(iconData,size: 23,),
        ),

      ),
    );

  }

}
// Container(
// // height: 60,
// margin: EdgeInsets.symmetric(horizontal: 15),
// // decoration: BoxDecoration(
// //   borderRadius: BorderRadius.all(Radius.circular(20)),
// //   // border: Border.all(color: Colors.black,width: 1),
// //   color: Colors.grey.shade100
// // ),
// child: TextFormField(
// validator:validator ,
// textAlign: TextAlign.start,
// controller: mycontroller,
// textInputAction: textInputAction,
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.all(Radius.circular(20),),
//
// ),
// // border: InputBorder.none,
// hintStyle: TextStyle(color: Colors.grey.shade500,),
// hintText: hintText!,
// prefixIcon: Icon(iconData),
// ),
//
// ),
// );
