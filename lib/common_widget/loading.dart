import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends ConsumerWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: SpinKitCircle(
        color: ColorManager.lightPrimary,
        size: 50,
      ),
    );
  }
}
