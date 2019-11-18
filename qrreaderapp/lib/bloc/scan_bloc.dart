import 'dart:async';

import 'package:qrreaderapp/providers/db_provider.dart';
import 'package:qrreaderapp/bloc/validator.dart';
import 'package:qrreaderapp/models/scan_model.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    getScans();
  }

  final _scansController = StreamController<List<ScanModel>>.broadcast();
  Stream<List<ScanModel>> get scansStream     => _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }

  getScans() async {
    _scansController.sink.add( await DBProvider.db.getAllScans());
  }

  deleteSCan(int id) async {
    await DBProvider.db.deleteScan(id);
    getScans();
  }

  deleteAllScan() async {
    await DBProvider.db.deleteAll();
    getScans();
  }

  addScan(ScanModel scan) async {
    await DBProvider.db.newScan(scan);
    getScans();
  }
}