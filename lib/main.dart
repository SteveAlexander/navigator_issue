import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  GlobalKey<NavigatorState> parentNavKey = GlobalKey<NavigatorState>(
    debugLabel: 'parentNavKey'
  );

  GlobalKey page1key = GlobalKey(debugLabel: 'page1key');
  GlobalKey page2key = GlobalKey(debugLabel: 'page2key');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Navigator(
        key: parentNavKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case '1': return MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (_) => Navigator(
                key: page1key,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  settings: settings,
                  builder: (_) => Center(child: Text('Page 1'))
                )
              )
            );
            case '2': return MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (_) => Navigator(
                key: page1key,
                onGenerateRoute: (settings) => MaterialPageRoute(
                  settings: settings,
                  builder: (_) => Center(child: Text('Page 2'))
                )
              )
            );
            default: return MaterialPageRoute(
              settings: RouteSettings(isInitialRoute: true),
              builder: (_) => Center(child: Text('Initial page'))
            );
          }
        }
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlatButton(
              onPressed: () =>
                  parentNavKey.currentState.pushReplacementNamed('1'),
              color: Colors.grey,
              child: Text('1')
            ),
            FlatButton(
              onPressed: () =>
                  parentNavKey.currentState.pushReplacementNamed('2'),
              color: Colors.grey,
              child: Text('2')
            )
          ]
        )
      ),
    );
  }
}
