import 'package:flutter/material.dart';


// 主轴： row 是横着的主轴 column是竖着的主轴,主轴有多个对齐的方式
// 交叉轴: 主轴 对应的轴
class LayoutDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, //主轴, 有多个对齐方式
        // crossAxisAlignment: CrossAxisAlignment.center,  // 交叉轴方式
        children: <Widget>[
          SizedBox(
            width: 100.0,
            height: 100.0,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(Icons.ac_unit,color:Colors.white,size:32.0),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: 200.0,
            height: 200.0,
            child: Container(
              alignment: Alignment(-0.5,0),
              child: Icon(Icons.access_time,color:Colors.white),
              decoration: BoxDecoration(
                color: Color.fromRGBO(3, 53, 255, 1.0),
                borderRadius: BorderRadius.circular(2.0)
              ),
            ),
          )
        ],
      ),
    );
  }
}

class IconBadge extends StatelessWidget {
  final IconData icon;
  final double size;
  IconBadge(this.icon,{
    this.size = 32.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Icon(icon,size:size,color:Colors.white),
      width: size + 60,
      height: size + 60,
      color: Color.fromRGBO(3, 54, 255, 1.0),
    );
  }
}