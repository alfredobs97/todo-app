part of 'todo_bloc.dart';

@immutable
abstract class TodoState {}

class TodoInitial extends TodoState {}

class FetchingTodos extends TodoState {}

class FetchedTodos extends TodoState {
  final List<TodoModel> todosDone;
  final List<TodoModel> todosIncompleted;


  FetchedTodos({this.todosDone, this.todosIncompleted});
}

class ErrorFetchingTodos extends TodoState {}
