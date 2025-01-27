import 'package:flutter/material.dart';
import 'package:notes_app/utils/note_class.dart';

class NotesListNotifier extends ValueNotifier<List<Note>> {
  NotesListNotifier()
      : super(<Note>[
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
          Note(
            title: 'Task1',
            body: 'Body for task 1',
          ),
        ]);

  List<Note> get notes => value;

  void addNote(Note note) {
    value.insert(0, note);
    notifyListeners();
  }

  void editNode(int index, Note note) {
    value[index] = note;
    notifyListeners();
  }

  void deleteNodeAtIndex(int index) {
    value.removeAt(index);
    notifyListeners();
  }
}
