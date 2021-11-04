import 'package:flutter/material.dart';
import 'package:inherited_widget/models/student.dart';
import 'global_values.dart';

class InformationOfStudents extends StatefulWidget {
  const InformationOfStudents({Key? key}) : super(key: key);

  @override
  _InformationOfStudentsState createState() => _InformationOfStudentsState();
}

class _InformationOfStudentsState extends State<InformationOfStudents> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Student>(
        stream: context
            .dependOnInheritedWidgetOfExactType<GlobalValues>()
            ?.studentController
            .stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Информация о студенте:',
                      style: TextStyle(fontSize: 25),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'ФИО: ${snapshot.data!.name}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Возраст: ${snapshot.data!.age}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Факультет: ${snapshot.data!.faculty}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Специальность: ${snapshot.data!.specialty}',
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                      'Курс: ${snapshot.data!.course}',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
