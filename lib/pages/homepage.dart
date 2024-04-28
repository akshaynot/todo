import 'package:flutter/material.dart';
import 'package:todolist/util/dialog_box.dart';
import 'package:todolist/util/todo_tile.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // Text controller
  final _controller = TextEditingController();

  // List of todo tasks
  List toDoList = [
    ["create app", false],
    ["excercise", false],
  ];
  // Checkbox change method
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  // on saving new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_controller.text, false]);
      Navigator.of(context).pop();
      _controller.clear();
    });
  }

  // creating new task

  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // deleting a task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text("TODO APP"),
        backgroundColor: Colors.yellow,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: createNewTask,
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList[index][0],
            taskCompleted: toDoList[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
            deleteFuntion: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
