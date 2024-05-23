import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/provider/add_student_provider.dart';

class DetailScreen extends StatelessWidget {
  final int index;
  const DetailScreen({super.key, required this.index});
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    final studentprovider = Provider.of<AddStudentProvider>(context);
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.blue,
          backgroundColor: Colors.red.withOpacity(0.90),
        ),
        body: Column(
          children: [
            Center(
              child: SizedBox(width: 200, height: 200, child: CircleAvatar()),
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
                            "Name : ${studentprovider.studentlist[index].name}",
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
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text("age : ${studentprovider.studentlist[index].age}",
                            style: const TextStyle(
                                color: Colors.black,
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
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
