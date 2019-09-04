import 'package:flutter/material.dart';


class RandomWord extends StatefulWidget {
  @override
  _RandomWordState createState() => _RandomWordState();
}

class _RandomWordState extends State<RandomWord> {

  final randomWords = new WordPair.random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Random Words'),),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}
