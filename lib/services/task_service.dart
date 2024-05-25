import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app_test/models/task_model.dart';

class TaskService {
  final FirebaseFirestore _instance = FirebaseFirestore.instance;

  Stream<List<TaskModel>> watchTasks() {
    return _instance.collection("/tasks").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final task = doc.data();
        task.addEntries({MapEntry("id", doc.id as dynamic)});
        return TaskModel.fromJson(task);
      }).toList();
    });
  }

  Future<void> createTask(TaskModel taskModel) async {
    await _instance.collection("/tasks").add(taskModel.toJson());
  }
}
