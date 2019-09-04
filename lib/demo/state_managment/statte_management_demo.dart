import 'package:flutter/material.dart';

class StateManagementDemo extends StatefulWidget {
  @override
  _StateManagementDemoState createState() => _StateManagementDemoState();
}

class _StateManagementDemoState extends State<StateManagementDemo> {
  int _count = 0;

  void _increaseCount() {
    setState(() {
      _count += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StateManagementDemo'),
        elevation: 0.0,
      ),
      body: CounterWrapper(_count, _increaseCount),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _increaseCount,
      ),
    );
  }
}

class CounterWrapper extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount; // 回调
  CounterWrapper(this.count, this.increaseCount); //构造函数

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(count, increaseCount),
    );
  }
}

// 子类，传递数据
class Counter extends StatelessWidget {
  final int count;
  final VoidCallback increaseCount; // 回调
  Counter(this.count, this.increaseCount); //构造函数

  @override
  Widget build(BuildContext context) {
    return ActionChip(
        label: Text('$count'),
        onPressed: increaseCount,
    );
  }
}
