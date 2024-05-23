// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:studentapp/db_function/function.dart';

// class SearchScreen extends StatelessWidget {
//   const SearchScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           CupertinoSearchTextField(
//             onChanged: (value) {
//               var students = searchStudents(value);
//               print({});
//             },
//           )
//         ],
//       )),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studentapp/Screens/detail_screen.dart';
import 'package:studentapp/db_function/function.dart';
import 'package:studentapp/db_model/model.dart'; // Assuming this imports searchStudents

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String searchQuery = '';
  List<studentmodel> searchResults = []; // Initialize empty search results

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CupertinoSearchTextField(
              placeholder:
                  'Search Students...', // Add a placeholder for better UX
              onChanged: (value) async {
                setState(() {
                  searchQuery = value; // Update search query in state
                });
                searchResults =
                    await searchStudents(searchQuery); // Perform search
              },
            ),
            Expanded(
              // Use Expanded to fill remaining space
              child: searchResults.isEmpty
                  ? const Center(
                      child: Text('No results found'),
                    )
                  : ListView.builder(
                      itemCount: searchResults.length,
                      itemBuilder: (context, index) {
                        final student = searchResults[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (ctx) => DetailScreen(
                                    index: index, name: searchResults[index])));
                          },
                          child: ListTile(
                            title: Text(student
                                .name), // Assuming name is the field to display
                            // Add other student details as needed
                          ),
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
