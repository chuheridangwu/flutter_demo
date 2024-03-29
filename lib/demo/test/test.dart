import 'package:flutter/material.dart';

class TestDemo extends StatefulWidget {
  @override
  _TestDemoState createState() => _TestDemoState();
}

class _TestDemoState extends State<TestDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TestDemo'),
      ),
      body: TestDemoHome(),
    );
  }
}

// 单元格测试
class UnittestingDemo {
  static greet(String name) {
    return 'hello $name';
  }
}

// 小部件测试
class TestDemoHome extends StatefulWidget {
  @override
  _TestDemoHomeState createState() => _TestDemoHomeState();
}

class _TestDemoHomeState extends State<TestDemoHome> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Chip(
          label: Text('Hello'),
        ),
        ActionChip(
          label: Text('$_count'),
          onPressed: () {
            setState(() {
              _count++;
            });
          },
        )
      ],
    );
  }
}
