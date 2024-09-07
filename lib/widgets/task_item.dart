import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_iti/model/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key, required this.taskModel});
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(20)),
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(taskModel.title),
              Text(
                taskModel.isDone ? 'Completed' : 'Not Completed',
                style: TextStyle(
                    color: taskModel.isDone ? Colors.green : Colors.red),
              ),
            ],
          ),
          children: [
            Column(
              children: [
                const Row(
                  children: [
                    Text('data'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        taskModel.isDone
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: taskModel.isDone ? Colors.green : Colors.grey,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
