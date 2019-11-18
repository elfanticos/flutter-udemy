import 'package:flutter/material.dart';
import 'package:prefenciasusuarioapp/pages/home_page.dart';
import 'package:prefenciasusuarioapp/pages/settings_page.dart';
import 'package:prefenciasusuarioapp/share_prefs/preferences_user.dart';

void main() async{
 
  final prefs = new PreferencesUser();
  await prefs.initPrefs();

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  
  final prefs = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prefencias',
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}