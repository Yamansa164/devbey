import 'package:devbey/core/resources/asset_manager.dart';
import 'package:devbey/core/resources/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../core/resources/color_manager.dart';

class LottieWidget extends StatelessWidget {
  LottieWidget(
      {super.key,
      this.buttonName = 'ok',
      required this.text,
      required this.lottie,
      required this.onPressed,
      required this.screen});
  final String text;

  String buttonName;
  final String lottie;
  final Size screen;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: screen.height / 7),
      child: Container(
        color: Colors.grey.shade100,
        height: screen.height / 3,
        width: screen.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Lottie.asset(lottie, height: screen.height / 6),
            Text(
              text,
              style: TextStyle(
                  fontSize: screen.height / 50,
                  color: ColorManage.primery,
                  letterSpacing: 3),
            ),
            lottie == AssetJsonManage.loading
                ? const SizedBox()
                : ButtonWidget(
                  color: ColorManage.primery,
                    height: 17,
                    width: 4,
                    ontap: onPressed,
                    title: buttonName,
                    screen: screen,
                  )
          ],
        ),
      ),
    );
  }
}
