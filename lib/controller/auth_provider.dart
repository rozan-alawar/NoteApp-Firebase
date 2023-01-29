import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/user_repository/firebase_repository.dart';
import '../services/snackbar_services.dart';
import '../utils/styles/color_manager.dart';

class AuthNotifier extends ChangeNotifier {
  ChangeNotifierProviderRef ref;
  AuthNotifier({required this.ref});

  bool isLoading = false;
  bool showSignIn = true;
  String? uid;

  void toggleBetweenAuth() {
    showSignIn = !showSignIn;
    notifyListeners();
  }

  signIn(String email, String password, GlobalKey<FormState> key) async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final user = await ref.watch(authRepoProvider).signIn(email, password);

      isLoading = false;
      if (user != null) {
        ref.watch(snackBarProvider).showSnackBar(
            content: 'you Login successfuly :)', color: ColorManager.primary);
      }
      notifyListeners();
    }
  }

  signUp(
      {required String email,
      required String phone,
      required String name,
      required String password,
      required GlobalKey<FormState> key}) async {
    if (key.currentState!.validate()) {
      isLoading = true;
      notifyListeners();
      final user = await ref
          .watch(authRepoProvider)
          .signUp(email: email, name: name, password: password, phone: phone);
      isLoading = false;
      if (user != null) {
        ref.watch(snackBarProvider).showSnackBar(
            content: 'you create account successfuly:)',
            color: ColorManager.primary);
      }
      notifyListeners();
    }
  }

  logOut() {
    ref.watch(authRepoProvider).logOut();
    // print('logout $user');
    notifyListeners();
  }
}

final authProvider =
    ChangeNotifierProvider<AuthNotifier>((ref) => AuthNotifier(ref: ref));
