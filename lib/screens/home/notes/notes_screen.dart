import 'package:firebase_proj/common_widget/loading.dart';
import 'package:firebase_proj/screens/home/notes/new_note.dart';
import 'package:firebase_proj/screens/home/notes/note_card.dart';
import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:firebase_proj/utils/styles/font_manager.dart';
import 'package:firebase_proj/utils/styles/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/user_repository/note_db.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notes = ref.watch(databaseStreamProvider);
    return notes.map(
      data: (data) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your Recent Notes ',
              style: GoogleFonts.roboto(
                color: ColorManager.black,
                fontWeight: FontWeight.bold,
                fontSize: FontSize.s20,
              ),
            ),
            Spaces.heightSpace(20),
            Expanded(
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: notes.value!.size,
                itemBuilder: (context, index) =>
                    NoteCard(doc: data.value.docs[index]),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const NewNote(),
                      ));
                },
                label: const Text('New Note'),
                backgroundColor: ColorManager.primary,
              ),
            )
          ],
        ),
      ),
      error: (error) => const Text("ther's no Notes"),
      loading: (loading) => const Loading(),
    );
  }
}
