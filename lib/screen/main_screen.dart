import 'package:flutter/material.dart';
import 'package:inherited_widget/widgets/information_of_students.dart';
import 'package:inherited_widget/widgets/list_of_all_students.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Container(
                child: const InformationOfStudents(),
                decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.black))),
              ),
            ),
            Expanded(
              child: ListOfAllStudents(),
            ),
          ],
        ),
      ),
    );
  }
}
