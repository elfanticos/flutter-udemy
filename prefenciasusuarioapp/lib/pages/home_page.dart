import 'package:flutter/material.dart';
import 'package:prefenciasusuarioapp/share_prefs/preferences_user.dart';
import 'package:prefenciasusuarioapp/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {

  static final String routeName = 'home';
  final prefs = new PreferencesUser();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de Usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Color secundario:'),
          Divider(),
          Text('Genero: ${prefs.gender}'),
          Divider(),
          Text('Nombre usuario:'),
          Divider()
        ],
      ),
    );
  }
}