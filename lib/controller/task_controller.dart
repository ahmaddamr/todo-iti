import '../model/task_model.dart';

class TaskController {
  List<TaskModel> tasks = [];
  void addTasks(TaskModel task) {
    tasks.add(task);
  }

  updateTasks(TaskModel task) {
    int index = tasks.indexWhere((e) => e.id == task.id);
    tasks[index] = task;
  }

  deleteTasks(TaskModel task) {
    tasks.removeWhere((e) => e.id == task.id);
  }

  toggleDone(TaskModel task) {
    task.isDone = !task.isDone;
  }
}
