import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Screens/add_student.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/Screens/search_screen.dart';
import 'package:studentapp/provider/add_student_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<AddStudentProvider>(context, listen: false)
        .fetchstudentProvider();
    final StudentProvider = Provider.of<AddStudentProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.access_alarm_outlined),
        ),
        title: const Center(child: Text('Student Data')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => SearchScreen()));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: Consumer<AddStudentProvider>(
        builder: (context, studentProvider, child) {
          // Ensure data is fetched before building the UI

          // Once data is fetched, display it
          return SafeArea(
            child: ListView.builder(
              itemCount: studentProvider.studentlist.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    print(index);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => DetailScreen(index: index),
                    ));
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(studentProvider.studentlist[index].name),
                    // trailing: IconButton(
                    //     onPressed: () {
                    //       // studentProvider.deleteStudentProvider(
                    //       //     studentProvider.studentlist[index].name, index);
                    //       // editstudent(studentProvider.studentlist[index].name,
                    //       //     'Shiva', '222', '22222', 'wwww');

                    //     },
                    //     icon: const Icon(Icons.delete)),
                    trailing: PopupMenuButton(
                      onSelected: (value) {
                        // Handle selection of an option
                      },
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: Text('Edit '),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => AddStudent(
                                      title: 'Edit Details',
                                      name: studentProvider
                                          .studentlist[index].name,
                                      age: studentProvider
                                          .studentlist[index].age,
                                      place: studentProvider
                                          .studentlist[index].email,
                                      phone: studentProvider
                                          .studentlist[index].phone,
                                    )));
                          },
                        ),
                        PopupMenuItem(
                          value: 2,
                          child: Text('Delete'),
                          onTap: () {
                            studentProvider.deleteStudentProvider(
                                studentProvider.studentlist[index].name, index);
                          },
                        ),
                      ],
                      child: Icon(Icons.more_vert), // This is the button itself
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigator.of(context)
          //     .push(MaterialPageRoute(builder: (ctx) => AddStudent()));
          Navigator.of(context).push(PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) {
              return AddStudent(
                title: 'Add student',
              );
            },
            transitionDuration: const Duration(milliseconds: 500),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(0.0, -1.0); // Slide in from the right
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(begin: begin, end: end);
              var curvedAnimation = CurvedAnimation(
                parent: animation,
                curve: curve,
              );

              return SlideTransition(
                position: tween.animate(curvedAnimation),
                child: child,
              );
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
