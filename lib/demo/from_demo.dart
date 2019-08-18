import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme( // 覆盖之前的主题
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFleldDemo(),
            ],
          ),
        ),
      ),
    );
  }
}



class TextFleldDemo extends StatefulWidget {
  @override
  _TextFleldDemoState createState() => _TextFleldDemoState();
}

class _TextFleldDemoState extends State<TextFleldDemo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value){
        print('input: $value');
      },
      onSubmitted: (value){
        print('submit: $value');
      },
      decoration: InputDecoration( //TextField的装饰效果
        icon: Icon(Icons.subject),
        labelText: 'Title', // 输入框顶部文字
        hintText: 'enter the post title', // 占位文字
        // border: InputBorder.none, //不显示文本框下面那条线
        // border: OutlineInputBorder(),
        filled: true, // 文本框显示背景颜色
      ),
    );
  }
}


// 设置主题颜色
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).accentColor,
    );
  }
}

