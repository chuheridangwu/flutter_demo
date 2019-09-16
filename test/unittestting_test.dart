import 'package:flutter_demo/demo/test/test.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  test('should return hello +something', (){
    var string = UnittestingDemo.greet('ninghao');
    expect(string, 'hello ninghao');
  });
}