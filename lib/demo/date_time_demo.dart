import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  final DateTime selectedDate = DateTime.now();

_selectedDate(){
  showDatePicker(
    context: context,
    initialDate: selectedDate,
    firstDate: DateTime(1990), //最早的日期
    lastDate: DateTime(2100), //最晚的日期
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DateTimeDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
               InkWell(
                 onTap: _selectedDate,
                 child: Row(
                   children: <Widget>[
                    Text(DateFormat.yMd().format(selectedDate)),
                    Icon(Icons.arrow_drop_down),
                   ],
                 ),
               ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}