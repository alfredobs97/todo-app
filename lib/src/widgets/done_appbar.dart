import 'package:flutter/material.dart';

class DoneAppbar extends StatelessWidget {
  final completedTasksLength;

  const DoneAppbar({Key key, @required this.completedTasksLength}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      centerTitle: true,
      title: Text('Tareas realizadas: $completedTasksLength 🥳'),
    );
  }
}
