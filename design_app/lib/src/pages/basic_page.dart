import 'package:flutter/material.dart';

class BasicPage extends StatelessWidget {
  final styleTitle = TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold);
  final styleSubTitle = TextStyle(fontSize: 18.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _getImage(),
            _getContainerTitle(),
            _getActions(),
            _getDescription(),
            _getDescription(),
            _getDescription(),
          ],
        ),
      ),
    );
  }

  Widget _getImage() {
    return Container(
      width: double.infinity,
      child: Image(
          image: NetworkImage(
            'https://images.pexels.com/photos/371633/pexels-photo-371633.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
          ),
          height: 200.0,
          fit: BoxFit.cover,
      ),
    );
  }

  Widget _getContainerTitle() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: <Widget>[
            _getTitle(),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 30.0,
            ),
            Text(
              '41',
              style: TextStyle(fontSize: 20.0),
            )
          ],
        ),
      ),
    );
  }

  Widget _getTitle() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Oeschinen Lake Campgroud',
            style: styleTitle,
          ),
          SizedBox(
            height: 7.0,
          ),
          Text(
            'Kandersteg Switzerland',
            style: styleSubTitle,
          )
        ],
      ),
    );
  }

  Widget _getActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _getAction(Icons.call, 'CALL'),
        _getAction(Icons.near_me, 'ROUTE'),
        _getAction(Icons.share, 'SHARE'),
      ],
    );
  }

  Widget _getAction(IconData icon, String text) {
    return Column(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.blue,
          size: 40.0,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          text,
          style: TextStyle(color: Colors.blue),
        )
      ],
    );
  }

  Widget _getDescription() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
        child: Text(
          'No sólo sobrevivió 500 años, sino que tambien ingresó como texto de relleno en documentos electrónicos, quedando esencialmente igual al original. Fue popularizado en los 60s con la creación de las hojas "Letraset", las cuales contenian pasajes de Lorem Ipsum, y más recientemente con software de autoedición, como por ejemplo Aldus PageMaker, el cual incluye versiones de Lorem Ipsum.',
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
