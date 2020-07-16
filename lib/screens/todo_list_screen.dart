import 'package:flutter/material.dart';

import 'login_as_screen.dart';

class TodoListScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => TodoListScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(child: Text('Avatar')),
        title: Text('User Full Name'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.fullscreen_exit),
            onPressed: () => Navigator.pushReplacement(
              context,
              LoginAsScreen.route(),
            ),
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
