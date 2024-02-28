// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo/view/add_page.dart';

class TodoScreenpage extends StatefulWidget {
  const TodoScreenpage({super.key});

  @override
  State<TodoScreenpage> createState() => _TodoScreenpageState();
}

class _TodoScreenpageState extends State<TodoScreenpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo APP'),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodoPage()));
          }, label: Text('Todo List')),
    );
  }
}
