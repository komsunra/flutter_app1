import 'package:flutter/material.dart';

class Page03 extends StatefulWidget {
  @override
  _Page03State createState() => _Page03State();
}

class _Page03State extends State<Page03> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          leading: Icon(
            Icons.font_download,
            size: 40.0,
          ),
          title: Text('Font Style', style: TextStyle(color: Colors.black)),
          subtitle: Text('กำหนดรูปแบบตัวอักษร'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.color_lens,
            size: 40.0,
          ),
          title: Text('Theme Color', style: TextStyle(color: Colors.black)),
          subtitle: Text('กำหนดสีของแอพพิเคชั่น'),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        Divider(),
        //tset
        // test
      ],
    );
  }
}
