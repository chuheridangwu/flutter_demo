import 'package:flutter/material.dart';

// 主轴： row 是横着的主轴 column是竖着的主轴,主轴有多个对齐的方式
// 交叉轴: 主轴 对应的轴
// Alignment(-0.5,0), // 子widget在父widget中的位置
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //主轴, 有多个对齐方式
        // crossAxisAlignment: CrossAxisAlignment.center,  // 交叉轴方式
        children: <Widget>[
          ConstrainedBox(
            constraints: BoxConstraints(minHeight: 200.0, maxWidth: 200.0),
            child: Container(
              color: Colors.indigoAccent,
            ),
          )
        ],
      ),
    );
  }
}

// 宽高比widget  AspectRatio
class AspectRatioDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16.0 / 9.0, // 宽高比
      child: Container(
        color: Color.fromRGBO(3, 54, 255, 1.0),
      ),
    );
  }
}

// 层叠的widget
class StackDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topLeft,
      children: <Widget>[
        SizedBox(
          width: 200.0,
          height: 300.0,
          child: Container(
            alignment: Alignment(0.9, -0.9), // 子widget在父widget中的位置
            child: Icon(
              Icons.ac_unit,
              color: Colors.white,
            ),
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 53, 255, 1.0),
              borderRadius: BorderRadius.circular(2.0),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        SizedBox(
          width: 100.0,
          height: 100.0,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(3, 54, 255, 1.0),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.brightness_2, color: Colors.white, size: 32.0),
          ),
        ),
        Positioned(
          child: Icon(
            Icons.ac_unit,
            color: Colors.white,
          ),
          top: 35,
          right: 30,
        ),
        Positioned(
          child: Icon(
            Icons.ac_unit,
            color: Colors.white,
          ),
          top: 165,
          right: 22,
        ),
      ],
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon, {this.size = 32.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon, size: size, color: Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}
