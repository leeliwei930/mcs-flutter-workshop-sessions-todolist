
class Task {

  late String id;

  late String title;

  late String? description;

  late DateTime? dueDate;

  late bool completed;

  Task({required this.id, required this.title, this.completed = false, this.description, this.dueDate});
}