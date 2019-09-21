import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:flutter_infinite_list/models/models.dart';

class PostRepository {
  final http.Client _httpClient;

  PostRepository({@required http.Client httpClient}) : _httpClient = httpClient;

  Future<List<Post>> getPosts(int startIndex, int limit) async {
    final response = await _httpClient.get(
        'https://jsonplaceholder.typicode.com/posts?_start=$startIndex&_limit=$limit');
    if (response.statusCode == 200) {
      final data = json.decode(response.body) as List;
      return data.map((dynamic rawPost) {
        return Post(
          id: rawPost['id'] as int,
          title: rawPost['title'] as String,
          body: rawPost['body'] as String,
        );
      }).toList();
    } else {
      throw Exception('error fetching posts');
    }
  }
}
