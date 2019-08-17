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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true, // 文字是否居中
          title: Text('Demo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          elevation: 0.0, //导航栏下的阴影长度
          leading: IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'navgation',
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                debugPrint('click search');
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'horize',
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, //标签未选中颜色
            indicatorColor: Colors.black54, //标签底部横线选中的颜色
            indicatorSize: TabBarIndicatorSize.label, //标签底部横线大小
            indicatorWeight: 1.0, //标签底部横线高度 
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Tab(
              icon: Icon(Icons.local_florist),
            ),
            Icon(
              Icons.change_history,
              size: 128.0,
              color: Colors.black,
            ),
            Icon(
              Icons.directions_bike,
              size: 128.0,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
