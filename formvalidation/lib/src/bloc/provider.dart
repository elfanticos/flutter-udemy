import 'package:flutter/material.dart';
import 'package:formvalidation/src/bloc/login_bloc.dart';
import 'package:formvalidation/src/bloc/producto_bloc.dart';

class Provider  extends InheritedWidget {
  static  Provider _instancia;
  final loginBLoc = LoginBloc();
  final _productosBloc = ProductoBloc();
  
  factory Provider({Key key, Widget child}) {
    if (_instancia == null) {
      _instancia = new Provider._internal(key: key, child: child,);
    }
    return _instancia;
  }

  Provider._internal({Key key, Widget child})
  : super(key : key, child: child);

  

  // Provider({Key key, Widget child})
  // : super(key : key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).loginBLoc;
  }

  static ProductoBloc productosBloc (BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider)._productosBloc;
  }

}