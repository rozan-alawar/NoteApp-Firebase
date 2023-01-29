import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/auth_provider.dart';
import '../utils/styles/styles_manager.dart';
import '../utils/styles/values_manager.dart';
import 'drawer_action.dart';

class MyDrawer extends ConsumerWidget {
  const MyDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(authProvider);
    return Drawer(
      backgroundColor: ColorManager.lightGrey,
      elevation: 2,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Spaces.heightSpace(10),
          DrawerAction(
            text: 'Share',
            iconData: Icons.share,
            onTap: () => debugPrint('Share App'),
          ),
          Spaces.heightSpace(10),
          DrawerAction(
              onTap: () => AwesomeDialog(
                    context: context,
                    dialogType: DialogType.INFO,
                    animType: AnimType.RIGHSLIDE,
                    title: 'About us',
                    desc:
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                    btnOkText: 'Close',
                    btnOkColor: ColorManager.lightGrey,
                    buttonsTextStyle:
                        getSemiBoldStyle(color: ColorManager.primary),
                    btnOkOnPress: () {},
                  ).show(),
              text: 'About us',
              iconData: Icons.info_outline_rounded),
          Spaces.heightSpace(10),
          DrawerAction(
            text: 'Logout',
            iconData: Icons.logout_outlined,
            onTap: () => provider.logOut(),
          ),
        ],
      ),
    );
  }
}
