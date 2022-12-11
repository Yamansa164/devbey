import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {Key? key,
      required this.icon,
      required this.textInputType,
      required this.screen,
      required this.textEditingController,
      required this.validator,
      required this.hidden,
      required this.title})
      : super(key: key);

  final Size screen;
  final bool hidden;
  final String title;
  final IconData icon;
  final TextEditingController textEditingController;
  final TextInputType textInputType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screen.width / 20),
      child: TextFormField(
        obscureText: hidden,
        keyboardType:textInputType ,
        controller: textEditingController,
        validator: validator,
        style: TextStyle(color: ColorManage.primery),
        decoration: InputDecoration(
            fillColor: Colors.grey.shade100,
            filled: true,
            prefixIcon: Icon(icon),
            hintText: title,
            hintStyle: TextStyle(
                color: ColorManage.primery, fontWeight: FontWeight.w500),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(screen.width / 10),
            ),
            errorStyle:  TextStyle(color: ColorManage.second,fontWeight: FontWeight.w900),
            errorBorder: OutlineInputBorder(
              gapPadding: 0,
                borderSide: BorderSide(color: ColorManage.second),
                borderRadius: BorderRadius.circular(screen.width / 10))),
      ),
    );
  }
}
