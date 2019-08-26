import 'package:flutter/material.dart';

class SwitchDemo extends StatefulWidget {
  @override
  _SwitchDemoState createState() => _SwitchDemoState();
}

class _SwitchDemoState extends State<SwitchDemo> {
  bool _switchItemA = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SwitchDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SwitchListTile(
              value: _switchItemA,
              onChanged: (value){
                setState(() {
                  _switchItemA = value;
                });
              },
              title: Text('switch item A'),
              subtitle: Text('desc'),
              secondary: Icon(_switchItemA ? Icons.vibration : Icons.videocam),
              selected:  _switchItemA,
            ),
            SizedBox(height: 12),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Switch(
                  value: _switchItemA,
                  onChanged: (value){
                    setState(() {
                      _switchItemA = value;
                    });
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}