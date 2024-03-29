import 'package:flutter/material.dart';
import 'package:flutter_demo/demo/bloc/bloc_demo.dart';
import 'package:flutter_demo/demo/from_demo.dart';
import 'package:flutter_demo/demo/state_managment/statte_management_demo.dart';
import 'package:flutter_demo/demo/rxdart/rxdart_demo.dart';
import 'package:flutter_demo/model/post.dart';
import './demo/listview_demo.dart';
import './demo/bottom_navigation_bar_demo.dart';
import './demo/basic_demo.dart';
import './demo/layout_demo.dart';
import './demo/view_demo.dart';
import './demo/sliver_demo.dart';
import './demo/navigator_demo.dart';
import './demo/material_components.dart';
import './demo/popup_menu_btn_demo.dart';
import './demo/state_managment/statte_management_demo.dart';
import './demo/stream/stream_demo.dart';
import './demo/rxdart/rxdart_demo.dart';
import './demo/bloc/bloc_demo.dart';
import './demo/http/http_demo.dart';
import './demo/animation/animation_demo.dart';
import './demo/i18n/i18n_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import './demo/i18n/map/localization_demo.dart';


void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: Locale('en','US'), //默认配置
      localeResolutionCallback: (Locale local,Iterable<Locale> supportedLocal){
        return Locale('zh','CN');
      },
      localizationsDelegates: [
        LocalizationsDemoDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [ //支持的语言
          Locale('en','US'),
          Locale('zh','CN')
      ],
        debugShowCheckedModeBanner: false,
        // showSemanticsDebugger: true,
        // home: NavigatorDemo(),
        initialRoute: '/i18n',
        routes: {
          '/about': (context) => Page(
                title: 'About',
              ),
          '/': (context) => Home(),
          '/mdc': (context) => MaterialComponents(),
          '/state_management':(context) => StateManagementDemo(),
          '/stream': (context) => StreamDemo(),
          '/rxdart': (context) => RxDartdemo(),
          '/bloc': (context) => BlocDemo(),
          '/http': (context) => HttpDemo(),
          '/animation': (context) => AnimationDemo(),
          '/i18n': (context) => I18nDemo(),
        },
        theme: ThemeData(
          // 主题
          primarySwatch: Colors.yellow,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5), //按钮点击高亮颜色
          splashColor: Colors.white60, // 水波纹颜色
          accentColor: Color.fromRGBO(3, 54, 255, 1.0),
        ));
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true, // 文字是否居中
          title: Text('Demo',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              )),
          elevation: 0.0, //导航栏下的阴影长度
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () {
                debugPrint('click search');
              },
            ),
            IconButton(
              icon: Icon(Icons.more_horiz),
              tooltip: 'horize',
              onPressed: () {},
            ),
          ],
          bottom: TabBar(
            unselectedLabelColor: Colors.black38, //标签未选中颜色
            indicatorColor: Colors.black54, //标签底部横线选中的颜色
            indicatorSize: TabBarIndicatorSize.label, //标签底部横线大小
            indicatorWeight: 1.0, //标签底部横线高度
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.local_florist),
              ),
              Tab(
                icon: Icon(Icons.change_history),
              ),
              Tab(
                icon: Icon(Icons.directions_bike),
              ),
              Tab(
                icon: Icon(Icons.view_quilt),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo(),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text('wanghao',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                accountEmail: Text('test@163.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(posts[0].imageUrl),
                ),
                decoration: BoxDecoration(
                  color: Colors.yellow[400],
                  image: DecorationImage(
                    image: NetworkImage(posts[1].imageUrl),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.yellow[400].withOpacity(0.6),
                        BlendMode.hardLight), //滤镜效果
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'Message',
                  textAlign: TextAlign.right,
                ),
                trailing: Icon(
                  Icons.message,
                  color: Colors.black12,
                  size: 22.0,
                ),
                onTap: () => Navigator.pop(context),
              ),
              ListTile(
                  title: Text(
                    'Favorite',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.favorite,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: Text(
                    'Settings',
                    textAlign: TextAlign.right,
                  ),
                  trailing: Icon(
                    Icons.settings,
                    color: Colors.black12,
                    size: 22.0,
                  ),
                  onTap: () => Navigator.pop(context)),
            ],
          ),
        ),
        endDrawer: null,
        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
