import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inherited_widget/models/student.dart';

class GlobalValues extends InheritedWidget {
  final StreamController<List<Student>> allStudentsController =
      StreamController<List<Student>>();
  final StreamController<Student> studentController =
      StreamController<Student>();

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  GlobalValues({Key? key, required Widget child})
      : super(key: key, child: child);

  static GlobalValues of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<GlobalValues>()
        as GlobalValues;
  }

  void addStudents(List<Student> students) {
    allStudentsController.add(students);
  }

  void selectedStudent(Student student) {
    studentController.add(student);
  }
}
