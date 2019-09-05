import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  var params;

  AddScreen(this.params);

  @override
  _AddScreenState createState() => _AddScreenState(params);
}

class _AddScreenState extends State<AddScreen> {
  var localParams;

  _AddScreenState(this.localParams);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create New'),
        ),
        body: ListView(
          children: <Widget>[
            Text('Local Params: $localParams', style: TextStyle(fontSize: 30.0)),
            Text('Create New'),
            RaisedButton(
              color: Colors.red,
              onPressed: () => Navigator.of(context).pop('Cancel'),
              child: Text('Cancel'),
            )
          ],
        ));
  }
}
