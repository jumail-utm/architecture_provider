import 'package:flutter/material.dart';

import 'todo_list_screen.dart';

class LoginAsScreen extends StatelessWidget {
  static Route<dynamic> route() =>
      MaterialPageRoute(builder: (_) => LoginAsScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a user to login as'),
      ),
      body: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => Divider(
          color: Colors.blueGrey,
        ),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('User Full Name'),
            subtitle: Text('user id:  ${index + 1}'),
            onTap: () =>
                Navigator.pushReplacement(context, TodoListScreen.route()),
          );
        },
      ),
    );
  }
}
