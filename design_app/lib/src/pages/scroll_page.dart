import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  final controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: <Widget>[_page1(), _page2()],
        ),
      ),
    );
  }

  Widget _page1() {
    return Stack(
      children: <Widget>[_colorBackground(), _imageBackground(), _texts()],
    );
  }

  Widget _page2() {
    return Stack(
      children: <Widget>[_colorBackground(), _btnCenter()],
    );
  }

  Widget _colorBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }

  Widget _imageBackground() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Image(
        image: AssetImage('./assets/scroll-1.png'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _texts() {
    final styleText = TextStyle(color: Colors.white, fontSize: 50.0);
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20.0,
          ),
          Text(
            '11°',
            style: styleText,
          ),
          Text(
            'Miercoles',
            style: styleText,
          ),
          Expanded(
            child: Container(),
          ),
          IconButton(
            icon: Icon(
              Icons.keyboard_arrow_down,
              size: 70.0,
              color: Colors.white,
            ),
            onPressed: () {
              controller.animateToPage(1, duration: Duration(milliseconds: 1000), curve: Curves.ease);
            },
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  Widget _btnCenter() {
    final styleText = TextStyle(color: Colors.white, fontSize: 20.0);
    return Center(
      child: RaisedButton(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 10.0),
            child: Text('Bienvenidos',style: styleText,),
          ),
          shape: StadiumBorder(),
          color: Colors.blue,
          onPressed: () {
            controller.animateToPage(0, duration: Duration(milliseconds: 1000), curve: Curves.ease);
          },
        ),
    );
  }
}
