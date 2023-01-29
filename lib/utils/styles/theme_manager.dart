import 'package:firebase_proj/utils/styles/styles_manager.dart';
import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';
import 'values_manager.dart';

class AppTheme {
  static final lighTheme = ThemeData(
    scaffoldBackgroundColor: ColorManager.whiteSmoke,
    fontFamily: FontConstants.openSans,

/*_________________________________________________________________________________________________________
  ____________________________________________     APP BAR THEME      _____________________________________
  _________________________________________________________________________________________________________*/
    appBarTheme: AppBarTheme(
      toolbarHeight: 70,
      elevation: 5,
      titleTextStyle:
          getBoldStyle(color: ColorManager.white, fontSize: FontSize.s22),
      backgroundColor: ColorManager.primary,
      iconTheme: const IconThemeData(
        color: ColorManager.white,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
    ),

/*_________________________________________________________________________________________________________
  ____________________________________________     INPUT DECORATION   _____________________________________
  _________________________________________________________________________________________________________*/
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorManager.white,
      enabledBorder: textFieldBorder.copyWith(
        borderSide: const BorderSide(color: ColorManager.grey),
      ),
      border: textFieldBorder.copyWith(
        borderSide: const BorderSide(color: ColorManager.lightBlack),
      ),
      focusedBorder: textFieldBorder,
      hintStyle: const TextStyle(
        color: ColorManager.grey,
      ),
    ),
/*_________________________________________________________________________________________________________
  ____________________________________________    ELEVATED BUTTON     _____________________________________
  _________________________________________________________________________________________________________*/
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ColorManager.primary,
        textStyle: getSemiBoldStyle(
          color: ColorManager.white,
          fontSize: FontSize.s20,
        ),
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: ColorManager.white.withOpacity(0.8),
    ),

/*_________________________________________________________________________________________________________
  ____________________________________________       TEXT THEME       _____________________________________
  _________________________________________________________________________________________________________*/
    textTheme: TextTheme(
        headline1: getBoldStyle(color: ColorManager.black),
        headline3: getSemiBoldStyle(
          fontSize: FontSize.s18,
          color: ColorManager.black,
        ),
        headline6: getRegularStyle(
          color: ColorManager.black,
          fontSize: FontSize.s16,
        )),

/*_________________________________________________________________________________________________________
  ____________________________________________     APP BAR THEME      _____________________________________
  _________________________________________________________________________________________________________*/

    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      // backgroundColor: ColorManager.teal,
      foregroundColor: ColorManager.white,
    ),
    //--------------------------------- bottom sheet theme ----------------------------------
    bottomSheetTheme:
        const BottomSheetThemeData(backgroundColor: ColorManager.white),

    //--------------------------------- card theme ----------------------------------

    cardTheme: const CardTheme(
      elevation: 5,
    ),
    //--------------------------------- listTile theme ----------------------------------

    listTileTheme: ListTileThemeData(
      iconColor: ColorManager.primary,
      tileColor: ColorManager.lightGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    //--------------------------------- dialog theme ----------------------------------

    dialogTheme: DialogTheme(
      backgroundColor: ColorManager.white,
      titleTextStyle: getSemiBoldStyle(
        color: ColorManager.black,
      ),
    ),
    //--------------------------------- checkbox theme ----------------------------------
    checkboxTheme: const CheckboxThemeData(
        // fillColor: MaterialStateProperty.all(ColorManager.teal),
        ),
    //--------------------------------- drawer theme ----------------------------------
    drawerTheme: DrawerThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      width: 200,
      backgroundColor: ColorManager.white,
    ),
  );
}

final textFieldBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(AppSize.s12),
  borderSide: const BorderSide(
    color: ColorManager.grey,
  ),
);
