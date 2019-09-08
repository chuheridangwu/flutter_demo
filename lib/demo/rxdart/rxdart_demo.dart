import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';

class RxDartdemo extends StatefulWidget {
  @override
  _RxDartdemoState createState() => _RxDartdemoState();
}

class _RxDartdemoState extends State<RxDartdemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RxDartdemo'),
      ),
      body: RxDartDemoHome(),
    );
  }
}

class RxDartDemoHome extends StatefulWidget {
  @override
  _RxDartDemoHomeState createState() => _RxDartDemoHomeState();
}

class _RxDartDemoHomeState extends State<RxDartDemoHome> {
  @override
  void initState() {
    super.initState();
      // Observable<String> _observable = 
      // Observable(Stream.fromIterable(['hello','你好']));
      // Observable.fromFuture(Future.value('hello~'));
      // Observable.fromIterable(['nihao','hello~']);
      // Observable.just('hello~');
      // Observable.periodic(Duration(seconds: 3),(x) => x.toString()); //间隔三秒，调用一次值，X是重复的次数
      // _observable.listen(print);
      
    PublishSubject<String> _subject = PublishSubject<String>();
    _subject.listen((data) => print('listen 1: $data'));
    _subject.add('hello');
    _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    _subject.add('hola');
    _subject.close();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}