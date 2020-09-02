import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/services/todo.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _service;
  TodoBloc({TodoService service})
      : _service = service ?? TodoService(),
        super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is GetToDos) yield* _mapGetTodosToState();
  }

  Stream<TodoState> _mapGetTodosToState() async* {
    yield FetchingTodos();

    try {
      final todos = await _service.getTodos();

      final todosDone = todos.where((todo) => todo.completed).toList();
      final todosIncompleted = todos.where((todo) => !todo.completed).toList();

      yield FetchedTodos(todosDone: todosDone, todosIncompleted: todosIncompleted);
    } catch (e) {
      yield ErrorFetchingTodos();
    }
  }
}
