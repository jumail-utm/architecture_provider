import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';

class TodoListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _todos = Provider.of<List<Todo>>(context);

    if (_todos == null) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('My Todo List (StreamProvider)'),
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
}
