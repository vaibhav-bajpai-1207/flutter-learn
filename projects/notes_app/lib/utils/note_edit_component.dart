import 'package:flutter/material.dart';
// import 'package:notes_app/pages/notes_list_page/notifiers/notes_list_notifier.dart';
// import 'package:notes_app/services/service_locator.dart';

class NoteEditComponent extends StatefulWidget {
  NoteEditComponent({
    super.key,
    required this.toggleIsEditing,
    required this.titleTextController,
    required this.bodyTextController,
  });

  final Function toggleIsEditing;
  final TextEditingController titleTextController;
  final TextEditingController bodyTextController;
  final FocusNode titleFocusNode = FocusNode();
  final FocusNode bodyFocusNode = FocusNode();

  @override
  State<NoteEditComponent> createState() => NoteEditComponentState();
}

class NoteEditComponentState extends State<NoteEditComponent> {

  @override
  Widget build(BuildContext context) {
    var tempTitle = widget.titleTextController.text;
    var tempBody = widget.bodyTextController.text;

    return Padding(
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
                decoration: InputDecoration(border: InputBorder.none),
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
                    decoration: InputDecoration(border: InputBorder.none),
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
          ElevatedButton(
            onPressed: () {
              widget.titleTextController.text = tempTitle;
              widget.bodyTextController.text = tempBody;
            },
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.fromMap(
                {WidgetState.any: Colors.red[50]},
              ),
              foregroundColor: WidgetStateColor.fromMap(
                {WidgetState.any: Colors.red},
              ),
            ),
            child: Text('Reset'),
          )
        ],
      ),
    );
  }
}
