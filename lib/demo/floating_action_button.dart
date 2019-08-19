// 悬浮按钮 FloatingActionButton 的基础使用
import 'package:flutter/material.dart';

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      //图标漂浮按钮
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.black87,
      shape: BeveledRectangleBorder(
        // 改变形状
        borderRadius: BorderRadius.circular(30.0), //切角
      ),
    );

    final _floatingActionButtonExtended = FloatingActionButton.extended(
      //漂浮动作按钮
      onPressed: () {},
      label: Text('add'),
      icon: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //漂浮按钮的位置
      bottomNavigationBar: BottomAppBar(
        // 底部工具栏
        child: Container(
          height: 80,
        ),
        shape: CircularNotchedRectangle(), // 切出一个悬浮按钮的图形
      ),
    );
  }
}
