import 'package:notes_app/pages/notes_list_page/notifiers/notes_list_notifier.dart';
import 'package:notes_app/utils/note_class.dart';

class NotesListManager {
  final notesListNotifier = NotesListNotifier();

  List<Note> get notes => notesListNotifier.notes;

  void addNote(Note note) {
    notesListNotifier.addNote(note);
  }

  void deleteNodeAtIndex(int index) {
    notesListNotifier.deleteNodeAtIndex(index);
  }

  void editNode(int index, Note note) {
    notesListNotifier.notes[index] = note;
  }

  void loadNotes() {
    notesListNotifier.loadNotes();
  }
}
