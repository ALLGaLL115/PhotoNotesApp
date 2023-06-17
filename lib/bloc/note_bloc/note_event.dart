part of 'note_bloc.dart';

@immutable
abstract class NoteEvent {}

class AddNoteEvent extends NoteEvent{
  final Note note;

  AddNoteEvent(this.note);
}

class DeleteNoteEvent extends NoteEvent{}
