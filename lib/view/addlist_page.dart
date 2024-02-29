// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Controller/provide.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

   // final todoProvider = Provider.of<Todooprovider>(context, listen: false);
  @override
  Widget build(BuildContext context) {
      final todoProvider = Provider.of<Todooprovider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue,
        title: Text('Add Todo'),
      ),
      body:
      //  ListView(
      //   children: [
      //     TextField(
      //       decoration: InputDecoration(
      //             hintText: 'titile',
      //       ),
      //     ),
      //     TextField(
      //       decoration: InputDecoration( 
      //         hintText: 'Description'),
      //         keyboardType: TextInputType.multiline,
      //         minLines: 5,
      //         maxLines: 8,
      //     ),
      //     SizedBox(height: 20),
      //     ElevatedButton(onPressed: (){
      //       Navigator.pop(context);
      //     }, child: Text('Submit')),
      //   ],
      // ),
      ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextField(
            controller: todoProvider.titleAddController,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: todoProvider.descriptionAddController,
            decoration: const InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 15,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                todoProvider.addTodo();

                Navigator.pop(context);
              },
              child: const Text('SUBMIT'))
        ],
      ),
    );
  }
}