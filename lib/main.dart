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
    ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (context) => ValueNotifier(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, notifier, __) => MaterialApp(
          title: 'Provider Types',
          debugShowCheckedModeBanner: false,
          theme: notifier.value ? ThemeData.dark() : ThemeData.light(),
          home: FutureProvider<List<Todo>>(
              create: (context) => service<TodoDataService>().getTodoList(),
              child: TodoListScreen()),
        ),
      ),
    ),
  );
}
