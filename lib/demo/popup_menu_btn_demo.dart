import 'package:flutter/material.dart';

class PopupMenuButtonDemo extends StatefulWidget {
  @override
  _PopupMenuButtonDemoState createState() => _PopupMenuButtonDemoState();
}

class _PopupMenuButtonDemoState extends State<PopupMenuButtonDemo> {
  String _seleveVlaue = 'home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopupMenuButtonDemo'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(_seleveVlaue),
                PopupMenuButton(
                  onSelected: (value) {
                    print(value);
                    setState(() {
                      _seleveVlaue = value;
                    });
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('home'),
                      value: 'home',
                    ),
                    PopupMenuItem(
                      child: Text('discove'),
                      value: 'discove',
                    ),
                    PopupMenuItem(
                      child: Text('compnay'),
                      value: 'compnay',
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
