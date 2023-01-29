import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.width = 380,
    this.height = 44,
    this.color,
  });
  final void Function()? onPressed;
  final Widget child;
  final double width;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width, height),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
          side: BorderSide(
            color: color == ColorManager.white
                ? ColorManager.grey
                : ColorManager.transarent,
          ),
        ),
      ),
      child: child,
    );
  }
}
