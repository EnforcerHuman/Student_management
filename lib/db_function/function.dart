import 'package:hive_flutter/hive_flutter.dart';
import 'package:studentapp/db_model/model.dart';

List<studentmodel> studentlistnormal = [];

Future<void> addStudent(
    String age, String name, String email, String phone) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final student =
      studentmodel(age: age, name: name, email: email, phone: phone);
  final test = await studentBox.put(name, student);
  return test;
}

Future<List<studentmodel>> printAllStudents() async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  final List<studentmodel> students = studentBox.values.toList();
  for (var student in students) {
    studentlistnormal.add(student);
  }

  return students;
}

Future<void> deletestudent(String name) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');
  await studentBox.delete(name);
}

Future<void> editStudent(String originalName, String age, String name,
    String email, String phone) async {
  final studentBox = await Hive.openBox<studentmodel>('student_db');

  // If the name has changed, delete the old entry
  if (originalName != name) {
    await studentBox.delete(originalName);
  }

  final student =
      studentmodel(age: age, name: name, email: email, phone: phone);
  await studentBox.put(name, student);
}

Future<List<studentmodel>> searchStudents(String query) async {
  final students = await printAllStudents();
  return students
      .where(
          (student) => student.name.toLowerCase().contains(query.toLowerCase()))
      .toList();
}
