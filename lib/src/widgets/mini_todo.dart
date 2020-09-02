import 'package:flutter/material.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/pages/todo_page.dart';

class MiniTodo extends StatelessWidget {
  final TodoModel todo;

  const MiniTodo({Key key, @required this.todo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => TodoPage(todo: todo)));
      },
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
          child: Column(
            children: [
              Hero(
                tag: todo.id,
                child: Material(
                  type: MaterialType.transparency,
                  child: Text(todo.title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      textAlign: TextAlign.center),
                ),
              ),
              SizedBox(height: 30),
              Text(todo.id.toString(), style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
              SizedBox(height: 40),
              Container(
                height: 20,
                width: 20,
                margin: EdgeInsets.only(left: 125, top: 30),
                decoration: BoxDecoration(
                    shape: todo.completed ? BoxShape.circle : BoxShape.rectangle,
                    color: todo.completed ? Colors.green[300] : Colors.red[300]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
