import 'package:flutter/foundation.dart';
import 'dependencies.dart';
import 'models/todo.dart';
import 'models/user.dart';
import 'services/todo_data_service.dart';

// The todo list is user-specific
class TodoListNotifier with ChangeNotifier {
  List<Todo> todos;
  User user;

  TodoDataService get dataService => service();

  Future<void> getList() async {
    todos = await dataService.getUserTodoList(userId: user.id);
    notifyListeners();
  }

  Future<void> addNewTodo() async {
    final newTodo = await dataService.createTodo(
        todo: Todo(title: 'New task', userId: user.id));
    todos.add(newTodo);
    notifyListeners();
  }

  Future<void> removeTodo(int index) async {
    await dataService.deleteTodo(id: todos[index].id);
    todos.removeAt(index);
    notifyListeners();
  }

// Future<Todo> updateTodoStatus({int id, bool status}) async {
//     final json = await rest.patch('todos/$id', data: {'completed': status});
//     return Todo.fromJson(json);
//   }

  Future<void> toggleTodoStatus(int index) async {
    final updatedTodo = await dataService.updateTodoStatus(
        id: todos[index].id, status: !todos[index].completed);
    todos[index].completed = updatedTodo.completed;
    notifyListeners();
  }
}
