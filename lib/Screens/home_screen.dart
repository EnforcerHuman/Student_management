import 'package:flutter/material.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/db_function/function.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    printAllStudents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
            onPressed: () {
              printAllStudents();
            },
            icon: Icon(Icons.access_alarm_outlined)),
        title: Center(child: Text('Student Data')),
      ),
      body: SafeArea(
          child: ListView.builder(
              itemCount: studentlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => DetailScreen(index: index)));
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(studentlist[index].name),
                  ),
                );
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // addStudent('23', 'Test', 'email', '123454');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const AddStudent()));
        },
      ),
    );
  }
}
