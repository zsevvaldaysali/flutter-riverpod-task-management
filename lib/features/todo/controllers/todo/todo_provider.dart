import 'package:flutter_riverpod_task_management/common/helpers/db_helper.dart';
import 'package:flutter_riverpod_task_management/common/models/task_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'todo_provider.g.dart';

@riverpod
class TodoState extends _$TodoState {
  @override
  List<Task> build() {
    return [];
  }

//to get the data
  void refresh() async {
    final data = await DBHelper.getItems();
    state = data.map((e) => Task.fromJson(e)).toList();
  }

//to set the data
  void addItem(Task task) async {
    await DBHelper.createItem(task);
    refresh();
  }

//to update the item
  void updateItem(
      int id, String title, String description, int isCompleted, String date, String startTime, String endTime) async {
    await DBHelper.updateItem(id, title, description, isCompleted, date, startTime, endTime);
    refresh();
  }

//to delete
  Future<void> deleteTodo(int id) async {
    await DBHelper.deleteItem(id);
    refresh();
  }

  void markAsCompleted(
      int id, String title, String description, int isCompleted, String date, String startTime, String endTime) async {
    await DBHelper.updateItem(id, title, description, 1, date, startTime, endTime);
    refresh();
  }

//today
//to get the tasks for today, we need to get the dates of today's date

  String getToday() {
    DateTime today = DateTime.now();
    return today.toString().substring(0, 10);
  }

//tomorrow
  String getTomorrow() {
    DateTime tomorrow = DateTime.now().add(
      const Duration(days: 1),
    );
    return tomorrow.toString().substring(0, 10);
  }

  List<String> last30days() {
    DateTime today = DateTime.now();
    DateTime oneMonthAgo = today.subtract(const Duration(
      days: 30,
    ));
    List<String> dates = [];
    for (int i = 0; i < 30; i++) {
      DateTime date = oneMonthAgo.add(const Duration(days: 30));
      dates.add(date.toString().substring(0, 10));
    }
    return dates;
  }

  bool getStatus(Task data) {
    bool? isCompleted;
    if (data.isCompleted == 0) {
      //task is not completed
      isCompleted = false;
    } else {
      isCompleted = true;
    }
    return isCompleted;
  }
}
