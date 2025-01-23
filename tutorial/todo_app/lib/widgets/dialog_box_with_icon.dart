import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_btn.dart';

class DialogBoxWithIcon extends StatelessWidget {
  DialogBoxWithIcon({
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
        height: 100,
        // decoration: BoxDecoration(
        //   border: Border.all(),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  color: Color.fromARGB(255, 12, 0, 39),
                  iconSize: 25,
                  onPressed: onCancel,
                  icon: Icon(Icons.cancel_outlined),
                ),
              ],
            ),
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyBtn(
              btnName: 'Save',
              onPressed: onSave,
            ),
            // MyBtn(
            //   btnName: 'Cancel',
            //   onPressed: onCancel,
            // )
          ],
        ),
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
