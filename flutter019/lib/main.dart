import 'package:flutter/material.dart';
import 'model/post.dart';
import 'demo/ListView_demo.dart';
import 'demo/Drawer_demo.dart';
import 'demo/bottom_navigation_bar_demo.dart';
import 'demo/basic_demo.dart';
import 'demo/layout_demo.dart';
import 'demo/view_demo.dart';
import 'demo/sliver_demo.dart';
import 'demo/navigator_demo.dart';
import 'demo/form_demo.dart';
import 'demo/material_components.dart';
import 'demo/state/state_management_demo.dart';
import 'demo/state/scope_model_demo.dart';
import 'demo/stream/stream_demo.dart';
import 'demo/rxdart/rxdart_demo.dart';
import 'demo/bloc/bloc_demo.dart';
import 'demo/http/http_demo.dart';
import 'demo/animation/animation_demo.dart';
import 'demo/i18n/i18n_demo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'demo/i18n/map/localizations.dart';

void main() => runApp(App());



class App extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return MaterialApp(
        localizationsDelegates: [
          DemoLocalizationsDelegate(),
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en','US'),
          Locale('zh','CN')
        ],
        debugShowCheckedModeBanner: false,
        // home: Home(),
        // home:NavigatorDemo(),
        initialRoute: '/i18n',
        routes: {
          '/': (context) => Home(),
          '/about':(context) => Page(title: 'About',),
          '/form':(context)=> FormDemo(),
          '/mdc':(context) => MaterialConponents(),
          '/state-management':(context) => StateManagementDemo(),
          '/scope':(context) => ScopeModelDemo(),
          '/stream':(context) => StreamDemo(),
          '/rxdart':(context) => RxDartDemo(),
          '/bloc':(context)=> BlocDemo(),
          '/http':(context)=> HttpDemo(),
          '/animation':(context)=> AnimationDemo(),
          '/i18n':(context)=> I18nDemo(),
        },
        theme: ThemeData(
          primarySwatch: Colors.blue,
          highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
          splashColor: Colors.white70
        ),
      );
    }
}

class Home extends StatelessWidget{

  @override
    Widget build(BuildContext context) {
      
      // TODO: implement build
      return DefaultTabController(
        length: 4,
        child: Scaffold(
          backgroundColor: Colors.grey[100],
          appBar: AppBar(
            // leading: IconButton(
            //   icon: Icon(Icons.menu),
            //   tooltip: 'Navigation',
            //   onPressed: ()=>debugPrint('Navigation button is pressed.'),
            // ),
            title: Text('CrazyAndy'),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                tooltip: 'Search',
                onPressed: ()=>debugPrint('Search button is pressed.'),
              )
            ],
            elevation: 0.0,
            bottom: TabBar(
              unselectedLabelColor: Colors.black38,
              indicatorColor: Colors.black54,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 1.0,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.local_florist)),
                Tab(icon: Icon(Icons.change_history)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.view_quilt),)
              ],
            ),
          ),
          // body: ListViewDemo(),
          body: TabBarView(
            children: <Widget>[
              ListViewDemo(),
              BasicDemo(),
              LayoutDemo(),
              // ViewDemo(),
              SliverDemo()
            ],
          ),
          drawer: DrawerDemo(),
          bottomNavigationBar: BottomNavigationBarDemo() ,
        ),
      );
    }
}



class Hello extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'eee',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 50.0,
          fontWeight: FontWeight.bold,
          color: Colors.red,
        ),
      ),
    );
  }
}