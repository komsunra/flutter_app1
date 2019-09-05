import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class UsersScreen extends StatefulWidget {
  @override
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {

  var users;
  bool isLoading = true;

  Future<Null> getUsers() async{
    final response = await http.get('https://randomuser.me/api?results=20');
    if (response.statusCode == 200){
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      setState(() {
        isLoading = false;
        users = jsonResponse['results'];
      });
    }else{
      print('Failed to get rest api !!!');
      throw Exception('Failed to get rest api !!!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('รายชื่อผู้ใช้งานทั้งหมด')),
        body: RefreshIndicator(
          onRefresh: getUsers,
          child: isLoading ? Center(child: CircularProgressIndicator()) :
            ListView.builder(itemBuilder: (context, int index) {
            return Column(children: <Widget>[
              ListTile(
                  onTap: () {},
                  leading: CircleAvatar(backgroundColor: Colors.black26,backgroundImage: NetworkImage(users[index]['picture']['thumbnail'])),
                  title: Text('${index+1}. ${users[index]['name']['first']} ${users[index]['name']['last']}',style: TextStyle(fontSize: 20.0),),
                  subtitle: Text('${users[index]['email']}'),
                  trailing: Icon(Icons.keyboard_arrow_right)
              ),
              Divider(),
            ],
          );
      },itemCount: users != Null ? users.length : 0,),
        )
    );
  }
}
