import 'dart:convert';

import 'package:sample_api_request/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<Post>?> getpost() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      var posts = (jsonResponse as List)
          .map(
            (data) => Post.fromJson(data),
          )
          .toList();

      return posts;
    } else {
      return null;
    }
  }
}
