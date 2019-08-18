import 'package:flutter/material.dart';
import 'package:flutter_demo/model/post.dart';

class ViewDemo extends StatelessWidget {
  Widget _pageItemBuilder(context, index){
    return Stack(
      children: <Widget>[
        SizedBox.expand(
          child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
        ),
        Positioned(
          bottom: 8.0,
          left: 8.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(posts[index].title,style:TextStyle(fontWeight: FontWeight.bold)),
              Text(posts[index].author)
            ],
          ),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: posts.length,
      itemBuilder: _pageItemBuilder,
    );
  }
}


// PageView的基础用法
class PageViewDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PageView(
      // pageSnapping: false, //是否分页
      reverse: true, // 倒置，页面反过来
      scrollDirection: Axis.vertical, //滚动方向
      onPageChanged: (page){
        print('当前页面索引$page');
      },
      controller: PageController(
        initialPage: 1, //初始化索引
        keepPage: false, //是否记住用户滚动
        viewportFraction: 0.85, //占用比例
      ),
      children: <Widget>[
        Container(
          color: Colors.brown[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'one'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.grey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'two'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
        Container(
          color: Colors.blueGrey[900],
          alignment: Alignment(0.0, 0.0),
          child: Text(
            'three'.toUpperCase(),
            style: TextStyle(color: Colors.white, fontSize: 32.0),
          ),
        ),
      ],
    );
  }
}