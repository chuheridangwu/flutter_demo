import 'package:flutter/material.dart';

class SliderDemo extends StatefulWidget {
  @override
  _SliderDemoState createState() => _SliderDemoState();
}

class _SliderDemoState extends State<SliderDemo> {
  double _sliderValue = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SliderDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_sliderValue'),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Slider(
                  value: _sliderValue,
                  onChanged: (value) {
                    setState(() {
                      _sliderValue = value;
                    });
                  },
                  min: 0.0,
                  max: 10.0,
                  divisions: 10,
                  label: '${_sliderValue.toInt()}',
                  activeColor: Theme.of(context).accentColor,
                  inactiveColor: Theme.of(context).accentColor.withOpacity(0.3),
                )
              ],
            ),
          ],
        ),
      ),
    );
    ;
  }
}
