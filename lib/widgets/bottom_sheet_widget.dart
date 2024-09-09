import 'package:flutter/material.dart';
import 'package:todo_iti/model/task_model.dart';
import 'package:todo_iti/widgets/custom_elevated_button.dart';

import 'custom_text_form_field.dart';

class BottomSheetWidget extends StatefulWidget {
  BottomSheetWidget({super.key, required this.onAdd});
  void Function(TaskModel) onAdd;

  @override
  State<BottomSheetWidget> createState() => _BottomSheetWidgetState();
}

class _BottomSheetWidgetState extends State<BottomSheetWidget> {
  TextEditingController title = TextEditingController();

  TextEditingController desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Add Task',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
            ),
            // Spacer(flex: 1,),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.clear),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Title:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 80,
              ),
              SizedBox(
                width: 200,
                child: CustomTextFormField(
                  controller: title,
                  hint: 'Title',
                  obscureText: false,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const Text(
                'Decription:',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 15,
              ),
              SizedBox(
                width: 200,
                child: CustomTextFormField(
                  controller: desc,
                  hint: 'Decription',
                  obscureText: false,
                  filled: true,
                ),
              ),
            ],
          ),
        ),
        const Spacer(
          flex: 1,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomElvatedButton(
            text: const Text(
              'Confirm',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            backgroundColor: Colors.black,
            borderSideColor: Colors.transparent,
            onPressed: () {
              TaskModel task = TaskModel(
                  id: DateTime.now().toString(),
                  title: title.text,
                  descreption: desc.text);
              widget.onAdd(task);
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}
