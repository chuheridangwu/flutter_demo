import 'package:flutter/material.dart';

class FromDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        // 覆盖之前的主题
        data: Theme.of(context).copyWith(
          primaryColor: Colors.black,
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterFrom(),
            ],
          ),
        ),
      ),
    );
  }
}


class RegisterFrom extends StatefulWidget {
  @override
  _RegisterFromState createState() => _RegisterFromState();
}

class _RegisterFromState extends State<RegisterFrom> {
  @override
  Widget build(BuildContext context) {
    return Form( // 表单，提供校验的功能
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: InputDecoration(
                labelText: 'userName',
              ),
            ),
            TextFormField(
              obscureText: true, //不显示文字，显示点
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            SizedBox(height: 22.0,),
            Container(
              width: double.infinity, //最大宽度
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                child: Text('Regiser',style:TextStyle(color: Colors.white)),
                elevation: 0.0,
                onPressed: (){

                },
              ),
            )
          ],
        ),
    );
  }
}

// TextField的基本使用方法
class TextFleldDemo extends StatefulWidget {
  @override
  _TextFleldDemoState createState() => _TextFleldDemoState();
}

class _TextFleldDemoState extends State<TextFleldDemo> {
  final textEditingController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    textEditingController.text = '~hi'; // 设置初始化文字
    textEditingController.addListener(() {
      debugPrint('inut: ${textEditingController.text}');
    });
  }

  @override
  void dispose() {
    textEditingController.dispose(); //需要主动销毁掉，不销毁会消耗资源
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      // onChanged: (value){
      //   print('input: $value');
      // },
      onSubmitted: (value) {
        print('submit: $value');
      },
      decoration: InputDecoration(
        //TextField的装饰效果
        icon: Icon(Icons.subject),
        labelText: 'Title', // 输入框顶部文字
        hintText: 'enter the post title', // 占位文字
        // border: InputBorder.none, //不显示文本框下面那条线
        // border: OutlineInputBorder(),
        filled: true, // 文本框显示背景颜色
      ),
    );
  }
}

// 设置主题颜色
class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
