import 'package:flutter/material.dart';

class ChipDemo extends StatefulWidget {
  @override
  _ChipDemoState createState() => _ChipDemoState();
}

class _ChipDemoState extends State<ChipDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ChipDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Wrap(
              spacing: 8.0, // item之间的间隔
              runSpacing: 8.0, // 行与行之间的间隔
              children: <Widget>[
                Chip(
                  label: Text('Life'),
                ),
                Chip(
                  label: Text('Sunset'),
                  backgroundColor: Colors.orange,
                ),
                Chip(
                  label: Text('Demo'),
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text('喵'),
                  ),
                ),
                Chip(
                  label: Text('Demo'),
                  avatar: CircleAvatar(
                    child: Text('喵'),
                    backgroundImage: NetworkImage(
                        'https://resources.ninghao.net/images/overkill.png'),
                  ),
                ),
                Divider(color: Colors.grey,indent: 12.0,) //缩进
              ],
            ),
          ],
        ),
      ),
    );
  }
}
