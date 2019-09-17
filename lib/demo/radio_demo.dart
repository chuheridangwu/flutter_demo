import 'package:flutter/material.dart';

// 单选按钮
class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
  int _radioGroupA = 0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RadioDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('radioGroupA: $_radioGroupA'),
            SizedBox(height: 12),
            RadioListTile(
              value: 0,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text("RadioListTileItemA"),
              subtitle: Text('Desc'),
              selected: _radioGroupA == 0,
              secondary: Icon(Icons.add_to_photos),
            ),
             RadioListTile(
              value: 1,
              groupValue: _radioGroupA,
              onChanged: _handleRadioValueChanged,
              title: Text("RadioListTileItemB"),
              subtitle: Text('Desc'),
              selected: _radioGroupA == 1,
              secondary: Icon(Icons.alarm_off),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RadioBasis(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RadioBasis extends StatefulWidget {
  @override
  _RadioBasisState createState() => _RadioBasisState();
}

class _RadioBasisState extends State<RadioBasis> {
  int _radioGroupA = 0;
  void _handleRadioValueChanged(int value) {
    setState(() {
      _radioGroupA = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Radio(
            onChanged: _handleRadioValueChanged,
            value: 0,
            activeColor: Colors.black,
            groupValue: _radioGroupA,
          ),
          Radio(
            onChanged: _handleRadioValueChanged,
            value: 1,
            activeColor: Colors.black,
            groupValue: _radioGroupA,
          ),
        ],
      ),
    );
  }
}
