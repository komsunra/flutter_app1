import 'package:flutter/material.dart';

class Page01 extends StatefulWidget {
  @override
  _Page01State createState() => _Page01State();
}

class _Page01State extends State<Page01> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(children: <Widget>[
          Card(child: Image(image: AssetImage('assets/images/dog1.jpg'))),
          Card(child: Image(image: AssetImage('assets/images/dog2.jpg'))),
          Card(child: Image(image: AssetImage('assets/images/dog3.jpg')))
        ]),
      ],
    );
  }
}
