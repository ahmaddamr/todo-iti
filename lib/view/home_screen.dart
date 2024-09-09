import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_iti/controller/task_controller.dart';
import 'package:todo_iti/model/task_model.dart';
import 'package:todo_iti/widgets/bottom_sheet_widget.dart';
import 'package:todo_iti/widgets/custom_elevated_button.dart';
import 'package:todo_iti/widgets/custom_text_form_field.dart';
import 'package:todo_iti/widgets/task_item.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime date = DateTime.now();

  TaskController taskController = TaskController();

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
          Expanded(
            child: ListView.builder(
              itemCount: taskController.tasks.length,
              itemBuilder: (context, index) {
                final task = taskController.tasks[index];
                return TaskItem(
                  taskModel: task,
                  onUpdate:(p0) {
                    taskController.updateTasks(p0);
                    setState(() {
                      
                    });
                    
                  },
                  onDelete:() {
                    taskController.deleteTasks(task);
                    setState(() {
                      
                    });
                  },
                  onDone:() {
                    taskController.toggleDone(task);
                    setState(() {
                      
                    });
                  },
                );
              },
            ),
          ),
          // const Spacer(
          //   flex: 1,
          // ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomElvatedButton(
                text: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add,
                      size: 25,
                      color: Colors.white,
                    ),
                    Text(
                      'Add Task',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                backgroundColor: Colors.black,
                borderSideColor: Colors.transparent,
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return BottomSheetWidget(
                        onAdd: (todo) {
                          taskController.addTasks(todo);
                          setState(() {
                            
                          });
                        },
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
