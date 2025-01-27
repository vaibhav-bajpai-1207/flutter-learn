import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notes_app/services/service_locator.dart';
import 'package:notes_app/services/storage_service/storage_service.dart';
import 'package:notes_app/utils/note_class.dart';

// <Note>[
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//           Note(
//             title: 'Task1',
//             body: 'Body for task 1',
//           ),
//         ]

class NotesListNotifier extends ValueNotifier<List<Note>> {
  final storageService = getIt<StorageService>();

  NotesListNotifier() : super(<Note>[]);

  List<Note> get notes => value;

  void loadNotes() async {
    var notesString = await storageService.getNotes();
    value = notesString != null ? notesFromJson(notesString) : <Note>[];
    notifyListeners();
  }

  List<Note> notesFromJson(String jsonString) {
    // Decode the JSON string into a List of Maps
    var decoded = jsonDecode(jsonString) as List;

    // Convert each Map into a Note object
    return decoded.map((noteMap) => Note.fromJson(noteMap)).toList();
  }

  List<Map<String, String>> notesToJson(List<Note> notes) {
    return notes.map((note) => note.toJson()).toList();
  }

  void saveToStorage() async {
    var temp = notesToJson(value);
    var notesJson = jsonEncode(temp);
    await storageService.saveNotes(notesJson);
  }

  void addNote(Note note) {
    value.insert(0, note);
    saveToStorage();
    notifyListeners();
  }

  void editNode(int index, Note note) {
    value[index] = note;
    saveToStorage();
    notifyListeners();
  }

  void deleteNodeAtIndex(int index) {
    value.removeAt(index);
    saveToStorage();
    notifyListeners();
  }
}
