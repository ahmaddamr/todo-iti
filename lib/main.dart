import 'package:flutter/material.dart';

import 'view/home_screen.dart';

void main() {
  runApp(const TodoList());
}

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
