// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_iti/controller/task_controller.dart';
import 'package:todo_iti/model/task_model.dart';
import 'package:todo_iti/widgets/custom_text_form_field.dart';

class TaskItem extends StatefulWidget {
  const TaskItem(
      {super.key,
      required this.taskModel,
      // required this.onDelete,
      // required this.onDone,
      required this.onUpdate});
  final TaskModel taskModel;
  // final VoidCallback onDelete;
  // final VoidCallback onDone;
  final Function(TaskModel) onUpdate;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
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
              Text(widget.taskModel.title),
              Text(
                widget.taskModel.isDone ? 'Completed' : 'Not Completed',
                style: TextStyle(
                    color: widget.taskModel.isDone ? Colors.green : Colors.red),
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
                      onPressed: () {
                        TaskController().deleteTasks(widget.taskModel);
                        setState(() {});
                        log('delete');
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        EditDialoge();
                      },
                      icon: const Icon(
                        Icons.edit,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        TaskController().toggleDone(widget.taskModel);
                        setState(() {});
                      },
                      icon: Icon(
                        widget.taskModel.isDone
                            ? Icons.check_box
                            : Icons.check_box_outline_blank,
                        color: widget.taskModel.isDone
                            ? Colors.green
                            : Colors.grey,
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

  void EditDialoge() {
    TextEditingController title =
        TextEditingController(text: widget.taskModel.title);
    TextEditingController desc =
        TextEditingController(text: widget.taskModel.descreption);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextFormField(
                  controller: title, hint: 'Title', obscureText: false),
              const SizedBox(
                height: 20,
              ),
              CustomTextFormField(
                  controller: desc, hint: 'Descreption', obscureText: false),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                TaskModel task = TaskModel(
                    id: widget.taskModel.id,
                    title: title.text,
                    descreption: desc.text);
                widget.onUpdate(task);
              },
              child: const Text('Update'),
            )
          ],
        );
      },
    );
  }
}
