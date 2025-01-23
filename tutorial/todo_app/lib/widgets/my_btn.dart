import 'package:flutter/material.dart';

class MyBtn extends StatelessWidget {
  final String btnName;
  VoidCallback onPressed;
  MyBtn({
    super.key,
    required this.btnName,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: MaterialButton(
        minWidth: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 40,
          vertical: 20,
        ),
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text(btnName),
      ),
    );
  }
}
