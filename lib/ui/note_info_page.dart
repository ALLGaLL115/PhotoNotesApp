import 'package:flutter/material.dart';
import 'package:photo_cards/models/note.dart';

class NoteInfoPage extends StatelessWidget {
  final Note note;
  const NoteInfoPage({
    super.key, required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Column(children: [
              Text(note.title),
              Text(note.description),
              Image.file(note.image,)
              
            ]),
          ),
        ),
    );
    
  }
}