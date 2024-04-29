import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // reference the box
  final _myBox = Hive.box('mybox');

  // run this method if 1st time opening this app
  void createInitalData() {
    toDoList = [
      ["create app", false],
      ["excercise", false],
    ];
  }

  // load the data from database
  void loadData() {
    toDoList = _myBox.get('TODOLIST');
  }

  // update the database
  void upadteDataBase() {
    _myBox.put('TODOLIST', toDoList);
  }
}
