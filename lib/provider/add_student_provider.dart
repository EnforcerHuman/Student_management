import 'package:flutter/material.dart';
import 'package:studentapp/db_function/function.dart';
import 'package:studentapp/db_model/model.dart';

class AddStudentProvider extends ChangeNotifier {
  List<studentmodel> studentlist = [];

  Future<void> addstudent(studentmodel student) async {
    await addStudent(student.age, student.name, student.email, student.phone);
    // fetchstudentProvider();
    // notifyListeners();
  }

  Future<void> fetchstudentProvider() async {
    studentlist = await printAllStudents();
    notifyListeners();
  }

  Future<void> deleteStudentProvider(String name, index) async {
    await deletestudent(name);
    await fetchstudentProvider();
  }

  Future<void> editstudentprovider(
      String originalName, age, name, email, phone) async {
    await editStudent(originalName, age, name, email, phone);
  }
}
