import 'package:flutter/material.dart';

class Page02 extends StatefulWidget {
  @override
  _Page02State createState() => _Page02State();
}

class _Page02State extends State<Page02> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 200.0,
              color: Colors.red,
            ),
            Container(
              height: 200.0,
              color: Colors.green,
            ),
            Container(
              height: 200.0,
              color: Colors.blue,
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    height: 200.0,
                    color: Colors.black,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 100.0,
                    color: Colors.brown,
                  ),
                ),
                Expanded(
                  child: Container(
                    height: 300.0,
                    color: Colors.yellow,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
