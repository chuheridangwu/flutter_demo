import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';

class PostShow extends StatelessWidget {
  final Post post;
  PostShow({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${post.title}'),
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Image.network(post.imageUrl),
          Container(
            padding: EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(post.title, style: Theme.of(context).textTheme.title),
                Text(post.author, style: Theme.of(context).textTheme.subhead),
                SizedBox(
                  height: 10.0,
                ),
                Text(post.description, style: Theme.of(context).textTheme.body1),
              ],
            ),
          )
        ],
      ),
    );
  }
}
