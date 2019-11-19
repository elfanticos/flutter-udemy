import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:formvalidation/src/bloc/validator.dart';

class LoginBloc with Validators {
  // Sin rxdart
  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();

  // con rxdart
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();



  // Recuperar datos del Stream
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);
  Stream<String> get passwordStream => _passwordController.stream.transform(validarPassword);

  Stream<bool> get formValidStream => 
    Observable.combineLatest2(emailStream, passwordStream, (e,p) => true);

  // Insertar valores al Steam
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // Obtener el último valor ingreso a los streams
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose()   {
    _emailController?.close();
    _passwordController?.close();
  }
}