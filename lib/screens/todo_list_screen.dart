import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
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
            icon: Icon(Icons.fullscreen_exit),
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
      body: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Todo item'),
            subtitle: Text('id:  ${index + 1}'),
            onTap: () {},
            onLongPress: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
