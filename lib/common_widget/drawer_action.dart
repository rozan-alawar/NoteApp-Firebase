import 'package:flutter/material.dart';

import '../utils/styles/color_manager.dart';

class DrawerAction extends StatelessWidget {
  const DrawerAction({
    Key? key,
    required this.iconData,
    required this.text,
    this.onTap,
  }) : super(key: key);
  final IconData iconData;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        iconData,
        color: ColorManager.primary,
      ),
      title: Text(
        text,
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
