import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/src/bloc/todo_bloc.dart';
import 'package:todo/src/widgets/done_appbar.dart';
import 'package:todo/src/widgets/sliver_todo.dart';
import 'package:todo/src/widgets/todo_appbar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: BlocBuilder<TodoBloc, TodoState>(
            builder: (context, state) {
              if (state is FetchingTodos) return CircularProgressIndicator();
              if (state is ErrorFetchingTodos) return Text('No estamos disponibles, ¡Vuelve más tarde! :)');
              if (state is FetchedTodos)
                return CustomScrollView(
                  slivers: [
                    TodoAppBar(todosIncompleted: state.todosIncompleted.length),
                    SliverTodoItems(todos: state.todosIncompleted),
                    DoneAppbar(completedTasksLength: state.todosDone.length),
                    SliverTodoItems(todos: state.todosDone),
                  ],
                );
              return Container();
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(onPressed: () {}, child: Icon(Icons.add, color: Colors.white)),
      ),
    );
  }
}
