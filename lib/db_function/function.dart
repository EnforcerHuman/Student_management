import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentapp/db_model/model.dart';

List<studentmodel> studentlist = [];

Future<void> addStudent(
    String age, String name, String email, String phone) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final student =
      studentmodel(age: age, name: name, email: email, phone: phone);
  studentBox.put(name, student);
}

Future<List<studentmodel>> printAllStudents() async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final List<studentmodel> students = studentBox.values.toList();
  for (var student in students) {
    print(
        'Name: ${student.name}, Age: ${student.age}, Email: ${student.email}, Phone: ${student.phone}');
    studentlist.add(student);
  }

  return students;
}
