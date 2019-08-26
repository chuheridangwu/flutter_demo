import 'package:flutter/material.dart';

class CheckBoxDemo extends StatefulWidget {
  @override
  _CheckBoxDemoState createState() => _CheckBoxDemoState();
}

class _CheckBoxDemoState extends State<CheckBoxDemo> {
  bool _checkBoxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CheckBoxDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CheckboxListTile(
              title: Text('CheckBoxItemA'),
              subtitle: Text('desc'),
              onChanged: (value){
                setState(() {
                  _checkBoxItemA = value;
                });
              },
              value: _checkBoxItemA,
              selected: _checkBoxItemA, //是否有选中状态
              secondary: Icon(Icons.add_alarm),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[],
            ),
          ],
        ),
      ),
    );
  }
}

class CheckBoxBasis extends StatefulWidget {
  @override
  _CheckBoxBasisState createState() => _CheckBoxBasisState();
}

class _CheckBoxBasisState extends State<CheckBoxBasis> {
  bool _checkBoxItemA = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Checkbox(
        value: _checkBoxItemA,
        onChanged: (value) {
          setState(() {
            _checkBoxItemA = value;
          });
        },
        activeColor: Colors.blue,
      ),
    );
  }
}
