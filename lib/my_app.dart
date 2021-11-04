import 'package:flutter/material.dart';
import 'package:inherited_widget/screen/main_screen.dart';
import 'package:inherited_widget/widgets/global_values.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GlobalValues(
        child: const MainScreen(),
      ),
    );
  }
}
