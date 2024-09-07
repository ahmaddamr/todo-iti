import 'package:flutter/material.dart';
import 'package:todo_iti/model/task_model.dart';
import 'package:todo_iti/widgets/task_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Today',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            // todo => date
          ],
        ),
      ),
      body: Column(
        children: [
          TaskItem(
            taskModel: TaskModel(
                id: '1', title: 'first', descreption: 'task', isDone: true),
          ),
          TaskItem(
            taskModel: TaskModel(id: '2', title: 'second', descreption: 'task'),
          ),
          TaskItem(
            taskModel: TaskModel(id: '3', title: 'third', descreption: 'task'),
          ),
        ],
      ),
    );
  }
}
