import 'package:flutter/material.dart';
import '../utils/styles/color_manager.dart';
import '../utils/styles/font_manager.dart';
import '../utils/styles/styles_manager.dart';

class PageHeader extends StatelessWidget {
  final String firstText;
  final String secondText;
  const PageHeader({
    required this.firstText,
    required this.secondText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: firstText,
        style: getMediumStyle(
          color: ColorManager.black,
          fontSize: FontSize.s40,
          fonFamily: FontConstants.roboto,
        ),
        children: [
          TextSpan(
            text: secondText,
            style: getMediumStyle(
                color: ColorManager.primary,
                fontSize: FontSize.s40,
                fonFamily: FontConstants.roboto),
          ),
        ],
      ),
    );
  }
}
