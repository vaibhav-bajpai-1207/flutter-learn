import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_btn.dart';

class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  TextEditingController controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 70,
        decoration: BoxDecoration(
          border: Border.all(),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Task Title',
              ),
            ),
          ],
        ),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: MyBtn(
                btnName: 'Save',
                onPressed: onSave,
              ),
            ),
            Expanded(
              flex: 1,
              child: MyBtn(
                btnName: 'Cancel',
                onPressed: onCancel,
              ),
            )
          ],
        )
      ],
      // actionsPadding: EdgeInsets.symmetric(
      //   vertical: 10,
      //   horizontal: 30,
      // ),
      buttonPadding: EdgeInsets.all(20),
      actionsAlignment: MainAxisAlignment.center,
    );
  }
}
