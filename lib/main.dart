import 'dart:async';

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
      home: StreamProvider<List<Todo>>(
        create: (context) {
          final streamController = StreamController<List<Todo>>();
          service<TodoDataService>()
              .getTodoList()
              .then((todos) => streamController.add(todos));
          return streamController.stream;
        },
        child: TodoListScreen(),
      ),
    ),
  );
}
