import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/test/test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('should return hello +something', () {
    var string = UnittestingDemo.greet('ninghao');
    expect(string, 'hello ninghao');
  });

  testWidgets('wisget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: TestDemo(),
    ));
    final labelText = find.text('Hello');
    // expect(labelText,  findsOneWidget); // 断言，只有一个文字是‘hello’的小部件
    expect(labelText, findsNWidgets(1)); // 断言，只有一个文字是‘hello’的小部件



    // 获取chip的点击测试
    final actionChipLabelText = find.text('0'); // text为0只有一次
    expect(actionChipLabelText, findsOneWidget);

    final actionchip = find.byType(ActionChip); // 获取到点击的chip
    await tester.tap(actionchip); // 点击
    await tester.pump(); //重建chip

    final actionChipLabelTextAfterTap = find.text('1');
    expect(actionChipLabelTextAfterTap, findsOneWidget); // label的文字会变成1，且只有一次
    expect(actionChipLabelText, findsNothing); //之前的label没有了


  });
}
