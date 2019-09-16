import 'package:flutter_driver/flutter_driver.dart';
import 'package:flutter_test/flutter_test.dart';


void main(){
  group('App', (){
    FlutterDriver driver;

    setUpAll(() async { // 开始连接
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async { // 断开连接
      if (driver != null) {
        driver.close();
      }
    });

  });

}