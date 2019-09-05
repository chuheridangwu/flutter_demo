import 'dart:async';

import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {

  StreamSubscription _streamDemoSubscription;
  StreamController<String> _streamDemo;
  StreamSink _sinkDemo;
  String _data = '...';

  @override
  void dispose() {
    _streamDemo.close();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    print('Create a stream');
    // 创建一个Stream
    // Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    // 创建一个StreamController
    _streamDemo = StreamController.broadcast();
    _sinkDemo = _streamDemo.sink;

    print('Start listening on a stream');
    // 监听Stream
    _streamDemoSubscription =
        _streamDemo.stream.listen(onData, onDone: onDone, onError: onError);

    print('Initialize completed.');
  }

  // 有数据返回
  void onData(String data) {
    print('$data');
    setState(() {
      _data = data;
    });
  }

  // 加载完成
  void onDone() {
    print('Done!');
  }

  // 加载有错误
  void onError(error) {
    print('Error: $error');
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 5));
    // throw 'something happened'; // 做一个异常
    return 'hello~ ...';
  }

  void _pauseStream() {
    print('Pause subscription');
    _streamDemoSubscription.pause();
  }

  void _resumeStream() {
    print('Resume subscription');
    _streamDemoSubscription.resume();
  }

  void _cancemStream() {
    print('Cancel subscription');
    _streamDemoSubscription.cancel();
  }

  void _addDataToStream() async {
    print('add data to Stream');
    String data = await fetchData();
    // _streamDemo.add(data);
    _sinkDemo.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Text: $_data'),
            StreamBuilder(
              stream: _streamDemo.stream ,
              initialData: 'initialData' ,
              builder: (BuildContext context, AsyncSnapshot snapshot){
                return Text('StreamBuilder: ${snapshot.data}');
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  child: Text('addStream'),
                  onPressed: _addDataToStream,
                ),
                FlatButton(
                  child: Text('Pause'),
                  onPressed: _pauseStream,
                ),
                FlatButton(
                  child: Text('Resume'),
                  onPressed: _resumeStream,
                ),
                FlatButton(
                  child: Text('Camcel'),
                  onPressed: _cancemStream,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
