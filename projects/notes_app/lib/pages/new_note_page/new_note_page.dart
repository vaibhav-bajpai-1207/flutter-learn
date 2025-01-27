import 'package:flutter/material.dart';
import 'package:notes_app/pages/notes_list_page/notes_list_manager.dart';
import 'package:notes_app/services/service_locator.dart';
import 'package:notes_app/utils/note_class.dart';

class NewNotePage extends StatefulWidget {
  NewNotePage({super.key});

  final TextEditingController titleTextController = TextEditingController();
  final TextEditingController bodyTextController = TextEditingController();
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode bodyFocusNode = FocusNode();

  @override
  State<NewNotePage> createState() => NewNotePageState();
}

class NewNotePageState extends State<NewNotePage> {
  var notesListManager = getIt<NotesListManager>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Vaibhav'),
        actions: [
          Padding(
              padding: EdgeInsets.all(10),
              child:
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded))),
        ],
        actionsIconTheme: IconThemeData(),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
                padding: EdgeInsets.all(0),
                child: TextField(
                  minLines: 1,
                  maxLines: 2,
                  controller: widget.titleTextController,
                  style: Theme.of(context).textTheme.titleLarge,
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: 'Note Title'),
                  focusNode: widget.titleFocusNode,
                  onTap: () {
                    if (!widget.titleFocusNode.hasFocus) {
                      widget.titleFocusNode.requestFocus();
                    }
                  },
                )),
            Container(
              child: Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      minLines: 1,
                      maxLines: 20,
                      controller: widget.bodyTextController,
                      style: Theme.of(context).textTheme.bodyMedium,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Note Body',
                      ),
                      focusNode: widget.bodyFocusNode,
                      onTap: () {
                        if (!widget.bodyFocusNode.hasFocus) {
                          widget.bodyFocusNode.requestFocus();
                        }
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          var newNote = Note(
            title: widget.titleTextController.text,
            body: widget.bodyTextController.text,
          );
          notesListManager.addNote(newNote);
          Navigator.of(context).pop();
        },
        tooltip: 'New Note',
        child: Icon(Icons.save_rounded),
      ),
    );
  }
}
