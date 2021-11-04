import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inherited_widget/models/student.dart';
import 'package:inherited_widget/widgets/global_values.dart';

class ListOfAllStudents extends StatefulWidget {
  ListOfAllStudents({Key? key}) : super(key: key);
  final List<Student> students = [
    Student(
        name: 'Бирюкова Надежда Альбертовна',
        age: 21,
        faculty: 'Компьютерные науки',
        specialty: 'Компьютерные науки',
        course: 5),
    Student(
        name: 'Бобров Кирилл Алексеевич',
        age: 19,
        faculty: 'Компьютерная инженерия',
        specialty: 'Кибербезопасность',
        course: 3),
    Student(
        name: 'Бочарова Мария Матвеевна',
        age: 18,
        faculty: 'Инфокомуникации',
        specialty: 'Телекоммуникации и радиотехника',
        course: 2),
    Student(
        name: 'Гаврилов Максим Михайлович',
        age: 22,
        faculty: 'Автоматика',
        specialty: 'Радиоэлектронные аппараты и средства',
        course: 6),
    Student(
        name: 'Гущина Ярослава Дмитриевна',
        age: 17,
        faculty: 'Компьютерная инженерия',
        specialty: 'Компьютерная инженерия',
        course: 1),
    Student(
        name: 'Данилова Анастасия Фёдоровна',
        age: 21,
        faculty: 'Автоматика',
        specialty: 'Системная инженерия',
        course: 5),
    Student(
        name: 'Зуева Виктория Владимировна',
        age: 20,
        faculty: 'Компьютерная инженерия',
        specialty: 'Кибербезопасность',
        course: 4),
    Student(
        name: 'Калинин Леонид Эльдарович',
        age: 20,
        faculty: 'Инфокомуникации',
        specialty: 'Кибербезопасность',
        course: 4),
    Student(
        name: 'Климов Алексей Захарович',
        age: 18,
        faculty: 'Компьютерные науки',
        specialty: 'Инженерия программного обеспечения',
        course: 2),
    Student(
        name: 'Королёва Лидия Руслановна',
        age: 19,
        faculty: 'Автоматика',
        specialty: 'Системная инженерия',
        course: 3),
    Student(
        name: 'Костин Феликс Станиславович',
        age: 19,
        faculty: 'Компьютерная инженерия',
        specialty: 'Кибербезопасность',
        course: 3),
    Student(
        name: 'Лазарев Ян Геннадьевич',
        age: 22,
        faculty: 'Компьютерные науки',
        specialty: 'Инженерия программного обеспечения',
        course: 6),
    Student(
        name: 'Лебедев Артем Семенович',
        age: 17,
        faculty: 'Компьютерная инженерия',
        specialty: 'Компьютерная инженерия',
        course: 1),
    Student(
        name: 'Новиков Александр Тимурович',
        age: 17,
        faculty: 'Инфокомуникации',
        specialty: 'Телекоммуникации и радиотехника',
        course: 1),
    Student(
        name: 'Русанова Елизавета Никитична',
        age: 19,
        faculty: 'Автоматика',
        specialty: 'Радиоэлектронные аппараты и средства',
        course: 3),
    Student(
        name: 'Савельева Дарья Лаврентьевна',
        age: 21,
        faculty: 'Компьютерная инженерия',
        specialty: 'Компьютерная инженерия',
        course: 5),
    Student(
        name: 'Селезнёв Арсений Тарасович',
        age: 18,
        faculty: 'Инфокомуникации',
        specialty: 'Кибербезопасность',
        course: 2),
    Student(
        name: 'Скворцов Семён Тимофеевич',
        age: 17,
        faculty: 'Компьютерные науки',
        specialty: 'Компьютерные науки',
        course: 1),
    Student(
        name: 'Суворов Петр Яковлевич',
        age: 20,
        faculty: 'Автоматика',
        specialty: 'Системная инженерия',
        course: 4),
    Student(
        name: 'Федотова Полина Борисовна',
        age: 18,
        faculty: 'Компьютерные науки',
        specialty: 'Компьютерные науки',
        course: 2),
  ];

  @override
  _ListOfAllStudentsState createState() => _ListOfAllStudentsState();
}

class _ListOfAllStudentsState extends State<ListOfAllStudents> {
  @override
  Widget build(BuildContext context) {
    context
        .dependOnInheritedWidgetOfExactType<GlobalValues>()
        ?.addStudents(widget.students);

    return StreamBuilder<List<Student>>(
        stream: context
            .dependOnInheritedWidgetOfExactType<GlobalValues>()
            ?.allStudentsController
            .stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Container(
                    padding: const EdgeInsets.all(5),
                    child: InkWell(
                        onTap: () {
                          context
                              .dependOnInheritedWidgetOfExactType<
                                  GlobalValues>()
                              ?.selectedStudent(snapshot.data![index]);
                        },
                        child: Text(
                          snapshot.data![index].name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 20),
                        )));
              },
              itemCount: snapshot.data!.length,
            );
          }
        });
  }
}
