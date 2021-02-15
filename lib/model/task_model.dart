class TaskModel {
  final int id;
  final String title;
  final String date;
  bool isCheck;

  TaskModel({
    this.id,
    this.title,
    this.date,
    this.isCheck = false,
  });
  void toggleDone() {
    isCheck = !isCheck;
  }
}
