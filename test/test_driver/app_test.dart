import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_driver/flutter_driver.dart' as prefix0;
import 'package:flutter_test/flutter_test.dart';


void main(){
  group('App', (){
    FlutterDriver driver;

    final actionChip = prefix0.find.byValueKey('actionChip');
    final actionChipLabelText = prefix0.find.byValueKey('actionChipLabelText');


    setUpAll(() async { // 开始连接
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async { // 断开连接
      if (driver != null) {
        driver.close();
      }
    });

    test('start at 0', () async {
      expect(await driver.getText(actionChipLabelText), '0');
    });

    test('increments the counter', () async {
      await driver.tap(actionChip);
      expect(await driver.getText(actionChipLabelText), '1');
    });

  });
  

}