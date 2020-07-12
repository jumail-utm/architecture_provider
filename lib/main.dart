import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'dependencies.dart';
import 'models/user.dart';
import 'screens/todo_list_screen.dart';
import 'dependencies.dart' as di;
import 'services/user_data_service.dart';

void main() async {
  di.init();

  final user = await di.service<UserDataService>().getUser(id: 1);

  runApp(
    Provider<User>.value(
      value: user,
      child: MaterialApp(
        title: 'Provider Dependency Injection',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: TodoListScreen(),
      ),
    ),
  );
}
