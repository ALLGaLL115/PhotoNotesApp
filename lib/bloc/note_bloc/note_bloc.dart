import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/note.dart';

part 'note_event.dart';
part 'note_state.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteState()) {
    on<AddNoteEvent>(_onAddNoteEvent);
    on<DeleteNoteEvent>(_onDeleteNoteEvent);
  }
  Future _onAddNoteEvent(AddNoteEvent event, Emitter<NoteState> emit) async {
    state.noteList.add(event.note);
    emit(state);
    
  }
  FutureOr<void> _onDeleteNoteEvent(DeleteNoteEvent event, Emitter<NoteState> emit) {
  }
}
