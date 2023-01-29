import 'package:firebase_proj/data/user_repository/firebase_repository.dart';
import 'package:firebase_proj/screens/auth/auth_screen.dart';
import 'package:firebase_proj/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//listen for auth changes
class WrapperScreen extends ConsumerWidget {
  const WrapperScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStreamProvider).value;
    print('user from wrapper ${user?.email}.');

    return user == null ? const AuthanticationScreen() : const HomeScreen();
  }
}
