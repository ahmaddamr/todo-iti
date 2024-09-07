import '../model/task_model.dart';

class TaskController {
  List<TaskModel> tasks = [];
  void addTasks(TaskModel task) {
    tasks.add(task);
  }

  void updateTasks(TaskModel task) {
    int index = tasks.indexWhere((e) => e.id == task.id);
    tasks[index] = task;
  }

  void deleteTasks(TaskModel task) {
    tasks.remove(task);
  }

  void toggleDone(TaskModel task) {
    task.isDone = !task.isDone;
  }
}
