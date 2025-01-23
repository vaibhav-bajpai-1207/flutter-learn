import 'package:flutter/material.dart';
import 'package:todo_app/widgets/my_btn.dart';

class DialogBoxWithoutActions extends StatelessWidget {
  DialogBoxWithoutActions({
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
      content: Padding(
        padding: EdgeInsets.all(10),
        child: Container(
          decoration: BoxDecoration(border: Border.all()),
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter Task Title',
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyBtn(
                    btnName: 'Save',
                    onPressed: onSave,
                  ),
                  MyBtn(
                    btnName: 'Cancel',
                    onPressed: onCancel,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      // actions: [
      //   Column(
      //     crossAxisAlignment: CrossAxisAlignment.stretch,
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     children: [
      //       MyBtn(
      //         btnName: 'Save',
      //         onPressed: onSave,
      //       ),
      //       MyBtn(
      //         btnName: 'Cancel',
      //         onPressed: onCancel,
      //       )
      //     ],
      //   ),
      // ],
      // actionsPadding: EdgeInsets.symmetric(
      //   vertical: 10,
      //   horizontal: 30,
      // ),
      // buttonPadding: EdgeInsets.all(20),
      // actionsAlignment: MainAxisAlignment.center,
    );
  }
}
