import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteDataBase {
  final instance = FirebaseFirestore.instance;

  final noteCollection = FirebaseFirestore.instance.collection('notes');

  Stream<QuerySnapshot> get notes {
    var notes = noteCollection.snapshots();
    return notes;
  }

  Future addNewNote({
    required String note_title,
    required String note_content,
    required int color,
  }) async {
    return await noteCollection.doc('${DateTime.now()}').set({
      'note_title': note_title,
      'note_content': note_content,
      'creation_date': DateTime.now().toString(),
      'color_id': color
    });
  }
}

final noteDbProvider = Provider((ref) => NoteDataBase());
final databaseStreamProvider = StreamProvider((ref) => NoteDataBase().notes);
