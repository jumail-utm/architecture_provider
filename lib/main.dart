import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';
import 'screens/login_as_screen.dart';
import 'dependencies.dart' as di;
import 'services/user_data_service.dart';

void main() {
  di.init();

  runApp(
    MultiProvider(
      providers: [
        FutureProvider<List<User>>(
            create: (_) => di.service<UserDataService>().getUserList()),
        ChangeNotifierProvider<ValueNotifier<User>>(
          create: (_) => ValueNotifier<User>(null),
        )
      ],
      child: MaterialApp(
        title: 'Provider State Management',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.green),
        home: LoginAsScreen(),
      ),
    ),
  );
}
