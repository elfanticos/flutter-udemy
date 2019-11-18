import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:prefenciasusuarioapp/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecond = true;
  int _gender = 1;
  String _name = 'Pedro';
  TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _loadPref();
    _textController = new TextEditingController(text: _name);
  }

  void _setSelectRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gender', value);
    setState(() { _gender = value; });
  }

  void _loadPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold),),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecond,
            title: Text('Color secundaio'),
            onChanged: (bool value) {
              setState(() { _colorSecond = value; });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Masculino'),
            groupValue: _gender,
            onChanged: _setSelectRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text('Femenino'),
            groupValue: _gender,
            onChanged: _setSelectRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el télefono' 
              ),
              onChanged: (String value) {
                
              },
            ),
          )
        ],
      )
    );
  }
}