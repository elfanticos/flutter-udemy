import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreaderapp/bloc/scan_bloc.dart';
import 'package:qrreaderapp/models/scan_model.dart';
import 'package:qrreaderapp/pages/address_page.dart';
import 'package:qrreaderapp/pages/maps_page.dart';
import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:qrreaderapp/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final scansBloc = new ScansBloc();
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              scansBloc.deleteAllScan();
            },
          )
        ],
      ),
      body: _callPage(indexPage),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  Widget _callPage(int index) {
    switch (index) {
      case 0:
        return MapsPage();
      case 1:
        return AddressPage();
      default:
        return MapsPage();
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      indexPage = index;
    });
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: indexPage,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
        BottomNavigationBarItem(icon: Icon(Icons.brightness_5),title: Text('Direcciones'),
        )
      ],
    );
  }

  _scanQR(BuildContext context) async {
    String futureString;
    try {
      futureString = await new QRCodeReader().scan();
    } catch (e) {
      futureString = e.toString();
    }
    
    if (futureString != null) {
      final scan = ScanModel(value: futureString);
      scansBloc.addScan(scan);
      if (Platform.isAndroid) {
        Future.delayed(Duration(milliseconds: 750), () {
          utils.openScan(context, scan);
        });
      } else {
        utils.openScan(context, scan);
      }
    }
  }
}
