import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';
import 'package:notes_app/pages/note_view_page/note_view_page.dart';
import 'package:notes_app/utils/note_class.dart';
// import 'package:notes_app/utils/note_view_component.dart';

class NotesListTile extends StatelessWidget {
  NotesListTile(
      {super.key,
      required this.note,
      required this.onDelete,
      required this.index});

  final Note note;
  final Function onDelete;
  final int index;

  void onListTileTap() {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 0,
      ),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: MyApp.orange),
        child: ListTile(
          title: Text(note.title),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
          trailing: IconButton(
            icon: Icon(
              Icons.delete_rounded,
              color: const Color.fromARGB(255, 5, 38, 65),
            ),
            onPressed: () {
              onDelete(index);
            },
          ),
          subtitle: Text(
            note.body,
            maxLines: 1,
            overflow: TextOverflow.fade,
            style: TextStyle(
              color: MyApp.darkBlue,
            ),
          ),
          contentPadding: EdgeInsets.all(20),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => NoteViewPage(
                      index: index,
                      note: note,
                    )));
          },
        ),
      ),
    );
  }
}
