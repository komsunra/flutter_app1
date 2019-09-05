import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_app1/utils/validate_form.dart';
import 'package:flutter_app1/utils/database_helper.dart';

class AddMemberScreen extends StatefulWidget {
  @override
  _AddMemberScreenState createState() => _AddMemberScreenState();
}

class _AddMemberScreenState extends State<AddMemberScreen> {
  bool isActive = true;
  String gender = 'ชาย';
  String birthDate;
  var formatter = new DateFormat('dd/MM/yyyy');
  DateTime now = new DateTime.now();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;

  TextEditingController ctrlName = TextEditingController();
  TextEditingController ctrlEmail = TextEditingController();
  TextEditingController ctrlPhone = TextEditingController();

  _AddMemberScreenState(){
    String formatted = formatter.format(now);
    birthDate = formatted;
  }

  Future<Null> saveData() async{
    print(ctrlName.text);
    print(ctrlEmail.text);
    print(ctrlPhone.text);
    print(isActive);
    print(gender);
    MembersService membersService = new MembersService();

    if (_formKey.currentState.validate()) {
      // No any error in validation
      _formKey.currentState.save();

      Map member = {
        'firstName' : ctrlName.text,
        'lastName' : '',
        'email' : ctrlEmail.text,
        'telephone' : ctrlPhone.text,
        'birthDate' : birthDate.toString(),
      };
      await membersService.save(member);
    } else {
      // validation error
      setState(() {
        _autoValidate = true;
      });
    }
  }

  Widget fieldGender() {
    return new DropdownButton<String>(value: gender, onChanged: (String newValue) {
      setState(() {
        gender = newValue;
      });
    }, items: <String>['ชาย', 'หญิง'].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(value: value, child: Text(value, style: TextStyle(wordSpacing: 20.0),),);
    }).toList(),);
  }

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

  Widget formUI() {
    return new Column(
      children: <Widget>[
        Container(
          height: 55.0,
          color: Colors.black12,
          child: Row(
            children: <Widget>[
              Expanded(
                child: SwitchListTile(
                  title: Text('Active'),
                  value: isActive,
                  onChanged: (bool value) {
                    setState(() { isActive = value; });
                  },
                  //secondary: const Icon(Icons.person),
                ),
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.person),
          title: new TextFormField(
            controller: ctrlName,
            validator: (String input) {
              if(input == '')
                return 'Name not null !!';
              else
                return null;
            },
            decoration: new InputDecoration(
              hintText: "Name",
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.phone),
          title: new TextFormField(
            controller: ctrlPhone,
            validator: ValidateForm().validateMobile,
            decoration: new InputDecoration(
              hintText: "Phone",
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.email),
          title: new TextFormField(
            controller: ctrlEmail,
            validator: ValidateForm().validateEmail,
            decoration: new InputDecoration(
              hintText: "Email",
            ),
          ),
        ),
        ListTile(
          onTap: (){selectDate();},
          leading: const Icon(Icons.face),
          title: fieldGender(),
        ),
        SizedBox(height: 20.0,),
        const Divider(
          height: 1.0,color: Colors.black,
        ),
        ListTile(
          onTap: (){selectDate();},
          leading: const Icon(Icons.calendar_today),
          title: const Text('Birthday'),
          subtitle: Text(birthDate),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create New Member'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              saveData();
            },
          )
        ],
      ),
      body: ListView(
        children: <Widget>[
        new Form(
          key: _formKey,
          autovalidate: _autoValidate,
          child: formUI(),
          )
        ]
      ),
    );
  }
}