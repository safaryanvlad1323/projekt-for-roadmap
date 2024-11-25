import 'package:flutter/material.dart';
import 'package:flutter_aplication_9hour/utility/dialog_box.dart';
import 'package:flutter_aplication_9hour/utility/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //! Text controller
  final _contriller = TextEditingController();

  //? list of todo tasks
  List toDoList = [
    [
      'Make Tutorial',
      false,
    ],
    [
      'Do Exercise',
      false,
    ]
  ];

  //? FUnction for creating new TO DO tile
  void creatNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _contriller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  //? Save new task
  void saveNewTask() {
    setState(() {
      toDoList.add([_contriller.text, false]);
      _contriller.clear();
    });
    Navigator.of(context).pop();
  }

  //! Delet the TO DO tile
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  //? CheckBox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple[200],
        appBar: AppBar(
          title: const Text('TO DO', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          elevation: 0,
        ),
        //? Floating button for adding new TO DO tile--

        floatingActionButton: FloatingActionButton(
          onPressed: creatNewTask,
          child: const Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return ToDoTile(
              taskName: toDoList[index][0],
              taskCompleted: toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
