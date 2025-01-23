import 'package:flutter/material.dart';
import './second_page.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      drawer: Drawer(
          backgroundColor: Colors.deepPurple[100],
          child: Column(
            children: [
              DrawerHeader(
                  child: Text(
                'Flutter',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.deepPurple[300],
                  fontWeight: FontWeight.bold,
                ),
              )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/');
                },
              ),
              ListTile(
                leading: Icon(Icons.login),
                title: Text('Second Page'),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/secondpage');
                },
              ),
            ],
          )),
      body: Column(children: [
        TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondPage()));
            },
            child: Text('Second Page')),
      ]),
    );
  }
}
