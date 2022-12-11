import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/color_manager.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key,
    required this.screen,
    required this.controller,
    required this.title
  }) : super(key: key);

  final Size screen;
  final TextEditingController controller;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screen.width / 1.1,
      child: DateTimePicker(
        style: TextStyle(
            color: ColorManage.primery, fontWeight: FontWeight.w500),
        controller: controller,
        type: DateTimePickerType.dateTime,
        validator: (value) {
          if (value!.isEmpty) return 'this field is requierd';
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.grey.shade300,
            filled: true,
            prefixIcon: Icon(
              Icons.date_range,
              color: ColorManage.primery,
            ),
            labelText: title,
            labelStyle  : TextStyle(
                color: ColorManage.primery,
                fontWeight: FontWeight.w500),
            errorStyle: TextStyle(
                color: ColorManage.second,
                fontWeight: FontWeight.w900),
            errorBorder: OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: ColorManage.second),
            )),
        firstDate: DateTime.now(),
        lastDate: DateTime(2100),
      ),
    );
  }
}
