import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:todo/src/bloc/todo_bloc.dart';
import 'package:todo/src/services/todo.dart';

class MockTodoService extends Mock implements TodoService {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  group('initBloc', () {
    blocTest(
      'emits [] when bloc is created',
      build: () => TodoBloc(service: MockTodoService()),
      expect: [],
    );
  });

  group('Fetch todos', () {
    final mockTodoService = MockTodoService();
    blocTest(
      'emits is FetchingTodos when start getting todos',
      build: () => TodoBloc(service: mockTodoService),
      act: (bloc) => bloc.add(GetToDos()),
      expect: [isA<FetchingTodos>(), isA<ErrorFetchingTodos>()],
    );

    blocTest(
      'emits is FetchedTodos when get is sucesful',
      build: () {
        when(mockTodoService.getTodos()).thenAnswer((_) async => []);
        return TodoBloc(service: mockTodoService);
      },
      act: (bloc) => bloc.add(GetToDos()),
      skip: 1,
      expect: [isA<FetchedTodos>()],
    );

    blocTest(
      'emits is ErrorFetchingTodos when get throw exception',
      build: () {
        when(mockTodoService.getTodos()).thenThrow(Exception());
        return TodoBloc(service: mockTodoService);
      },
      act: (bloc) => bloc.add(GetToDos()),
      skip: 1,
      expect: [isA<ErrorFetchingTodos>()],
    );
  });
}
