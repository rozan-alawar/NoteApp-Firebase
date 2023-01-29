import 'package:firebase_proj/common_widget/button.dart';
import 'package:firebase_proj/common_widget/loading.dart';
import 'package:firebase_proj/common_widget/text_field.dart';
import 'package:firebase_proj/controller/auth_provider.dart';
import 'package:firebase_proj/utils/extensions/validation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/styles/values_manager.dart';
import '../../common_widget/page_footer.dart';
import '../../common_widget/page_header.dart';
import '../../utils/constants/controllers.dart';
import '../../utils/constants/validations.dart';
import '../../utils/styles/color_manager.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginKey = GlobalKey<FormState>();
    final provider = ref.watch(authProvider);
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorManager.white,
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            height: 750,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p25),
              child: Form(
                key: loginKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Spaces.heightSpace(230),
                    const PageHeader(
                      firstText: 'Welcom ',
                      secondText: 'back! ',
                    ),
                    Spaces.heightSpace(AppSize.s20),
                    CommonTextField(
                      controller: emailController,
                      hintText: 'email',
                      validator: (value) =>
                          value!.isEmpty || !value.isValidEmail
                              ? 'Enter correct email'
                              : null,
                    ),
                    Spaces.heightSpace(AppSize.s12),
                    CommonTextField(
                      controller: passwordController,
                      isPassword: true,
                      hintText: 'password',
                      validator: (value) =>
                          Validations.passwordValidator(value!),
                    ),
                    Spaces.heightSpace(AppSize.s16),
                    Center(
                      child: AbsorbPointer(
                        absorbing: provider.isLoading,
                        child: CommonButton(
                          onPressed: () => provider.signIn(
                              emailController.text.trim(),
                              passwordController.text.trim(),
                              loginKey),
                          color: ColorManager.black,
                          child: provider.isLoading
                              ? const Loading()
                              : const Text('login'),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    PageFooter(
                        firsText: 'haven\'t an account',
                        secondText: 'Sign Up',
                        onPressed: () {
                          ref.read(authProvider).toggleBetweenAuth();
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
