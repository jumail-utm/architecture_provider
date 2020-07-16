import 'package:flutter/material.dart';

import 'screens/login_as_screen.dart';
import 'dependencies.dart' as di;

void main() {
  di.init();

  runApp(
    MaterialApp(
      title: 'Provider State Management',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: LoginAsScreen(),
    ),
  );
}
