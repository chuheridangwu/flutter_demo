import 'package:flutter/material.dart';
import '../model/post.dart';

class ListViewDemo extends StatelessWidget {
  Widget _listitemBuilder(context, index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              AspectRatio( // 比例视图
                child: Image.network(posts[index].imageUrl,fit: BoxFit.cover,),
                aspectRatio: 16 / 9,
              ),
              SizedBox(
                height: 16.0,
              ),
              Text(
                posts[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              Text(
                posts[index].author,
                style: Theme.of(context).textTheme.subtitle,
              ),
              SizedBox(
                height: 16.0,
              ),
            ],
          ),
          Positioned.fill(
            // 上下左右如果不单独设置都是0.0
            child: Material(
              color: Colors.transparent, //透明颜色
              child: InkWell(
                // 安卓特有动画 渐末效果
                splashColor: Colors.white.withOpacity(0.3), // 渐末颜色
                highlightColor: Colors.white.withOpacity(0.1), //高亮颜色
                onTap: () {
                  debugPrint('tap');
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: _listitemBuilder,
    );
  }
}
