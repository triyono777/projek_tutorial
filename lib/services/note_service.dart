import 'package:get_storage/get_storage.dart';
import '../models/note_model.dart';

class NoteService {
  final _storage = GetStorage();

  List<Note> getNotes() {
    final notes = _storage.read('notes') ?? [];
    return notes.map<Note>((note) => Note.fromMap(note)).toList();
  }

  void addNote(Note note) {
    final notes = getNotes();
    notes.add(note);
    _storage.write('notes', notes.map((note) => note.toMap()).toList());
  }

  void updateNote(Note updatedNote) {
    final notes = getNotes();
    final index = notes.indexWhere((note) => note.id == updatedNote.id);
    if (index != -1) {
      notes[index] = updatedNote;
      _storage.write('notes', notes.map((note) => note.toMap()).toList());
    }
  }

  void deleteNote(int id) {
    final notes = getNotes();
    notes.removeWhere((note) => note.id == id);
    _storage.write('notes', notes.map((note) => note.toMap()).toList());
  }
}
