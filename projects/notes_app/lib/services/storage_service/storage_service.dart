import 'package:notes_app/utils/note_class.dart';

abstract interface class StorageService {
  Future<String?> getNotes();
  Future<void> saveNotes(String notesJson);
}
