import 'package:flutter/material.dart';
import 'package:qrreaderapp/bloc/scan_bloc.dart';
import 'package:qrreaderapp/models/scan_model.dart';
import 'package:qrreaderapp/utils/utils.dart' as utils;

class MapsPage extends StatelessWidget {
  final scanBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
   return StreamBuilder<List<ScanModel>>(
     stream: scanBloc.scansStream,
     builder: (BuildContext context, AsyncSnapshot<List<ScanModel>> snapshot) {
       if (!snapshot.hasData) {
         return Center(child: CircularProgressIndicator(),);
       }

       final scans = snapshot.data;
       if (scans.length == 0) {
         return Center(
           child: Text('No hay información'),
         );
       }

       return ListView.builder(
         itemCount: scans.length,
         itemBuilder: (BuildContext context, int i) => Dismissible(
           key: UniqueKey(),
           background: Container(color: Colors.red,),
           onDismissed: (direction) => scanBloc.deleteSCan(scans[i].id),
           child: ListTile(
           leading: Icon(Icons.cloud_queue, color: Theme.of(context).primaryColor,),
           title: Text(scans[i].value),
           subtitle: Text('ID: ${scans[i].id}'),
           trailing: Icon(Icons.keyboard_arrow_right, color: Colors.grey,),
           onTap: () => utils.openScan(context, scans[i]),
         ),
         )
       );
     },
   );
  }
}