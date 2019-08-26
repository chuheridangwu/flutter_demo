import 'package:flutter/material.dart';
import 'dart:async';

enum SimpleDoaLogOption{
  A,B,C
}

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
String _simple = 'nothing';
  //SimpleDialog
  _openSimpleDialog() async {
    final option = await  showDialog(
      context: context,
      builder: (BuildContext context){
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: (){
                Navigator.pop(context,SimpleDoaLogOption.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Option b'),
              onPressed: (){
                Navigator.pop(context,SimpleDoaLogOption.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Option c'),
              onPressed: (){
                Navigator.pop(context,SimpleDoaLogOption.C);
              },
            ),
          ],
        );
      },
    );

  switch (option) {
    case SimpleDoaLogOption.A:
      setState(() {
        _simple = 'selected: A';
      });
      break;
      case SimpleDoaLogOption.B:
       setState(() {
        _simple = 'selected: B';
      });
      break;
      case SimpleDoaLogOption.C:
       setState(() {
        _simple = 'selected: C';
      });
      break;
    default:
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DialogDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InkWell(
              onTap: _openSimpleDialog,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('ShowSimpleDialog ->$_simple',)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}