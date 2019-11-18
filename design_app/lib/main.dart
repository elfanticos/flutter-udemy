import 'package:flutter/material.dart';

import 'package:design_app/src/pages/scroll_page.dart';
import 'package:design_app/src/pages/basic_page.dart';
import 'package:design_app/src/pages/button_page.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.black
    ));

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Diseños',
      initialRoute: 'button',
      routes: {
        'basic'  : (BuildContext context) => BasicPage(),
        'scroll' : (BuildContext context) => ScrollPage(),
        'button' : (BuildContext context) => ButtonPage()
      },
    );
  }
}
