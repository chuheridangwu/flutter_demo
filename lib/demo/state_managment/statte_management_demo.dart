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
    return CounterProvider(
        count: _count,
        increateCount: _increaseCount,
        child: Scaffold(
          appBar: AppBar(
            title: Text('StateManagementDemo'),
            elevation: 0.0,
          ),
          body: CounterWrapper(),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: _increaseCount,
          ),
        ));
  }
}

class CounterWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Counter(),
    );
  }
}

// 子类，传递数据
class Counter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int count = CounterProvider.of(context).count;
    final VoidCallback increaseCount = CounterProvider.of(context).increateCount;
    return ActionChip(
      label: Text('$count'),
      onPressed: increaseCount,
    );
  }
}

// 传递数据的类
class CounterProvider extends InheritedWidget {
  final int count;
  final VoidCallback increateCount;
  final Widget child;

  CounterProvider({this.child, this.count, this.increateCount})
      : super(child: child); //构造函数
  // 获取数据
  static CounterProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(CounterProvider);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    //是否通知继承了这个小部件树的子部件
    return true;
  }
}
