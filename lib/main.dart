import 'package:flutter/material.dart';
import 'package:test_interview/locator.dart';

import 'features/my_cases/presentation/pages/request_list_page.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/home': (context) => const RequestListPage(),
      },
      initialRoute: '/home',
    );
  }
}
