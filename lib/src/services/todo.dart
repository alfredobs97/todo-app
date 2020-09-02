import 'dart:convert';

import 'package:todo/src/models/todo.dart';
import 'package:http/http.dart' as http;

class TodoService {
  final _endpoint = 'https://jsonplaceholder.typicode.com/todos';
  final http.Client _client;

  TodoService({http.Client client}) : _client = client ?? http.Client();

  Future<List<TodoModel>> getTodos() async {
    final Uri url = Uri.parse(_endpoint);

    final resp = await _client.get(url);

    final List<dynamic> decodedResp = json.decode(resp.body);

    return decodedResp.map((todo) => TodoModel.fromJson(todo)).toList();
  }
}
