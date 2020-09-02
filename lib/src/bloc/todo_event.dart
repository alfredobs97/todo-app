part of 'todo_bloc.dart';

@immutable
abstract class TodoEvent {}

class GetToDos extends TodoEvent {}
