//Bloc是一套反应式应用架构，就是把一些应用逻辑拿出来单独放到一个类里面，用到Stream/RxDart/

import 'package:flutter/material.dart';
import './counter_bloc_demo.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CounterProvider(
      bloc: CounterBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('BlocDemo'),
          elevation: 0.0,
        ),
        body: CounterHome(),
        floatingActionButton: CounterActionButton(),
      ),
    );
  }
}
