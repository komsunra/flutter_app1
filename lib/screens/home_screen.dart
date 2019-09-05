import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/add_screen.dart';
import 'package:flutter_app1/screens/page01.dart';
import 'package:flutter_app1/screens/page02.dart';
import 'package:flutter_app1/screens/page03.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List pages = [Page01(), Page02(), Page03()];

  @override
  Widget build(BuildContext context) {
    TextStyle titleStyle = TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold,color: Colors.white);

    Widget appBar(){
      return AppBar(
        title: Text('แอพของฉัน', style: titleStyle),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: () => Navigator.of(context).pushNamed('/home')),
          IconButton(icon: Icon(Icons.account_circle), onPressed: () => Navigator.of(context).pushNamed('/account')),
          IconButton(icon: Icon(Icons.settings), onPressed: () => Navigator.of(context).pushNamed('/setting')),
        ],
      );
    }

    Widget floatingAction(){
      return FloatingActionButton(
          onPressed: () async {
            var response = await Navigator.push(context, MaterialPageRoute(builder: (context) => AddScreen('Send Params')));
            print(response);
          },
          child: (Icon(Icons.add)));
    }

    Widget bottomNavBar(){
      return BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('หน้าหลัก')),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text('ข้อมูลส่วนตัว')),
            BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text('ตั้งค่า')),
          ]);
    }

    Widget drawer(){
      return Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(
                    'https://randomuser.me/api/portraits/thumb/men/57.jpg',
                  ),
                ),
                accountName: Text(
                  'Komsun Rattanaprom',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                accountEmail: Text('iamzer@hotmail.com'),
                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: AssetImage('assets/images/dog2.jpg')))),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('User Setting', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('ตั้งค่าบัญชีผู้ใช้งาน'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('All Users', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('ผู้ใช้งานทั้งหมด'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/users');
              },
            ),
            Divider(),ListTile(
              leading: Icon(Icons.group),
              title: Text('Members', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('สมาชิกทั้งหมด'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/member');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.all_inclusive),
              title: Text('Random Word', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('List view of randow words'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pushNamed('/randomwords');
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Exit', style: TextStyle(fontSize: 20.0)),
              subtitle: Text('ออกจากระบบ'),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                exit(0);
              },
            ),
            Divider(),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      drawer: drawer(),
      body: pages[currentIndex],
      floatingActionButton: floatingAction(),
      bottomNavigationBar: bottomNavBar(),
    );
  }
}
