import 'package:flutter/material.dart';

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => ToDoScreenState();
}

class ToDoScreenState extends State<ToDoScreen> {
  final List<Map<String, dynamic>> _tasks = [];

  void _addTask(String task) {
    setState(() {
      _tasks.add({'title': task, 'isCompleted': false});
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index]['isCompleted'] = !_tasks[index]['isCompleted'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: _tasks.length,
        itemBuilder: (context, index) {
          return CheckboxListTile(
            title: Text(_tasks[index]['title']),
            value: _tasks[index]['isCompleted'],
            onChanged: (_) => _toggleTask(index),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                final TextEditingController controller =
                    TextEditingController();
                return AlertDialog(
                    title: const Text('Add Task'),
                    content: TextField(controller: controller),
                    actions: [
                      TextButton(
                        onPressed: () {
                          _addTask(controller.text);
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      )
                    ]);
              });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
