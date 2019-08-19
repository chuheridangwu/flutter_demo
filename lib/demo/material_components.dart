import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton( //图标漂浮按钮
      onPressed: (){},
      child: Icon(Icons.add),
      backgroundColor: Colors.black87,
      shape: BeveledRectangleBorder( // 改变形状
        borderRadius: BorderRadius.circular(30.0), //切角
      ),
    );

    final _floatingActionButtonExtended = FloatingActionButton.extended( //漂浮动作按钮
        onPressed: (){},
        label: Text('add'),
        icon: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, //漂浮按钮的位置
      bottomNavigationBar: BottomAppBar( // 底部工具栏
        child: Container(
          height: 80,
        ),
        shape:  CircularNotchedRectangle(),
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
