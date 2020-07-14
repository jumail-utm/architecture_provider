import 'package:flutter/material.dart';

import '../services/todo_data_service.dart';
import '../dependencies.dart';
import '../models/todo.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Todo> _todos; // this is not a state, it is just a convinient variable

    return FutureBuilder<List<Todo>>(
      future: service<TodoDataService>().getTodoList(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          _todos = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text('My Todo List'),
            ),
            body: ListView.separated(
              itemCount: _todos.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.blueGrey,
              ),
              itemBuilder: (context, index) {
                final _todo = _todos[index];
                return ListTile(title: Text(_todo.title));
              },
            ),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
