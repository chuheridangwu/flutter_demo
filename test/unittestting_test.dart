import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/test/test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('should return hello +something', (){
    var string = UnittestingDemo.greet('ninghao');
    expect(string, 'hello ninghao');
  });

  testWidgets('wisget testing demo', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: TestDemo(),
      )
    );
    final labelText = find.text('Hello');
    // expect(labelText,  findsOneWidget); // 断言，只有一个文字是‘hello’的小部件
        expect(labelText,  findsNWidgets(1)); // 断言，只有一个文字是‘hello’的小部件

  });
}