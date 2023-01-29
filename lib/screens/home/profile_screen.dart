import 'package:firebase_proj/common_widget/loading.dart';
import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:firebase_proj/utils/styles/font_manager.dart';
import 'package:firebase_proj/utils/styles/styles_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../controller/profile_provider.dart';
import '../../utils/styles/values_manager.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(profileProvider).signedInUserData();
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(profileProvider).user;
    return user == null
        ? const Loading()
        : Scaffold(
            appBar: AppBar(title: const Text('Note App')),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spaces.heightSpace(20),
                  const Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/user.png'),
                      backgroundColor: ColorManager.transarent,
                      radius: 50,
                    ),
                  ),
                  Spaces.heightSpace(20),
                  Text(
                    user.name.toString(),
                    style: getSemiBoldStyle(
                      color: ColorManager.black,
                      fontSize: FontSize.s18,
                    ),
                  ),
                  Spaces.heightSpace(40),
                  ListTile(
                    leading: const Icon(Icons.person),
                    title: Text(user.name.toString()),
                  ),
                  Spaces.heightSpace(20),
                  ListTile(
                    leading: const Icon(Icons.email),
                    title: Text(user.email.toString()),
                  ),
                  Spaces.heightSpace(20),
                  ListTile(
                    leading: const Icon(Icons.phone),
                    title: Text(user.phone.toString()),
                  )
                ],
              ),
            ),
          );
  }
}
