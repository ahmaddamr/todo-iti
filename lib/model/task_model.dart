class TaskModel {
  String id;
  String title;
  String descreption;
  bool isDone;

  TaskModel(
      {required this.id,
      required this.title,
      required this.descreption,
      this.isDone = false});
}
