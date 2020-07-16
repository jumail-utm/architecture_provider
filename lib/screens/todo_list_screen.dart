import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/todo_data_service.dart';
import '../dependencies.dart';
import '../models/todo.dart';
import '../models/user.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  List<Todo> _todos; // the state

// Define convinient getters and shorthands
  get todoService => service<TodoDataService>();
  get todoList => todoService.getTodoList();

  void toggleTodo(int index) async {
    //Update the status at the database
    Todo updatedTodo = await todoService.updateTodoStatus(
        id: _todos[index].id,
        status: !_todos[index]
            .completed); // Get the current status from UI and toggle it
    setState(() => _todos[index].completed = updatedTodo
        .completed); // Update UI using the updated todo from database
  }

  void addTodo() async {
    final newTodo = await todoService.createTodo(
      todo: Todo(title: 'New Task'),
    ); // Update server. Id for the new Todo will be given by the server

    setState(() => _todos.add(newTodo)); // Update UI
  }

  void deleteTodo(int index) async {
    await todoService.deleteTodo(
        id: _todos[index].id); // Delete todo at the database
    setState(() => _todos.removeAt(index)); // Update UI
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Todo>>(
        future: todoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _todos = snapshot.data;
            return _buildMainScreen(context);
          }
          return _buildFetchingDataScreen();
        });
  }

  Widget _buildMainScreen(context) {
    return Consumer<User>(
      builder: (_, user, __) => Scaffold(
        appBar: AppBar(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
          title: Text(user.name),
        ),
        body: ListView.separated(
          itemCount: _todos.length,
          separatorBuilder: (context, index) => Divider(
            color: Colors.blueGrey,
          ),
          itemBuilder: (context, index) {
            final _todo = _todos[index];
            return ListTile(
              title: Text(_todo.title,
                  style: TextStyle(
                      decoration: _todo.completed
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
              subtitle: Text('id: ${_todo.id}'),
              onTap: () async => toggleTodo(index),
              onLongPress: () async => deleteTodo(index),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () async => addTodo(),
        ),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
