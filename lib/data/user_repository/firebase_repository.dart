import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_proj/data/models/user.dart';
import 'package:firebase_proj/data/user_repository/firestore_db.dart';
import 'package:firebase_proj/services/shared_preference.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/snackbar_services.dart';
import '../user_repository.dart';

class FirebaseUserRepository extends UserRepository {
  Ref ref;
  FirebaseUserRepository({required this.ref});

  final _auth = FirebaseAuth.instance;

  String? uid;

  Stream<CustomeUser?> get user {
    return _auth.userChanges().map((user) => _userFromFirebase(user));
  }

  CustomeUser? _userFromFirebase(User? user) {
    if (user != null) {
      return CustomeUser(
          uid: user.uid,
          name: user.displayName,
          email: user.email!,
          phone: user.phoneNumber);
    } else {
      return null;
    }
  }

  @override
  logOut() async {
    try {
      await _auth.signOut();
      ref.watch(spServiceProvider).clearData();
      return true;
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      return false;
    }
  }

  @override
  Future signIn(String email, String password) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      ref.watch(spServiceProvider).write('uid', user!.uid);

      return _userFromFirebase(user);
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      ref
          .watch(snackBarProvider)
          .showSnackBar(content: e.code, color: Colors.red);
      return null;
    }
  }

  @override
  Future signUp(
      {required String email,
      required String phone,
      required String name,
      required String password}) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      final user = result.user;
      ref.watch(spServiceProvider).write('uid', user!.uid);
      //add user data to fire store ...
      await ref
          .watch(databaseProvider)
          .addUser(uid: user.uid, name: name, email: email, phone: phone);
      return _userFromFirebase(user);
    } on FirebaseException catch (e) {
      debugPrint(e.code);
      ref
          .watch(snackBarProvider)
          .showSnackBar(content: e.code, color: Colors.red);
      return null;
    }
  }
}

final authRepoProvider =
    Provider<FirebaseUserRepository>((ref) => FirebaseUserRepository(ref: ref));

final authStreamProvider = StreamProvider<CustomeUser?>(
    (ref) => FirebaseUserRepository(ref: ref).user);
