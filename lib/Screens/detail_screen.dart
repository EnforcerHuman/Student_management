import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/provider/add_student_provider.dart';
import 'package:studentapp/widgets/student_detail_text.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  final studentmodel name;
  const DetailScreen({super.key, required this.index, required this.name});
  @override
  Widget build(BuildContext context) {
    Provider.of<AddStudentProvider>(
      context,
    ).getsinglestudentprovider(name.id);

    var media = MediaQuery.of(context).size;
    final studentprovider = Provider.of<AddStudentProvider>(context);
    studentprovider.getsinglestudentprovider(name.id);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.red.withOpacity(0.90),
        ),
        body: Consumer<AddStudentProvider>(
          builder: (context, studentprovider, child) {
            return Column(
              children: [
                Center(
                  child: SizedBox(
                      width: 200,
                      height: 200,
                      child: CircleAvatar(
                          backgroundImage: FileImage(File(
                              studentprovider.studentlist[index].image ??
                                  '')))),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue.withOpacity(0.40),
                  ),
                  width: 350,
                  height: 400,
                  child: Center(
                    child: Column(
                      children: [
                        StudentdetailText(
                          text: studentprovider.studentlist[index].name,
                          leading: 'Name',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: studentprovider.studentlist[index].email,
                          leading: 'Place',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: studentprovider.studentlist[index].age,
                          leading: 'Age',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                          text: studentprovider.studentlist[index].phone,
                          leading: 'Phone',
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        StudentdetailText(
                            text: studentprovider.studentlist[index].id
                                .toString(),
                            leading: 'Student Id'),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: Row(
                            children: [
                              CupertinoButton(
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Text(
                                    'Edit',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                            builder: (ctx) => AddStudent(
                                                  title: 'Edit Details',
                                                  name: studentprovider
                                                      .studentlist[index].name,
                                                  age: studentprovider
                                                      .studentlist[index].age,
                                                  place: studentprovider
                                                      .studentlist[index].email,
                                                  phone: studentprovider
                                                      .studentlist[index].phone,
                                                  id: studentprovider
                                                      .studentlist[index].id,
                                                )));
                                  }),
                              CupertinoButton(
                                  color: Color.fromRGBO(223, 217, 163, 1)
                                      .withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(30),
                                  child: const Text('Delete'),
                                  onPressed: () {})
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }
}
