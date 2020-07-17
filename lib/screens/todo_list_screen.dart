import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../todolist_notifier.dart';
import 'login_as_screen.dart';

class TodoListScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => TodoListScreen());

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ValueNotifier<User>>(context, listen: false).value;

    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(user.avatar),
        ),
        title: Text(user.name),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.highlight_off, // highlight_off, touch_app
                color: Colors.red,
                size: 40),
            onPressed: () {
              Provider.of<ValueNotifier<User>>(context, listen: false).value =
                  null;
              Navigator.pushReplacement(
                context,
                LoginAsScreen.route(),
              );
            },
          ),
        ],
      ),
      body: Consumer<TodoListNotifier>(
        builder: (context, todoListNotifier, _) {
          print('-' * 20);

          final todos = todoListNotifier?.todos;
          if (todos == null) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.separated(
            itemCount: todos.length,
            separatorBuilder: (context, index) => Divider(
              color: Colors.blueGrey,
            ),
            itemBuilder: (context, index) {
              final todo = todos[index];

              // To show which ListTile gets rebuilt
              print('Build ListTile ${index + 1}');

              return ListTile(
                title: Text(todo.title,
                    style: TextStyle(
                        decoration: todo.completed
                            ? TextDecoration.lineThrough
                            : TextDecoration.none)),
                subtitle: Text('id:  ${todo.id}'),
                onTap: () => todoListNotifier.toggleTodoStatus(index),
                onLongPress: () => todoListNotifier.removeTodo(index),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>
            Provider.of<TodoListNotifier>(context, listen: false).addNewTodo(),
      ),
    );
  }
}
