import 'package:flutter/material.dart';

class CustomOnlineTextField extends StatelessWidget {
  IconData? iconData;
  String? hintText;
  String? lableText;
  final bool isNumber;
  TextInputAction? textInputAction;
  TextEditingController? mycontroller;
  String? Function(String?)? validator;

  CustomOnlineTextField(
      {Key? key, required this.validator, required this.lableText,
        required this.mycontroller, required this.iconData,
        required this.hintText,
        required this.textInputAction, required this.isNumber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: const BoxDecoration(
          color: Colors.white12,
          borderRadius: BorderRadius.all(Radius.circular(20))),
          width: MediaQuery.of(context).size.width * 0.80,
        child: TextFormField(
          keyboardType: isNumber
              ? const TextInputType.numberWithOptions(decimal: true)
              : TextInputType.text,
          validator: validator,
          controller: mycontroller,
          textAlign: TextAlign.end,
          textInputAction: textInputAction,
          decoration: InputDecoration(
            isDense: true,
            border: const OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.white),
                borderRadius: BorderRadius.all(Radius.circular(20))
            ),
            label: Container(
              margin: const EdgeInsets.symmetric(horizontal: 9),
              child: Text(lableText!),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 7),
            hintStyle: const TextStyle(fontSize: 14,),
            hintText: hintText!,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: Icon(iconData),
          ),

        ),
    ),
      );

  }

}
// Container(
// child:
// TextFormField(
//
// decoration: InputDecoration(
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(20.0),
// borderSide: BorderSide(width: 1, color: Colors.white),
// ),
// labelText:
// "اسم المسجد                                                    ",
// suffixIcon: Icon(Icons.mosque),
// ),
// ),
// ),
