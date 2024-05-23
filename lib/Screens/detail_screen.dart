import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/provider/add_student_provider.dart';

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
                  child:
                      SizedBox(width: 200, height: 200, child: CircleAvatar()),
                ),
                SizedBox(
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
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                                "Name : ${studentprovider.studentdetails?.name}",
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                "place : ${studentprovider.studentlist[index].email}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                "age : ${studentprovider.studentlist[index].age}",
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 153, 93, 93),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                "phone : +91 ${studentprovider.studentlist[index].phone}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text(
                                "Student Id: ${studentprovider.studentlist[index].id}",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 250,
                          child: Row(
                            children: [
                              CupertinoButton(
                                  // color: Color.fromRGBO(223, 217, 163, 1)
                                  //     .withOpacity(0.35),
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
                              // SizedBox(
                              //   width: 20,
                              // ),
                              CupertinoButton(
                                  color: Color.fromRGBO(223, 217, 163, 1)
                                      .withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(30),
                                  child: Text('Delete'),
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
