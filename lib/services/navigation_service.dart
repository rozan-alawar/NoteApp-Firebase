import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationService {
  final navigatorKey = GlobalKey<NavigatorState>();

  void push(String routeName) {
    navigatorKey.currentState!.pushNamed(routeName);
  }

  void pushReplacement(String routeName) {
    navigatorKey.currentState!.pushReplacementNamed(routeName);
  }

  void pop() {
    navigatorKey.currentState!.pop();
  }
}

final navigationProvider = Provider(
  (ref) => NavigationService(),
);
