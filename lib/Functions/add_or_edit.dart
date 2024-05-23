import 'package:provider/provider.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/provider/add_student_provider.dart';

Future<void> addOrEdit(
    String title, context, studentmodel student, int id) async {
  final studentProvider =
      Provider.of<AddStudentProvider>(context, listen: false);
  if (title == 'Edit Details') {
    studentProvider.editstudentprovider(
        id, student.age, student.name, student.email, student.phone);
  } else if (title == 'Add student') {
    await studentProvider.addstudent(student);
  }
}
