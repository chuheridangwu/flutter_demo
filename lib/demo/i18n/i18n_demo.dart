import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/i18n/map/localization_demo.dart';

class I18nDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Locale local = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18nDemo'),
        elevation: 0.0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(local.toString()), // 打印本地语言和地区
          Text(
            Localizations.of(context, LocalizationsDemo).title,
            style: Theme.of(context).textTheme.title,
          ),
          Text(LocalizationsDemo.of(context).title),
        ],
      ),
    );
  }
}