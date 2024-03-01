import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/Controller/provide.dart';
import 'package:todo/view/todo_list_page.dart';

void main(){
  runApp(const MyApp());
  
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => Todooprovider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home:TodoScreenpage() ,
      ),
    );
  }
}