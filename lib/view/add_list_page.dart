
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Controller/provide.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
      final todoProvider = Provider.of<Todooprovider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
         backgroundColor: Colors.blue,
        title: const Text('Add Todo'),
      ),
      body:ListView(
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