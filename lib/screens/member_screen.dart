import 'package:flutter/material.dart';
import 'package:flutter_app1/utils/database_helper.dart';

class MemberScreen extends StatefulWidget {
  @override
  _MemberScreenState createState() => _MemberScreenState();
}

class _MemberScreenState extends State<MemberScreen> {
  MembersService membersService = new MembersService();
  List members = [];

  @override
  void initState(){
    viewMembers();
  }
  
  Future viewMembers() async {
    var res = await membersService.findAll();
    print(res);
    setState(() {
      members = res;
    });
  }

  Future removeMembers(int id) async {
    var res = await membersService.remove(id);
    viewMembers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('List ofMembers'),),
      body: ListView.builder(
        itemBuilder: (context,int index){
          return Column(children: <Widget>[
            ListTile(
              title: Text('${members[index]['first_name']}'),
              subtitle: Text('${members[index]['email']}'),
              trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: ()=> removeMembers(members[index]['id']),
              ),
              onTap: () {

              },
            ),
            Divider()
            ],
          ) ;
                    ;
        },itemCount: members != null ? members.length : 0,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.of(context).pushNamed('/addmember');
          },
          child: Icon(Icons.person_add),
          ),
    );
  }
}
