import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_list_tile.dart';

class NotesList extends StatefulWidget {
  const NotesList({super.key});

  @override
  createState() => NotesListState();
}

class NotesListState extends State<NotesList> {
  @override
  Widget build(BuildContext context) {
    return Container(

      child: ListView(
        padding: EdgeInsets.all(20),
        children: [
          NotesListTile(),
          NotesListTile(),
          NotesListTile(),
        ],
      )
    );
  }
}
