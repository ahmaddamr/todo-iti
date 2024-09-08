import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_iti/model/task_model.dart';
import 'package:todo_iti/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  DateTime date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    //! format the date inside the build method
    String format = DateFormat('EEEE, MMM d, y').format(date);

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Today',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            // todo => date
            Text(format.toString())
          ],
        ),
      ),
      body: Column(
        children: [
          // TaskItem(
          //   taskModel: TaskModel(
          //       id: '1', title: 'first', descreption: 'task', isDone: true),
          // ),
          // TaskItem(
          //   taskModel: TaskModel(id: '2', title: 'second', descreption: 'task'),
          // ),
          TaskItem(
           
            taskModel: TaskModel(id: '3', title: 'third', descreption: 'task'),
            onUpdate: (p0) => TaskModel(id: '3', title: 'third', descreption: 'task'),
          ),
        ],
      ),
    );
  }
}
