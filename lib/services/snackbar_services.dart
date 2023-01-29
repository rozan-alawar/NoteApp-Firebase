import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/styles/color_manager.dart';

class ScaffoldMessangerServices {
  final scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  void showSnackBar(
      {required String content, Color color = ColorManager.grey}) {
    scaffoldMessengerKey.currentState!.showSnackBar(
      SnackBar(
        content: Text(content),
        backgroundColor: color,
        shape: const StadiumBorder(),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
}

final snackBarProvider = Provider((ref) => ScaffoldMessangerServices());
