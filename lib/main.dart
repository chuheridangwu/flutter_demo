import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';
import './demo/listview_demo.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Home(),
        theme: ThemeData(
          // 主题
          primarySwatch: Colors.yellow,
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Demo',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
          ),
        elevation: 0.0, //导航栏下的阴影长度
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'navgation',
          onPressed: (){},
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'search',
            onPressed: (){debugPrint('click search');},
          ),
          IconButton(
            icon: Icon(Icons.more_horiz),
            tooltip: 'horize',
            onPressed: (){},
          ),
        ],
      ),
      body: ListViewDemo(),
    );
  }
}


