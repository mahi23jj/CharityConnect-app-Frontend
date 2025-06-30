import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:travel/Homepage/model/content.dart';

class content_repository {
  final userid = "685da0009fb0345dcacbbf5b";

  Future<List<Content>> featchcontent() async {
    final uri = Uri.parse('http://localhost:5000/api/content/get?userid=$userid');

    final response = await http.get(uri);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      return data.map((e) => Content.fromMap(e)).toList();
    } else {
      throw Exception('Failed to load');
    }
  }

  Future<bool> like(String contentid) async {
    final uri = Uri.parse('http://localhost:5000/api/like/content/$contentid');

    final response = await http.post(uri, body: {'userid': userid});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      bool answer = data['answer'];

      return answer;
    } else {
      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception('Failed to like content');
    }
  }

    Future<bool> Follow(String contentid) async {
    final uri = Uri.parse('http://localhost:5000/api/Follow/content/$contentid');

    final response = await http.post(uri, body: {'userid': userid});

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);

      bool answer = data['follow'];

      return answer;
    } else {
      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception('Failed to like content');
    }
  }
}
