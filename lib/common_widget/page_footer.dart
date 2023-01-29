import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';
import '../utils/styles/styles_manager.dart';

class PageFooter extends StatelessWidget {
  const PageFooter(
      {Key? key,
      required this.firsText,
      required this.secondText,
      required this.onPressed})
      : super(key: key);

  final String firsText;
  final String secondText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firsText,
          style: getSemiBoldStyle(color: ColorManager.grey),
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            secondText,
            style: getSemiBoldStyle(color: ColorManager.primary),
          ),
        )
      ],
    );
  }
}
