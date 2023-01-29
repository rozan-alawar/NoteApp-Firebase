import 'dart:convert';

class Note {
  final String title;
  final String content;
  final String creationDate;
  final int color;

  Note({
    required this.title,
    required this.content,
    required this.creationDate,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'content': content,
      'creationDate': creationDate,
      'color': color,
    };
  }

  factory Note.fromJson(Map<String, dynamic> map) {
    return Note(
      title: map['note_title'],
      content: map['note_content'],
      creationDate: map['creation_date'],
      color: map['color_id'],
    );
  }

  String toJson() => json.encode(toMap());
}
