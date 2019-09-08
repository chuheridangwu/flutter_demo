import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HttpDemo extends StatefulWidget {
  @override
  _HttpDemoState createState() => _HttpDemoState();
}

class _HttpDemoState extends State<HttpDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
    fetchPost().then((value) => print(value));
  }

  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
      return posts;
    } else {
      throw Exception('Failed to fecth posts');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final int id;
  final String title;
  final String desc;
  final String img;
  final String author;

  Post(this.desc, this.img, this.title, this.id, this.author);

  Post.fromJson(Map json)
      : title = json['title'],
        desc = json['description'],
        img = json['imgUrl'],
        id = json['id'],
        author = json['author'];
}
