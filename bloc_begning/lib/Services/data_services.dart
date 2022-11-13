import 'dart:convert';

import 'package:bloc_begning/Model/post.dart';
import 'package:http/http.dart' as http;

class DataServices {
  // https://jsonplaceholder.typicode.com/posts
  final _baseUrl = "jsonplaceholder.typicode.com";

  Future<List<Post>> getPosts() async {
    try {
      final url = Uri.https(_baseUrl, '/posts');
      final responce = await http.get(url);
      if (responce.statusCode == 200) {
        final json = jsonDecode(responce.body) as List;
        final posts = json.map((e) => Post.fromJson(e)).toList();
        return posts;
      } else {
        throw Exception('Faild to load posts');
      }
    } catch (e) {
      throw Exception('unable to load');
    }
  }
}
