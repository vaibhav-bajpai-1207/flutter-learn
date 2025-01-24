import 'package:flutter/material.dart';
import 'package:notes_app/utils/notes_list.dart';

class NotesListPage extends StatelessWidget {
  const NotesListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi Vaibhav'),
        actions: [
          Padding(
            padding: EdgeInsets.all(10),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.menu_rounded))),
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
              )],
          ),
          Expanded(child: NotesList())
        ],
      ),
    );
  }
}
