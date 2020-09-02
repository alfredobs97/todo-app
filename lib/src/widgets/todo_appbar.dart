import 'package:flutter/material.dart';

class TodoAppBar extends StatelessWidget {
  final int todosIncompletedLength;

  const TodoAppBar({Key key, @required this.todosIncompletedLength}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100,
      floating: true,
      centerTitle: true,
      title: Text('Hola User', style: TextStyle(fontSize: 28)),
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.parallax,
        title: RichText(
          text: TextSpan(text: 'Tienes ', style: TextStyle(fontSize: 14), children: [
            TextSpan(text: '$todosIncompletedLength tareas ', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            TextSpan(text: 'por hacer 💪')
          ]),
        ),
      ),
    );
  }
}
