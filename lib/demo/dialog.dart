import 'package:flutter/material.dart';
import 'dart:async';

enum SimpleDoaLogOption { A, B, C }
enum AlertDiaLogOption { Cancel, OK }

class DialogDemo extends StatefulWidget {
  @override
  _DialogDemoState createState() => _DialogDemoState();
}

class _DialogDemoState extends State<DialogDemo> {
  String _simple = 'nothing';
  //SimpleDialog
  _openSimpleDialog() async {
    final option = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('SimpleDialog'),
          children: <Widget>[
            SimpleDialogOption(
              child: Text('Option A'),
              onPressed: () {
                Navigator.pop(context, SimpleDoaLogOption.A);
              },
            ),
            SimpleDialogOption(
              child: Text('Option b'),
              onPressed: () {
                Navigator.pop(context, SimpleDoaLogOption.B);
              },
            ),
            SimpleDialogOption(
              child: Text('Option c'),
              onPressed: () {
                Navigator.pop(context, SimpleDoaLogOption.C);
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

  String _alert = 'nothing';
// alertDialog
  _openAlertDialog() async {
    final action = await showDialog(
        context: context,
        barrierDismissible: false, //必须点击弹窗才能关闭遮盖
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('AlertDiaLog'),
            content: Text('Are you sure about this?'),
            actions: <Widget>[
              FlatButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.pop(context, AlertDiaLogOption.Cancel);
                },
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.pop(context, AlertDiaLogOption.OK);
                },
              )
            ],
          );
        });
    switch (action) {
      case AlertDiaLogOption.OK:
        setState(() {
          _alert = 'OK';
        });
        break;
      case AlertDiaLogOption.Cancel:
        setState(() {
          _alert = 'cancel';
        });
        break;
      default:
    }
  }

// BottomSheet
  final _bottomSheetKey = GlobalKey<ScaffoldState>();
  _openBottomSheet() {
    _bottomSheetKey.currentState.showBottomSheet((BuildContext context) {
      return BottomAppBar(
        child: Container(
          height: 90.0,
          width: double.infinity,
          child: Row(
            children: <Widget>[
              Icon(Icons.pause_circle_outline),
              SizedBox(
                width: 16.0,
              ),
              Text('1:30 / 03:30'),
              Expanded(
                child: Text('Fix-you - Coldplay'),
              )
            ],
          ),
        ),
      );
    });
  }

  String _modelBottom = 'nothing';
  _openModelBottomSheet() async {
    final o = await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            height: 200,
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text('Option A'),
                  onTap: () {
                    Navigator.pop(context, 'A');
                  },
                ),
                ListTile(
                  title: Text('Option B'),
                  onTap: () {
                    Navigator.pop(context, 'B');
                  },
                ),
                ListTile(
                  title: Text('Option C'),
                  onTap: () {
                    Navigator.pop(context, 'C');
                  },
                ),
              ],
            ),
          );
        });
    setState(() {
      _modelBottom = o;
    });
  }

// SnackBar
  _openSnackBarBotton() {
    print('object');
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text('Processing....'),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ));
  }

  List<ExpansionPanelItem> _expansionPanelItems;

  Widget _openExpansionPanel() {
    print("_openExpansionPanel");
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _expansionPanelItems[index].isExpanded = !isExpanded;
        });
      },
      children: _expansionPanelItems.map((item){
        return ExpansionPanel(
            isExpanded: item.isExpanded,
            body: item.body,
            headerBuilder: (BuildContext context, isExpanded){
              return Container(
                padding: EdgeInsets.all(16.0),
                child: Text('${item.headerText}'),
              );
            }

        );
      }).toList(),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _expansionPanelItems = <ExpansionPanelItem>[
      ExpansionPanelItem(
        headerText: 'Panel A',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for A'),
        ),
        isExpanded: false,
      ),
       ExpansionPanelItem(
        headerText: 'Panel B',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for B'),
        ),
        isExpanded: false,
      ),
      ExpansionPanelItem(
        headerText: 'Panel C',
        body: Container(
          padding: EdgeInsets.all(16.0),
          width: double.infinity,
          child: Text('Content for C'),
        ),
        isExpanded: false,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _bottomSheetKey,
      appBar: AppBar(
        title: Text('DialogDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('ShowAlertDialog ->$_simple'),
              onPressed: _openSimpleDialog,
            ),
            FlatButton(
              child: Text('ShowAlertDialog ->$_alert'),
              onPressed: _openAlertDialog,
            ),
            FlatButton(
              child: Text('showBottomSheet'),
              onPressed: _openBottomSheet,
            ),
            FlatButton(
              child: Text('showModelBottomSheet ->$_modelBottom'),
              onPressed: _openModelBottomSheet,
            ),
            FlatButton(
              child: Text('showSnackBarBotton'),
              onPressed: _openSnackBarBotton,
            ),
            _openExpansionPanel(),
          ],
        ),
      ),
    );
  }
}

class ExpansionPanelItem {
  String headerText;
  Widget body;
  bool isExpanded;
  ExpansionPanelItem({
    this.body,
    this.headerText,
    this.isExpanded,
  });
}
