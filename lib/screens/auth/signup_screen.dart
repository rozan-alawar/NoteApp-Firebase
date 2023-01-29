import 'package:firebase_proj/common_widget/button.dart';
import 'package:firebase_proj/common_widget/loading.dart';
import 'package:firebase_proj/common_widget/text_field.dart';
import 'package:firebase_proj/controller/auth_provider.dart';
import 'package:firebase_proj/utils/constants/validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/page_footer.dart';
import '../../common_widget/page_header.dart';
import '../../utils/constants/controllers.dart';
import '../../utils/styles/color_manager.dart';
import '../../utils/styles/values_manager.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final provider = ref.watch(authProvider);

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spaces.heightSpace(40),
                  const PageHeader(firstText: 'Sign', secondText: 'Up'),
                  Spaces.heightSpace(10),
                  const Text('Create new account'),
                  Spaces.heightSpace(20),
                  CommonTextField(
                      controller: nameController,
                      hintText: 'Full name',
                      validator: (value) =>
                          value!.isEmpty ? 'Enter correct name' : null),
                  Spaces.heightSpace(20),
                  CommonTextField(
                    controller: emailController,
                    hintText: 'email',
                    validator: (value) => Validations.validateEmail(value!),
                  ),
                  Spaces.heightSpace(20),
                  CommonTextField(
                    controller: phoneController,
                    hintText: 'Phone Number',
                    validator: (value) {
                      return value!.isEmpty ? 'Enter correct phone' : null;
                    },
                  ),
                  Spaces.heightSpace(25),
                  CommonTextField(
                    controller: passwordController,
                    isPassword: true,
                    hintText: 'password',
                    validator: (value) => Validations.passwordValidator(value!),
                  ),
                  Spaces.heightSpace(20),
                  CommonTextField(
                    isPassword: true,
                    controller: confirmPasswordController,
                    hintText: 'Confirm Password',
                    validator: (value) => Validations.confirmPassValidator(
                      value!.trim(),
                      passwordController.text.trim(),
                    ),
                  ),
                  Spaces.heightSpace(25),
                  Spaces.heightSpace(20),
                  AbsorbPointer(
                    absorbing: provider.isLoading,
                    child: CommonButton(
                      onPressed: () => provider.signUp(
                          email: emailController.text.trim(),
                          name: nameController.text.trim(),
                          phone: phoneController.text.trim(),
                          password: passwordController.text.trim(),
                          key: formKey),
                      color: ColorManager.lightBlack,
                      child: provider.isLoading
                          ? const Loading()
                          : const Text('Sign Up'),
                    ),
                  ),
                  const AspectRatio(aspectRatio: 8),
                  PageFooter(
                      firsText: 'have an account',
                      secondText: 'login',
                      onPressed: () {
                        ref.read(authProvider).toggleBetweenAuth();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
