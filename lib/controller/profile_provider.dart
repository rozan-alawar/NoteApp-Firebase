import 'package:firebase_proj/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/models/user.dart';
import '../data/user_repository/firestore_db.dart';

class ProfileNotifier extends ChangeNotifier {
  final Ref ref;
  CustomeUser? user;
  ProfileNotifier({required this.ref});

  signedInUserData() async {
    final userID = await ref.watch(spServiceProvider).read('uid');

    debugPrint(userID);
    final user = await ref.watch(databaseProvider).user(userID);
    this.user = CustomeUser(
      uid: userID,
      name: user['name'],
      email: user['email'],
      phone: user['phone'],
    );

    notifyListeners();
  }
}

final profileProvider =
    ChangeNotifierProvider((ref) => ProfileNotifier(ref: ref));
