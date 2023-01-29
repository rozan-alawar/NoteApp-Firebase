import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_proj/data/models/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DatabaseService {
  // final _fireStore = FirebaseFirestore.instance;

  //collection reference
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('user');

  Future addUser(
      {required String uid,
      required String name,
      required String email,
      required String phone}) async {
    return userCollection
        .doc(uid)
        .set({'name': name, 'email': email, 'phone': phone});
  }

  List<CustomeUser> _userList(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (doc) => CustomeUser(
            uid: doc.id,
            name: doc['name'],
            email: doc.get('email'),
            phone: doc.get('phone'),
          ),
        )
        .toList();
  }

  user(String uid) async {
    var userData = await userCollection.doc(uid).get();
    return userData.data();
  }
}

final databaseProvider = Provider((ref) => DatabaseService());
