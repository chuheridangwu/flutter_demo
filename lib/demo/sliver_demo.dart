import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';

class SliverDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            // title: Text('你好'),
            // pinned: true, //固定在顶部
            floating: true, //如果向下滚动，跟随滚动，向上滚动，直接显示
            expandedHeight: 178.0, // 伸展高度
            flexibleSpace: FlexibleSpaceBar( // 弹性空间
              title: Text('Flutter demo'.toUpperCase()),
              background: Image.network(
                posts[0].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverSafeArea(
            // widget显示在安全区域内
            sliver: SliverPadding(
              padding: EdgeInsets.all(8.0),
              sliver: SliverGridDemo(),
            ),
          )
        ],
      ),
    );
  }
}

// SliverGrid 基本使用
class SliverGridDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.6 // 宽高比例调整
          ),
      delegate: SliverChildBuilderDelegate(
        // 设置显示的widget，个数和widget
        (BuildContext context, int index) {
          return Container(
            child: Image.network(posts[index].imageUrl, fit: BoxFit.cover),
          );
        },
        childCount: posts.length,
      ),
    );
  }
}
