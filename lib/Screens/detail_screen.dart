import 'package:flutter/material.dart';
import 'package:studentapp/db_function/function.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration: InputDecoration(
                hintText: studentlist[index].name,
                border: OutlineInputBorder()),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: TextField(
            decoration:
                InputDecoration(hintText: 'Age', border: OutlineInputBorder()),
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
      ],
    )));
  }
}
