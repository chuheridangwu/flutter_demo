import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:async';

class DateTimeDemo extends StatefulWidget {
  @override
  _DateTimeDemoState createState() => _DateTimeDemoState();
}

class _DateTimeDemoState extends State<DateTimeDemo> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay(hour: 9,minute: 5);

  _selectedDate() async {
    final DateTime date = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1990), //最早的日期
      lastDate: DateTime(2100), //最晚的日期
    );
    if (date == null) return;
    setState(() {
      selectedDate = date;
    });
  }

  _selectedTime() async {
    final TimeOfDay time = await showTimePicker(
      context: context,
      initialTime: selectedTime
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
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
                InkWell(
                  onTap: _selectedTime,
                  child: Row(
                    children: <Widget>[
                      Text(selectedTime.format(context))
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
