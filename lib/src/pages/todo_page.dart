import 'package:flutter/material.dart';
import 'package:todo/src/models/todo.dart';

class TodoPage extends StatelessWidget {
  final TodoModel todo;

  const TodoPage({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarea nº ${todo.id}'),
      ),
      body: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: todo.id,
            child: Material(
              type: MaterialType.transparency,
              child: Text(todo.title,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  textAlign: TextAlign.center),
            ),
          ),
          SizedBox(height: 30),
          Text(todo.id.toString(), style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
          SizedBox(height: 40),
          Center(
            child: Column(children: [
              Text('Estado: '),
              SizedBox(height: 10),
              todo.completed
                  ? Icon(Icons.check_circle_outline, size: 82, color: Colors.green[300])
                  : Icon(Icons.highlight_off, size: 82, color: Colors.red[300])
            ]),
          )
        ],
      )),
    );
  }
}
