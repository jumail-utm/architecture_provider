import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependencies.dart';
import 'models/todo.dart';
import 'screens/todo_list_screen.dart';
import 'dependencies.dart' as di;
import 'services/todo_data_service.dart';

void main() {
  di.init();

  runApp(
    MaterialApp(
      title: 'Provider Types',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: MultiProvider(
        providers: [
          FutureProvider<List<Todo>>(
              create: (context) => service<TodoDataService>().getTodoList()),
          ProxyProvider<List<Todo>, int>(
              update: (context, todos, previousCount) =>
                  todos != null ? todos.length : 0)
        ],
        child: TodoListScreen(),
      ),
    ),
  );
}
