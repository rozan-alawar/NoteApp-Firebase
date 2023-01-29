import 'package:firebase_proj/common_widget/button.dart';
import 'package:firebase_proj/common_widget/loading.dart';
import 'package:firebase_proj/common_widget/text_field.dart';
import 'package:firebase_proj/controller/note_provider.dart';
import 'package:firebase_proj/utils/styles/color_manager.dart';
import 'package:firebase_proj/utils/styles/styles_manager.dart';
import 'package:firebase_proj/utils/styles/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/constants/controllers.dart';

class NewNote extends ConsumerWidget {
  const NewNote({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(noteProvider);
    final key = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Note'),
        actions: [
          const Icon(Icons.note_add_outlined),
          Spaces.widthSpace(20),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Spaces.heightSpace(20),
                Text(
                  'Note title',
                  style:
                      getSemiBoldStyle(color: ColorManager.black, fontSize: 18),
                ),
                Spaces.heightSpace(10),
                CommonTextField(
                  controller: titleController,
                ),
                Spaces.heightSpace(20),
                Text(
                  'Note content',
                  style:
                      getSemiBoldStyle(color: ColorManager.black, fontSize: 18),
                ),
                Spaces.heightSpace(10),
                CommonTextField(controller: contentController),
                Spaces.heightSpace(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Note color',
                      style: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: 18),
                    ),
                    // Spaces.widthSpace(10),
                    DropdownButton<int>(
                      value: provider.dropdownvalue,
                      // isExpanded: true,
                      items: provider.data
                          .map((e) => DropdownMenuItem<int>(
                                value: e,
                                child: CircleAvatar(
                                  backgroundColor: ColorManager.cardsColor[e],
                                  radius: 15,
                                ),
                              ))
                          .toList(),
                      onChanged: (value) => provider.selectedColor(value!),
                    ),
                  ],
                ),
                Spaces.heightSpace(20),
                AbsorbPointer(
                  absorbing: provider.isLoading,
                  child: CommonButton(
                    onPressed: () {
                      ref.read(noteProvider).addNewNote(
                          note_title: titleController.text,
                          note_content: contentController.text,
                          color: int.parse(colorController.text));
                    },
                    child: provider.isLoading
                        ? const Loading()
                        : const Text('Save'),
                  ),
                ),
                Spaces.heightSpace(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
