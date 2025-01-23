import 'package:flutter/material.dart';
import 'package:tutorial/screens/home_page.dart';

void main() => runApp(const SecondPage());

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Second Page'),
        ),
        body: Column(
          children: [
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                },
                child: Text('Home Page'))
          ],
        ));
  }
}
