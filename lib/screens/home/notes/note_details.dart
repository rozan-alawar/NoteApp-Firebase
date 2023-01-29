import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/styles/color_manager.dart';
import '../../../utils/styles/styles_manager.dart';
import '../../../utils/styles/values_manager.dart';

class NoteDetailsScreen extends ConsumerWidget {
  const NoteDetailsScreen({Key? key, required this.doc}) : super(key: key);
  final QueryDocumentSnapshot doc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: ColorManager.cardsColor[doc['color_id']],
      appBar: AppBar(
        title: Text(
          doc["note_title"],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Creation Date :',
            style: getSemiBoldStyle(
              color: ColorManager.black,
              fontSize: 20,
            ),
          ),
          Spaces.heightSpace(5),
          Text(
            doc["creation_date"],
            style: getMediumStyle(
              color: ColorManager.black,
              fontSize: 13,
            ),
          ),
          Spaces.heightSpace(20),
          Text(
            'Note Content :',
            style: getSemiBoldStyle(
              color: ColorManager.black,
              fontSize: 20,
            ),
          ),
          Spaces.heightSpace(5),
          Text(
            doc["note_content"],
            style: getRegularStyle(
              color: ColorManager.black,
            ),
          )
        ]),
      ),
    );
  }
}
