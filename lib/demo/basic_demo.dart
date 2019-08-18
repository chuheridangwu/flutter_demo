import 'package:flutter/material.dart';
import '../model/post.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
        image: NetworkImage(posts[0].imageUrl),
        alignment: Alignment.center,
        // repeat: ImageRepeat.repeat, //是否重复
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.6), BlendMode.hardLight), //滤镜效果
      )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center, //主轴对齐
        children: <Widget>[
          Container(
              child: Icon(Icons.pool, size: 32.0, color: Colors.white),
              // color: Color.fromRGBO(3, 54, 255, 1.0),
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              width: 90.0,
              height: 90.0,
              decoration: BoxDecoration(
                  //盒子的装饰,如果这里 和 Container 同时设置颜色，会有冲突
                  color: Color.fromRGBO(3, 54, 255, 1.0),
                  border: Border(
                      // 设置边框效果
                      top: BorderSide(
                          color: Colors.red,
                          width: 10.0,
                          style: BorderStyle.solid)),
                  // borderRadius: BorderRadius.circular(2.0), // 设置圆角，不知道为什么设置之后不显示图像
                  boxShadow: [
                    BoxShadow(
                      //阴影效果
                      offset: Offset(6.0, 7.0), //阴影偏移
                      color: Colors.yellow, //阴影颜色
                      blurRadius: 20.0, //模糊程度，值越大越明显
                      spreadRadius: 6.0, //阴影扩散程度，可以为负数
                    )
                  ],
                  shape: BoxShape.circle, //形状，有长方形 圆形 不知道为什么设置之后不显示图像
                  // gradient: RadialGradient(// 镜像渐变效果
                  //     colors: [
                  //   Color.fromRGBO(7, 102, 255, 1.0),
                  //   Color.fromRGBO(3, 28, 128, 1.0),
                  // ]),
                  gradient: LinearGradient(
                    //线性渐变
                    colors: [
                      Color.fromRGBO(7, 102, 255, 1.0),
                      Color.fromRGBO(3, 28, 128, 1.0),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )))
        ],
      ),
    );
  }
}

// 多样式文本，一串字符串中可以多个不同样式
class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: 'flutter',
          style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 40.0,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w200),
          children: [
            TextSpan(
                text: '.net',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.blue,
                ))
          ]),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(fontSize: 16.0);
  final String _author = '李白';
  @override
  Widget build(BuildContext context) {
    return Text(
      "$_author 盒子的主体部分在layers层绘制。盒子的最底层是color层，在color层上面是gradient层。color层和gradient层都是填充整个盒子。最后是image层，它的对齐方式右DecorationImage类控制",
      textAlign: TextAlign.center,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis, // 多出文字的出现方式
    );
  }
}
