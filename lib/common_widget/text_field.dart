import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonTextField extends ConsumerWidget {
  const CommonTextField({
    super.key,
    required this.controller,
    this.hintText,
    this.isPassword = false,
    this.validator,
    this.prefix,
  });

  final String? hintText;
  final bool isPassword;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Widget? prefix;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      key: key,
      validator: validator,
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hintText,
      ),
    );
  }
}
