import 'package:flutter/material.dart';

import '../../featuers/login/presntiation/bloc/login_bloc.dart';
import 'color_manager.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {Key? key,
      required this.screen,
      required this.ontap,
      required this.title,
      required this.height,
      required this.width})
      : super(key: key);

  final Size screen;
  final String title;
  final double height;
  final double width;
  final void Function() ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        height: screen.height / height,
        width: screen.width / width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(screen.width / 5)),
          color: ColorManage.primery,
        ),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              color: ColorManage.white,
              fontWeight: FontWeight.w300,
              fontSize: screen.width / 18),
        )),
      ),
    );
  }
}
