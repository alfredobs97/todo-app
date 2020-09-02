import 'package:flutter/material.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/widgets/mini_todo.dart';

class SliverTodoItems extends StatelessWidget {
  final List<TodoModel> todos;

  const SliverTodoItems({Key key, @required this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        delegate: SliverChildBuilderDelegate(
            (context, index) => Padding(padding: const EdgeInsets.all(8.0), child: MiniTodo(todo: todos[index])),
            childCount: todos.length));
  }
}
