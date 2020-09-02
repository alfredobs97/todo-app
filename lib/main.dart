import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/bloc/todo_bloc.dart';
import 'package:todo/src/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(GetToDos()),
      child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0XFF364f6b),
        backgroundColor: Color(0xFFf5f5f5),
        accentColor: Color(0xFF3fc1c9),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    )
    );
  }
}
