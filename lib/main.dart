import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_proj/screens/intro/splash_screen.dart';
import 'package:firebase_proj/services/navigation_service.dart';
import 'package:firebase_proj/services/shared_preference.dart';
import 'package:firebase_proj/services/snackbar_services.dart';
import 'package:firebase_proj/utils/routes/routes.dart';
import 'package:firebase_proj/utils/styles/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sheardPreferance = await SharedPreferences.getInstance();

  await Firebase.initializeApp();

  runApp(ProviderScope(
      overrides: [sharedPrefProvider.overrideWithValue(sheardPreferance)],
      child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lighTheme,
      onGenerateRoute: RouteGenerator.generateRoue,
      home: const SplashScreen(),
      navigatorKey: ref.watch(navigationProvider).navigatorKey,
      scaffoldMessengerKey: ref.watch(snackBarProvider).scaffoldMessengerKey,
    );
  }
}
