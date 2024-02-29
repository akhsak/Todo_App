// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo/Controller/provide.dart';
import 'package:todo/view/addlist_page.dart';

class TodoScreenpage extends StatefulWidget {
  const TodoScreenpage({super.key});

  @override
  State<TodoScreenpage> createState() => _TodoScreenpageState();
}

class _TodoScreenpageState extends State<TodoScreenpage> {


    void initState() {
    super.initState();
    Provider.of<Todooprovider>(context, listen: false).fetchTodo();
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo APP'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            Expanded(
              child: Consumer<Todooprovider>(
                builder: (context, value, child) {
                  return value.isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.todoList.isEmpty
                          ? Center(
                              child:
                               Lottie.asset(
                                  'todo/assets/Animation - 1709198344685.json',
                                  // width:
                                  //     MediaQuery.of(context).size.width * 0.8,
                                  // height:
                                  //     MediaQuery.of(context).size.height * 0.7
                                  ),
                            )
                          : ListView.builder(
                              itemCount: value.todoList.length,
                              itemBuilder: (context, index) {
                                final data = value.todoList.length - index - 1;
                                final todo = value.todoList[data];
                                return Card(
                                  child: ListTile(
                                    leading: CircleAvatar(
                                        child: Text('${index + 1}')),
                                    title: Text(todo.title.toString()),
                                    subtitle: Text(todo.description.toString()),
                                    trailing:
                                        PopupMenuButton(onSelected: (value) {
                                      if (value == 'edit') {
                                        updateAlertBox(
                                            context,
                                            todo.id,
                                            todo.title.toString(),
                                            todo.description.toString());
                                      } else if (value == 'delete') {
                                        Provider.of<Todooprovider>(context,
                                                listen: false)
                                            .deleteTodo(todo.id.toString());
                                      }
                                    }, itemBuilder: (context) {
                                      return [
                                        const PopupMenuItem(
                                            child: Text('EDIT'), value: 'edit'),
                                        const PopupMenuItem(
                                            child: Text('DELETE'),
                                            value: 'delete')
                                      ];
                                    }),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoPage()));
        },
        label: const Text(
          'ADD TODO',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  updateAlertBox(
    context,
    id,
    String title,
    String description,
  ) {
    final TextEditingController titleController =
        TextEditingController(text: title);
    final TextEditingController descriptionController =
        TextEditingController(text: description);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("EDIT TODO"),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Column(
              children: [
                TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(labelText: "Title"),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(labelText: "Description"),
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: () {
                    String newTitle = titleController.text.trim();
                    String newDescription = descriptionController.text.trim();
                    Provider.of<Todooprovider>(context, listen: false)
                        .updateTodo(newTitle, newDescription, id);
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.update),
                  label: const Text("UPDATE"),
                ),
              ],
            ),
          ),
        );
      },
      //  ListView.builder(
      // itemCount: items.length,
      //   itemBuilder: (context,index){
      //     final item=items[index]as Map;
      //      return ListTile(
      //       leading:CircleAvatar(child: Text('${index+1}'),) ,
      //       title: Text(item['textt']),
      //       subtitle: Text(item['titile']),
      //      );
      // },),
      // floatingActionButton: FloatingActionButton.extended(
      //     onPressed: () {
      //       Navigator.push(context, MaterialPageRoute(builder: (context)=>AddTodoPage()));
      //     }, label: Text('Todo List')),
    );
  }
}
