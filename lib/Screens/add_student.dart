import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Functions/add_or_edit.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/provider/add_student_provider.dart';

// ignore: must_be_immutable
class AddStudent extends StatelessWidget {
  String name;
  String? age;
  String? place;
  String? phone;
  String title;
  int? id;
  final TextEditingController nameController;
  final TextEditingController ageController;
  final TextEditingController placeController;
  final TextEditingController phoneController;
  final String existingname;
  AddStudent(
      {super.key,
      required this.title,
      this.name = '',
      this.age,
      this.place,
      this.phone,
      this.id})
      : nameController = TextEditingController(text: name),
        ageController = TextEditingController(text: age ?? ''),
        phoneController = TextEditingController(text: phone ?? ""),
        placeController = TextEditingController(text: place ?? ""),
        existingname = name;

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<AddStudentProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text(title)),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Center(child: CircleAvatar()),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    hintText: 'Name', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: ageController,
                decoration: const InputDecoration(
                    hintText: 'Age', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              TextField(
                controller: placeController,
                decoration: const InputDecoration(
                    hintText: 'Place', border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                    hintText: 'Phone', border: OutlineInputBorder()),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  String name = nameController.text.trim();
                  String age = ageController.text.trim();
                  String place = placeController.text.trim();
                  String phone = phoneController.text.trim();

                  if (name.isEmpty ||
                      age.isEmpty ||
                      place.isEmpty ||
                      phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please fill in all fields'),
                      ),
                    );
                    return;
                  }
                  int newid = Random().nextInt(100000);
                  // int unique = DateTime.now().millisecondsSinceEpoch;
                  // print(unique);
                  studentmodel student = studentmodel(
                      age: age,
                      name: name,
                      email: place,
                      phone: phone,
                      id: id ?? newid);
                  // studentProvider.addstudent(student);
                  print('actual name:${student.name} key: $name');
                  addOrEdit(title, context, student, id ?? newid);
                  Navigator.pop(context);
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
