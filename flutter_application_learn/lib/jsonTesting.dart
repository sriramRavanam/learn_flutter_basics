import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String url = 'https://jsonplaceholder.typicode.com/posts';

Future<PostsList> fetchPost() async {
  final response = await http.get(url);
  if (response.statusCode == 200) {
    return PostsList.fromJson(jsonDecode(response.body));
  } else {
    throw Exception("failed to retrieve data");
  }
}

class PostsList {
  final List<Posts> lists;
  PostsList({this.lists});

  factory PostsList.fromJson(List<dynamic> parsedJson) {
    List<Posts> listPost = new List<Posts>();
    listPost = parsedJson.map((e) => Posts.fromJson(e)).toList();
    return new PostsList(lists: listPost);
  }
}

class Posts {
  int userId;
  int id;
  String title;
  String body;

  Posts({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  factory Posts.fromJson(Map<String, dynamic> parsedJson) {
    return Posts(
      userId: parsedJson['userId'],
      id: parsedJson['id'],
      title: parsedJson['title'],
      body: parsedJson['body'],
    );
  }
}
