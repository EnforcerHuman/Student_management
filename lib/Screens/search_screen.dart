// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/material.dart';
// // import 'package:studentapp/db_function/function.dart';

// // class SearchScreen extends StatelessWidget {
// //   const SearchScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //           child: Column(
// //         children: [
// //           CupertinoSearchTextField(
// //             onChanged: (value) {
// //               var students = searchStudents(value);
// //               print({});
// //             },
// //           )
// //         ],
// //       )),
// //     );
// //   }
// // }

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:studentapp/Screens/detail_screen.dart';
// import 'package:studentapp/db_function/function.dart';
// import 'package:studentapp/db_model/model.dart';
// import 'package:studentapp/provider/add_student_provider.dart'; // Assuming this imports searchStudents

// // ignore: must_be_immutable
// class SearchScreen extends StatelessWidget {
//   SearchScreen({super.key});

//   String searchQuery = '';

//   List<studentmodel> searchResults = [];
//   // Initialize empty search results
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             CupertinoSearchTextField(
//               placeholder:
//                   'Search Students...', // Add a placeholder for better UX
//               onChanged: (value) async {
//                 // Perform search
//               },
//             ),
//             Expanded(
//               // Use Expanded to fill remaining space
//               child: searchResults.isEmpty
//                   ? Consumer<AddStudentProvider>(builder: (context,studentprovider,index){
//                     return ListView.builder(itemBuilder: (context,index){
// return Text('');
//                     },itemCount: studentprovider.studentlist.length);
//                   },)
//                     )
//                  : ListView.builder(
//                       itemCount: searchResults.length,
//                       itemBuilder: (context, index) {
//                         final student = searchResults[index];
//                         return GestureDetector(
//                           onTap: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (ctx) => DetailScreen(
//                                     index: index, name: searchResults[index])));
//                           },
//                           child: ListTile(
//                             title: Text(student
//                                 .name), // Assuming name is the field to display
//                             // Add other student details as needed
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/db_model/model.dart';
import 'package:studentapp/provider/add_student_provider.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({super.key});

  String searchQuery = '';

  List<studentmodel> searchResults = [];

  @override
  Widget build(BuildContext context) {
    final studentProvider = Provider.of<AddStudentProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              placeholder: 'Search Students...',
              onChanged: (value) {
                studentProvider.searchStudentProvider(value);
              },
            ),
            Expanded(
              child: Consumer<AddStudentProvider>(
                builder: (context, studentProvider, child) {
                  // var studentsToShow = searchQuery.isEmpty
                  //     ? studentProvider.studentlist
                  //     : searchResults;
                  return ListView.builder(
                    itemCount: studentProvider.searchedstudents.length,
                    itemBuilder: (context, index) {
                      final student = studentProvider.searchedstudents[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              index: index,
                              name: student,
                            ),
                          ));
                        },
                        child: ListTile(
                          title: Text(student.name),
                          // Add other student details as needed
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
