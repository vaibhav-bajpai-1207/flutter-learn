import 'package:flutter/material.dart';
import 'package:notes_app/main.dart';

class NotesListTile extends StatelessWidget {
  const NotesListTile({super.key});

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
          title: Text('This is a list tile'),
          titleTextStyle: Theme.of(context).textTheme.bodyLarge,
          subtitle: Text(
            'Lorem ipsum dolor sit amet. Et voluptatem doloribus est expedita impedit et ',
            style: TextStyle(
              color: MyApp.darkBlue,
            ),
          ),
          contentPadding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
