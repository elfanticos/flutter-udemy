import 'package:flutter/material.dart';
import 'package:peliculas2/models/pelicula.model.dart';

class PeliculaDetallePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(pelicula),
          SliverList(
            delegate: SliverChildListDelegate([
              SizedBox(height: 10.0,),
              _posterTitulo(context,pelicula),
              _descripcion(pelicula),
            ]),
          )
        ],
      )
    );
  }

  Widget _crearAppBar(Pelicula pelicula) {
    return SliverAppBar(
      elevation          : 2.0,
      backgroundColor    : Colors.indigoAccent,
      expandedHeight     : 200.0,
      floating           : false,
      pinned             : true,
      flexibleSpace      : FlexibleSpaceBar(
        centerTitle      : true,
        title            : Text( pelicula.title, style: TextStyle(color: Colors.white,fontSize: 16.0),),
        background       : FadeInImage(
          image          : NetworkImage(pelicula.getBackgroundImg()),
          placeholder    : AssetImage('assets/img/loading.gif'),
          fadeInDuration : Duration(milliseconds: 150),
          fit             : BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: <Widget>[
          Hero(
            tag   : pelicula.uniqueId,
            child : ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(image: NetworkImage( pelicula.getPosterImg()),height: 150.0,),
            ),
          ),
          SizedBox(width: 20.0,),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(pelicula.title, style: Theme.of(context).textTheme.title,overflow: TextOverflow.ellipsis,),
                Text(pelicula.originalTitle, style: Theme.of(context).textTheme.subhead,overflow: TextOverflow.ellipsis),
                Row(
                  children: <Widget>[
                    Icon(Icons.star_border),
                    Text(pelicula.voteAverage.toString(), style: Theme.of(context).textTheme.subhead,)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion(Pelicula pelicula) {

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: Text(
        pelicula.overview,
        textAlign: TextAlign.justify,
      ),
    );
  }
}