import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_proj/screens/home/notes/note_details.dart';
import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:firebase_proj/utils/styles/styles_manager.dart';
import 'package:firebase_proj/utils/styles/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NoteCard extends ConsumerWidget {
  const NoteCard({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteDetailsScreen(doc: doc),
          )),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: ColorManager.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              doc["note_title"],
              style: getBoldStyle(
                color: ColorManager.black,
                fontSize: 17,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Spaces.heightSpace(5),
            Text(
              doc["creation_date"],
              style: getMediumStyle(
                color: ColorManager.black,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            Spaces.heightSpace(20),
            Text(
              doc["note_content"],
              overflow: TextOverflow.ellipsis,
              style: getRegularStyle(
                color: ColorManager.black,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
