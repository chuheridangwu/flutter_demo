import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController _animationControllerDemo;

  @override
  void initState() {
    super.initState();
    _animationControllerDemo = AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this //防止屏幕外的效果消耗资源
        );
    _animationControllerDemo.addListener(() {
      print('${_animationControllerDemo.value}');
    }); // 监听动画变化
    _animationControllerDemo.forward(); //开始播放动画
  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerDemo.dispose(); // 不需要资源时需要移除
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

/**
 * vsync: 是一个TickerProvider，通知当前类更改帧的值
 * 
 */
