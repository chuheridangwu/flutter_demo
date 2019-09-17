import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class StateManagementDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
        model: CounterModel(),
        child: Scaffold(
            appBar: AppBar(
              title: Text('StateManagementDemo'),
              elevation: 0.0,
            ),
            body: CounterWrapper(),
            floatingActionButton: ScopedModelDescendant<CounterModel>(
              rebuildOnChange: false, // 值发生改变时会重建小部件，如果不希望重建，可以设置为false
              builder: (context, _, model) => FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: model.increaseCount,
              ),
            )));
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
    return ScopedModelDescendant<CounterModel>(
      builder: (context, _, model) => ActionChip(
        label: Text('${model._count}'),
        onPressed: model.increaseCount,
      ),
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

// 使用scoped_model 第三方进行跨widget传值
class CounterModel extends Model {
  int _count = 0;
  int get count => _count;

  void increaseCount() {
    // 回调
    _count += 1;
    notifyListeners(); // 通知值进行改变
  }
}
