import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme( // 覆盖之前的主题
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: ThemeDemo(),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color:Theme.of(context).accentColor,
    );
  }
}