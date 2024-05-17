import 'package:flutter/material.dart';
import 'package:studentapp/db_function/function.dart';

class AddStudent extends StatelessWidget {
  const AddStudent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(child: Text('Add Student')),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Name', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Age', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'email', border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Phone', border: OutlineInputBorder()),
              keyboardType: TextInputType.number,
            ),
          ),
          // ElevatedButton(onPressed: () {}, child: const Text('Submit'))
          MaterialButton(
            onPressed: () async {
              addStudent('23', 'amal', 'email', '123454');
            },
            child: Text('Submit'),
          )
        ],
      )),
    );
  }
}
