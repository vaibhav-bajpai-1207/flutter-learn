import 'package:flutter/material.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_manager.dart';
import 'package:notes_app/services/service_locator.dart';
import 'package:notes_app/utils/note_class.dart';
import 'package:notes_app/utils/notes_list_tile.dart';

class NotesList extends StatefulWidget {
  NotesList({
    super.key,
    required this.notes,
  });

  List<Note> notes = [
    Note(title: 'Task1', body: 'This is the body for task 1'),
    Note(title: 'Task2', body: 'This is the body for task 2'),
    Note(title: 'Task3', body: 'This is the body for task 3'),
    Note(title: 'Task4', body: 'This is the body for task 4'),
    Note(title: 'Task5', body: 'This is the body for task 5'),
    Note(title: 'Task6', body: 'This is the body for task 6'),
  ];

  @override
  createState() => NotesListState();
}

class NotesListState extends State<NotesList> {
  var notesListManager = getIt<NotesListManager>();

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView.builder(
      padding: EdgeInsets.all(20),
      itemCount: notesListManager.notes.length,
      // itemCount: widget.notes.length,
      itemBuilder: (context, index) {
        return NotesListTile(
          index: index,
          onDelete: notesListManager.deleteNodeAtIndex,
          note: notesListManager.notes[index]);
        // return NotesListTile(note: widget.notes[index]);
      },
    ));
  }
}
