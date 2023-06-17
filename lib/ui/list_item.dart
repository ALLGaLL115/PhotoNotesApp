import 'package:flutter/material.dart';

import '../models/note.dart';
import 'ui.dart';

class NoteWidget extends StatelessWidget {
  final Note note;
  const NoteWidget({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => NoteInfoPage(note: note),
        )),
        child: Container(
          height: 100,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey, blurRadius: 2, offset: Offset(0, 1))
              ],
              borderRadius: BorderRadius.circular(15)),
          child: Column(children: [
            Text(note.title),
            Text(note.description),
          ]),
        ),
      ),
    );
  }
}
