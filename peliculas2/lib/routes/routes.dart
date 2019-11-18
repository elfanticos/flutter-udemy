import 'package:flutter/material.dart';
// Rutas
import 'package:peliculas2/pages/home.page.dart';
import 'package:peliculas2/pages/pelicula_detalle.page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder> {
    '/'       : (BuildContext context) => HomePage(),
    'detalle' : (BuildContext context) => PeliculaDetallePage(),
  };
}