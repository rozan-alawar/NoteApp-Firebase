import 'package:firebase_proj/screens/home/notes/notes_screen.dart';
import 'package:firebase_proj/services/navigation_service.dart';
import 'package:firebase_proj/utils/routes/routes_const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../common_widget/drawer.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          title: const Text('Note App'),
          actions: [
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                ref.watch(navigationProvider).push(RouteConstant.profile);
              },
            )
          ],
        ),
        body: const NotesScreen(),
      ),
    );
  }
}
