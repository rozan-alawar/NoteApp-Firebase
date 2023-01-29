import 'package:firebase_proj/controller/auth_provider.dart';
import 'package:firebase_proj/screens/auth/login_screen.dart';
import 'package:firebase_proj/screens/auth/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthanticationScreen extends ConsumerWidget {
  const AuthanticationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);
    return auth.showSignIn ? const LoginScreen() : const SignUpScreen();
  }
}
