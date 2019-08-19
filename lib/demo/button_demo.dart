
import 'package:flutter/material.dart';

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
    final Widget raisedButtomDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              // 覆盖主题某几个特定的值
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                // 重新创建button主题
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder( //改变主题形状
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                shape: StadiumBorder(), // 椭圆形状
              )),
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
    final Widget outlineButtonDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
              // 覆盖主题某几个特定的值
              buttonColor: Theme.of(context).accentColor,
              buttonTheme: ButtonThemeData(
                // 重新创建button主题
                textTheme: ButtonTextTheme.primary,
                // shape: BeveledRectangleBorder( //改变主题形状
                //   borderRadius: BorderRadius.circular(5.0),
                // ),
                shape: StadiumBorder(), // 椭圆形状
              )),
          child: OutlineButton(
            child: Text('Buttom'),
            onPressed: () {},
            splashColor: Colors.grey,
            textColor: Colors.black,
            color: Theme.of(context).accentColor, // 背景颜色
            // textTheme: ButtonTextTheme.primary, //主题
            borderSide: BorderSide(
              //边框颜色
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
    final Widget fixedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 130.0,
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
          ),
        )
      ],
    );

    // Expanded 占满可用屏幕的 按钮
    final Widget expandedWidthButton = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          flex: 2, // 占用空间的比例
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
          ),
        ),
        SizedBox(
          width: 12.0,
        ),
        Expanded(
          child: OutlineButton(
            onPressed: () {},
            child: Text('Button'),
          ),
        ),
      ],
    );

    // 一组带边距的横排显示按钮
    final Widget buttonBarDemo = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Theme(
          data: Theme.of(context).copyWith(
            buttonTheme: ButtonThemeData(
              padding: EdgeInsets.symmetric(horizontal: 22.0), // 可以控制 ButtonBar之间的按钮间距
            )
          ),
          child:ButtonBar( //ButtonBar的边距根据 主题边距设定
            children: <Widget>[
              OutlineButton(
                onPressed: (){},
                child: Text('button'),
              ),
               OutlineButton(
                onPressed: (){},
                child: Text('button'),
              ),
               OutlineButton(
                onPressed: (){},
                child: Text('button'),
              ),
            ],
          ) ,
        ),
          
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
            raisedButtomDemo,
            outlineButtonDemo,
            fixedWidthButton,
            expandedWidthButton,
            buttonBarDemo,
          ],
        ),
      ),
    );
  }
}
