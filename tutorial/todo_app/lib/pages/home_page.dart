import 'package:flutter/material.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/widgets/dialog_box.dart';
import 'package:todo_app/widgets/dialog_box_with_icon.dart';
import 'package:todo_app/widgets/dialog_without_actions.dart';
import 'package:todo_app/widgets/to_do_tile.dart';
import 'dart:convert';

void main() => runApp(const HomePage());

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> _tasks = [
    {
      'taskName': 'Learn Flutter',
      'isTaskCompleted': false,
    },
    {
      'taskName': 'Complete weekly task',
      'isTaskCompleted': true,
    },
  ];

  final _controller = TextEditingController();

  void addTask() {
    setState(() {
      var temp = {'taskName': _controller.text, 'isTaskCompleted': false};
      Navigator.of(context).pop();
      _tasks.add(temp);
      _controller.text = '';
    });
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      _tasks[index]['isTaskCompleted'] = !_tasks[index]['isTaskCompleted'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void showDialogWithActions() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: addTask,
        onCancel: () {
          Navigator.of(context).pop();
          _controller.text = '';
        },
      ),
    );
  }

  void showDialogWithoutActions() {
    showDialog(
      context: context,
      builder: (context) => DialogBoxWithoutActions(
        controller: _controller,
        onSave: addTask,
        onCancel: () {
          Navigator.of(context).pop();
          _controller.text = '';
        },
      ),
    );
  }

  void showDialogWithIcon() {
    showDialog(
      context: context,
      builder: (context) => DialogBoxWithIcon(
        controller: _controller,
        onSave: addTask,
        onCancel: () {
          Navigator.of(context).pop();
          _controller.text = '';
        },
      ),
    );
  }

  void createTask() {
    showDialog(
      context: context,
      builder: (context) => DialogBox(
        controller: _controller,
        onSave: addTask,
        onCancel: () {
          Navigator.of(context).pop();
          _controller.text = '';
        },
      ),
      // builder: (context) => DialogBox(
      //   controller: _controller,
      //   onSave: addTask,
      //   onCancel: () {
      //     Navigator.of(context).pop();
      //     _controller.text = '';
      //   },
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('TO DO')),
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
        // backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(20),
                  child: Text('Show Dialog with Actions'),
                  onPressed: () {
                    showDialogWithActions();
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(20),
                  child: Text('Show Dialog without Actions'),
                  onPressed: () {
                    showDialogWithoutActions();
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: MaterialButton(
                  color: Colors.yellow,
                  padding: EdgeInsets.all(20),
                  child: Text('Show Dialog with Icon'),
                  onPressed: () {
                    showDialogWithIcon();
                  }),
            ),
          ]),
          Expanded(
            child: ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                  taskName: _tasks[index]['taskName'],
                  isTaskCompleted: _tasks[index]['isTaskCompleted'],
                  onChanged: (value) => checkBoxChanged(value, index),
                  deleteFunction: (context) => deleteTask(index),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createTask,
        tooltip: 'Modal with Actions',
        child: Icon(Icons.add),
      ),
    );
  }
}
