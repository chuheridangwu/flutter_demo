import 'package:flutter/material.dart';

// 单选按钮
class RadioDemo extends StatefulWidget {
  @override
  _RadioDemoState createState() => _RadioDemoState();
}

class _RadioDemoState extends State<RadioDemo> {
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
