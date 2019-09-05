import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  bool isActive = true;
  String dropdownValue = 'ชาย';
  String birthDate;
  var formatter = new DateFormat('dd/MM/yyyy');
  DateTime now = new DateTime.now();

  TextEditingController ctrlFirstName = TextEditingController();
  TextEditingController ctrlLastName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPhone = TextEditingController();
  TextEditingController ctrlGender = TextEditingController();

  _AddMemberScreenState(){
    String formatted = formatter.format(now);
    birthDate = formatted;
  }

  @override
  Widget build(BuildContext context) {
    Future<Null> selectDate() async{
      var showDate = birthDate.split("/");
      print(showDate.getRange(2, 2));
      final DateTime picked = await showDatePicker(
          locale: const Locale('th'),
          context: context,
          initialDate: formatter.parse(birthDate),
          firstDate: DateTime(1920,1,1),
          lastDate: DateTime.now()
      );

      if (picked != null && picked != now){
        setState(() {
          String formatted = formatter.format(picked);
          birthDate = formatted;
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Member'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){

            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 55.0,
                color: Colors.black12,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: SwitchListTile(
                        title: Text('Enable User'),
                        value: isActive,
                        onChanged: (bool value) { setState(() { isActive = value; }); },
                        //secondary: const Icon(Icons.person),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[                          
                          Expanded(
                            child: ListTile(
                                leading: Icon(Icons.person),
                                title: new TextField(
                                    decoration: new InputDecoration(
                                      hintText: "Firstname - Lastname",
                                    ),
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                leading: Icon(Icons.email),
                                title: new TextField(
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: new InputDecoration(
                                      hintText: "Email",
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                leading: Icon(Icons.phone),
                                title: new TextField(
                                    keyboardType: TextInputType.phone,
                                    decoration: new InputDecoration(
                                      hintText: "Phone",
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                                leading: Icon(Icons.phone),
                                title: new TextField(
                                    keyboardType: TextInputType.phone,
                                    decoration: new InputDecoration(
                                      hintText: "Phone",
                                    )
                                )
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              leading: const Icon(Icons.today),
                              title: const Text('Birthday'),
                              subtitle: const Text('February 20, 1980'),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[

                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'First Name',
                                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)
                              ),
                            ),
                          ),
                          //SizedBox(width: 10.0),
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                  labelText: 'Last Name',
                                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                  labelText: 'Email',
                                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: TextFormField(
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                  labelText: 'Phone',
                                  contentPadding: EdgeInsets.symmetric(vertical:10.0,horizontal: 10.0)
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: ListTile(
                              title: Text('เพศ',style: TextStyle(fontSize: 18.0),),
                              trailing: DropdownButton<String>(
                                value: dropdownValue,
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownValue = newValue;
                                  });
                                },
                                items: <String>['ชาย', 'หญิง'].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                          Divider(color: Colors.black,),
                          Expanded(
                            child: (
                                ListTile(
                                title: Text('DOB'),
                                trailing: FlatButton(
                                    onPressed: (){
                                      selectDate();
                                    },
                                    child: (Text(birthDate)),
                                    ),
                                )
                            ),
                          ),
                        ],
                      ),
                      Divider(color: Colors.black,),
                      Row(
                        children: <Widget>[

                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}