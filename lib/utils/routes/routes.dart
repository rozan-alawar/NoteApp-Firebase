import 'package:firebase_proj/common_widget/error404_screen.dart';
import 'package:firebase_proj/screens/auth/login_screen.dart';
import 'package:firebase_proj/screens/auth/signup_screen.dart';
import 'package:firebase_proj/screens/home/profile_screen.dart';
import 'package:firebase_proj/screens/wrapper.dart';
import 'package:firebase_proj/utils/routes/routes_const.dart';
import 'package:flutter/material.dart';

import '../../screens/home/home_screen.dart';
import '../../screens/intro/splash_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoue(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstant.splash:
        return MaterialPageRoute(
          builder: (context) => const SplashScreen(),
        );

      case RouteConstant.home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case RouteConstant.login:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );

      case RouteConstant.signup:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
        );
      case RouteConstant.profile:
        return MaterialPageRoute(
          builder: (context) => const ProfileScreen(),
        );
      case RouteConstant.wrapper:
        return MaterialPageRoute(
          builder: (context) => const WrapperScreen(),
        );

      default:
        return MaterialPageRoute(
          builder: (context) => const ErrorScreen(),
        );
    }
  }
}
