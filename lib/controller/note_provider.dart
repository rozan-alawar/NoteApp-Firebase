import 'package:firebase_proj/data/user_repository/note_db.dart';
import 'package:firebase_proj/services/navigation_service.dart';
import 'package:firebase_proj/utils/constants/controllers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteNotifier extends ChangeNotifier {
  final Ref ref;
  NoteNotifier({required this.ref});

  int dropdownvalue = 1;
  final data = [1, 2, 3, 4, 5, 6, 7, 8];
  bool isLoading = false;
  selectedColor(int color) {
    dropdownvalue = color;
    colorController.text = color.toString();
    notifyListeners();
  }

  addNewNote({
    required String note_title,
    required String note_content,
    required int color,
  }) async {
    isLoading = true;
    notifyListeners();
    await ref.watch(noteDbProvider).addNewNote(
        note_title: note_title, note_content: note_content, color: color);
    isLoading = false;
    ref.watch(navigationProvider).pop();
    notifyListeners();
  }
}

final noteProvider = ChangeNotifierProvider((ref) => NoteNotifier(ref: ref));
