import 'package:flutter/material.dart';
import 'package:notes_app/pages/new_note_page/new_note_page.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_manager.dart';
import 'package:notes_app/services/service_locator.dart';
import 'package:notes_app/utils/note_class.dart';
import 'package:notes_app/utils/notes_list.dart';

class NotesListPage extends StatelessWidget {
  NotesListPage({super.key});

  var notesListManager = getIt<NotesListManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi User'),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded,color: Colors.white,))),
        ],
        actionsIconTheme: IconThemeData(),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text(
                  'My Notes',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              )
            ],
          ),
          ValueListenableBuilder(
            valueListenable: notesListManager.notesListNotifier,
            builder: (context, value, _) {
            return Expanded(
                child: NotesList(
              notes: value ?? <Note>[],
            ));
          })
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => NewNotePage()));
        },
        tooltip: 'New Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
