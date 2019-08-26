import 'package:flutter/material.dart';
import 'button_demo.dart';
import 'floating_action_button.dart';
import 'popup_menu_btn_demo.dart';
import 'from_demo.dart';
import 'check_box_demo.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MaterialComponents'),
        elevation: 0.0,
      ),
      body: ListView(
        children: <Widget>[
          ListItem(
              title: 'FloatingActionButtonDemo',
              page: FloatingActionButtonDemo()),
          ListItem(title: 'Button', page: ButtonDemo()),
          ListItem(title: 'PopMenuButton', page: PopupMenuButtonDemo()),
          ListItem(title: 'fromDemo', page: FromDemo()),
          ListItem(title: 'checkBox', page: CheckBoxDemo()),
        ],
      ),
    );
  }
}

class _widgetDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('_widgetDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
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

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;
  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
