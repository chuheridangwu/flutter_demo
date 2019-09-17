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
  PublishSubject<String> _textFieldSubject;

  @override
  void initState() {
    super.initState();
    _textFieldSubject = PublishSubject<String>();
    _textFieldSubject
    // .map((item) => 'item: $item')
    // .where((item) => item.length > 9)
    .debounceTime(Duration(milliseconds: 500))
    .listen((data) => print(data));
    // Observable<String> _observable =
    // Observable(Stream.fromIterable(['hello','你好']));
    // Observable.fromFuture(Future.value('hello~'));
    // Observable.fromIterable(['nihao','hello~']);
    // Observable.just('hello~');
    // Observable.periodic(Duration(seconds: 3),(x) => x.toString()); //间隔三秒，调用一次值，X是重复的次数
    // _observable.listen(print);

    // PublishSubject<String> _subject = PublishSubject<String>();
    // BehaviorSubject<String> _subject =
    // BehaviorSubject<String>(); //BehaviorSubject: 最后创建的监听会当成第一次创建的监听
    // ReplaySubject<String> _subject = ReplaySubject<String>(maxSize: 2); // ReplaySubject: 会把虽有的监听都交给监听器,设置最大接受数后，只能接受最后的最大数据

    // _subject.add('hello');
    // _subject.add('hola');
    // _subject.add('hi');
    // _subject.listen((data) => print('listen 1: $data'));
    // _subject.listen((data) => print('listen 2: ${data.toUpperCase()}'));
    // _subject.close();
  }

  @override
  void dispose() {
    super.dispose();
    _textFieldSubject.close();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        primaryColor: Colors.black,
      ),
      child: TextField(
        onChanged: (value) {
          _textFieldSubject.add('input: $value');
        },
        onSubmitted: (value) {
          _textFieldSubject.add('submit: $value');
        },
        decoration: InputDecoration(
          labelText: 'Title',
          filled: true,
        ),
      ),
    );
  }
}
