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
  Animation _animation;
  Animation _animationColor;
  CurvedAnimation _curvedAnimation;

  @override
  void initState() {
    super.initState();
    _animationControllerDemo = AnimationController(
        // value: 32.0, //初始值
        // lowerBound: 32.0, // 最小的值
        // upperBound: 100.0, //最大的值
        duration: Duration(milliseconds: 1000),
        vsync: this //防止屏幕外的效果消耗资源
        );

    _curvedAnimation = CurvedAnimation(parent: _animationControllerDemo,curve: Curves.bounceOut);
    _animation = Tween(begin: 32.0,end: 100.0).animate(_curvedAnimation);
    _animationColor = Tween(begin: Colors.red,end: Colors.black).animate(_curvedAnimation);


    // _animationControllerDemo.addListener(() {
    //   // print('${_animationControllerDemo.value}');
    //   setState(() {});
    // }); // 监听动画变化

    _animationControllerDemo.addStatusListener((AnimationStatus status){
      print(status);
    });

    // _animationControllerDemo.forward(); //开始播放动画
  }

  @override
  void dispose() {
    super.dispose();
    _animationControllerDemo.dispose(); // 不需要资源时需要移除
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          ActionChip(
            label: Text('${_animationControllerDemo.value}'),
            onPressed: () {
              _animationControllerDemo.forward();
            },
          ),
         AnimatedHeart(animations: [_animation,_animationColor], controller: _animationControllerDemo,),
        ],
      ),
    );
  }
}

class AnimatedHeart extends AnimatedWidget{
 final List animations;
 final AnimationController controller;

 AnimatedHeart({
   this.animations,
   this.controller,
 }) : super(listenable: controller);

 @override
  Widget build(BuildContext context) {
    return  IconButton(
            icon: Icon(Icons.favorite),
            iconSize: animations[0].value,
            // color: animations[1].value, // 不知道为什么会崩溃
            onPressed: (){
              switch (controller.status) {
                case AnimationStatus.completed:
                  controller.reverse();
                  break;
                default:
                controller.forward();
              }
            },
          );
  }
}

/**
 * vsync: 是一个TickerProvider，通知当前类更改帧的值
 * AnimationController 是一个动画监听控制器，可以设置动画时间，监听动画时间，在不需要动画的时候移除，dispose方法中
 * AnimationController 有初始值，最小值，最大值，在动画中时改变状态，需要在监听器中做改动
 * 
 * 
 * 
 * 
 */
