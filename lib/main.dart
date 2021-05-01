import 'package:ClothWare/models/Cart.dart';
import 'package:ClothWare/widgets/CartPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/HomePage.dart';
import 'widgets/BottomBar.dart';
import 'widgets/MenuDrawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  static Cart cart = Cart();
  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  ThemeData lightTheme = ThemeData(
    primaryColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
  );
  ThemeData darkTheme = ThemeData(
    primaryColor: Colors.grey[900],
    backgroundColor: Colors.grey[700],
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.white)),
  );
  ThemeData theme = ThemeData(
    primaryColor: Colors.lightBlue,
    backgroundColor: Colors.white,
    textTheme: TextTheme(bodyText1: TextStyle(color: Colors.black)),
  );
  Color appBarColor;
  bool _switchValue = false;
  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }

  void themeChange() {
    setState(() {
      if (_switchValue) {
        theme = darkTheme;
        appBarColor = Colors.grey[900];
      } else {
        theme = lightTheme;
        appBarColor = Colors.lightBlue;
      }
    });
  }

  Widget build(BuildContext context) {
    //func();
    return MaterialApp(
        theme: theme,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            title: Text("ClothWare"),
            backgroundColor: appBarColor,
            leading: TextButton(
              onPressed: _openDrawer,
              child: Icon(Icons.menu),
            ),
            actions: [
              CupertinoSwitch(
                activeColor: Colors.white,
                trackColor: Colors.black,
                value: _switchValue,
                onChanged: (value) {
                  _switchValue = value;
                  themeChange();
                },
              )
            ],
          ),
          drawer: MenuDrawer(),
          body: HomePage(),
          bottomNavigationBar: BottomBar(),
          floatingActionButton: Builder(
            builder: (context) => FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartPage()));
              },
              child: Icon(Icons.shopping_cart),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
        ));
  }
}
