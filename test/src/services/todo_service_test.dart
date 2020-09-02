import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:todo/src/models/todo.dart';
import 'package:todo/src/services/todo.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  final endpoint = 'https://jsonplaceholder.typicode.com/todos';
  final jsonOkResponse =
      '[{"userId": 1,"id": 5,"title": "laboriosam mollitia et enim quasi adipisci quia provident illum","completed": false}]';

  group('Get todos', () {
    final client = MockHttpClient();
    final todoService = TodoService(client: client);
    test('returns a List of TodoModel if the get is successful', () async {
      when(client.get(Uri.parse(endpoint))).thenAnswer((_) async => http.Response(jsonOkResponse, 200));

      expect(await todoService.getTodos(), isA<List<TodoModel>>());
    });
  });
}
