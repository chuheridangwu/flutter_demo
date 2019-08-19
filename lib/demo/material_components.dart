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
          ListItem(title: 'Button', page: ButtonDemo()),
        ],
      ),
    );
  }
}

class ButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget flatButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          child: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey, // 按钮点击的渐末效果颜色
          textColor: Theme.of(context).accentColor,
        ),
        FlatButton.icon(
          icon: Icon(Icons.add),
          label: Text('Button'),
          onPressed: () {},
          splashColor: Colors.grey, // 按钮点击的渐末效果颜色
        ),
      ],
    );
    
    // RaisedButtom 有背景颜色、阴影、
    final Widget RaisedButtomDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith( // 覆盖主题某几个特定的值
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(  // 重新创建button主题
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder( //改变主题形状
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                shape: StadiumBorder(), // 椭圆形状
            )
          ),
          child: RaisedButton(
          child: Text('Buttom'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.white,
          color: Theme.of(context).accentColor, // 背景颜色
          // textTheme: ButtonTextTheme.primary, //主题
        ),
        ),
        SizedBox(
          width: 10.0,
        ),
        RaisedButton.icon(
          icon: Icon(Icons.add),
          label: Text('Buttom'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
          elevation: 12.0, //阴影高度
        ),
      ],
    );

     // OutlineButton 带边框的按钮 
    final Widget OutlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith( // 覆盖主题某几个特定的值
            buttonColor: Theme.of(context).accentColor,
            buttonTheme: ButtonThemeData(  // 重新创建button主题
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder( //改变主题形状
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                shape: StadiumBorder(), // 椭圆形状
            )
          ),
          child: OutlineButton(
          child: Text('Buttom'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Colors.black,
          color: Theme.of(context).accentColor, // 背景颜色
          // textTheme: ButtonTextTheme.primary, //主题
          borderSide: BorderSide( //边框颜色
            color: Colors.black,
          ),
        ),
        ),
        SizedBox(
          width: 10.0,
        ),
        OutlineButton.icon(
          icon: Icon(Icons.add),
          label: Text('Buttom'),
          onPressed: () {},
          splashColor: Colors.grey,
          textColor: Theme.of(context).accentColor,
        ),
      ],
    );

    // 固定宽度的按钮
    final Widget FixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            onPressed: (){},
            child: Text('Button'),
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('ButtonDemo'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            flatButtonDemo,
            RaisedButtomDemo,
            OutlineButtonDemo,
            FixedWidthButton,
          ],
        ),
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

// 悬浮按钮 FloatingActionButton 的基础使用
class FloatingActionButtonDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Widget _floatingActionButton = FloatingActionButton(
      //图标漂浮按钮
      onPressed: () {},
      child: Icon(Icons.add),
      backgroundColor: Colors.black87,
      shape: BeveledRectangleBorder(
        // 改变形状
        borderRadius: BorderRadius.circular(30.0), //切角
      ),
    );

    final _floatingActionButtonExtended = FloatingActionButton.extended(
      //漂浮动作按钮
      onPressed: () {},
      label: Text('add'),
      icon: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('FloatingActionButtonDemo'),
      ),
      floatingActionButton: _floatingActionButton,
      floatingActionButtonLocation:
          FloatingActionButtonLocation.centerDocked, //漂浮按钮的位置
      bottomNavigationBar: BottomAppBar(
        // 底部工具栏
        child: Container(
          height: 80,
        ),
        shape: CircularNotchedRectangle(), // 切出一个悬浮按钮的图形
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
