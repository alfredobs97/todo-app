import 'package:flutter/material.dart';

class DoneAppBar extends StatelessWidget {
  final todosCompletedLength;

  const DoneAppBar({Key key, @required this.todosCompletedLength}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text('Tareas realizadas: $todosCompletedLength 🥳'),
    );
  }
}
