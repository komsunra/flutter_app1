import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/add_memeber_screen.dart';
import 'package:flutter_app1/screens/random_words.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_app1/screens/login_screen.dart';
import 'package:flutter_app1/screens/member_screen.dart';
import 'package:flutter_app1/screens/page01.dart';
import 'package:flutter_app1/screens/page02.dart';
import 'package:flutter_app1/screens/page03.dart';
import 'package:flutter_app1/screens/users_screen.dart';
import 'package:flutter_app1/utils/database_helper.dart';
import 'package:intl/intl.dart';

void main(){
  DatabaseHelper dbHelpler = DatabaseHelper.internal();
  dbHelpler.initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('th','TH'),
        // ... other locales the app supports
      ],

      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'EkkamaiNew', scaffoldBackgroundColor: Colors.white, primaryColor: Colors.blue, accentColor: Colors.blueAccent),
      title: 'Title - My App',
      home: LoginScreen(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => Page01(),
        '/account': (BuildContext context) => Page02(),
        '/setting': (BuildContext context) => Page03(),
        '/users': (BuildContext context) => UsersScreen(),
        '/member': (BuildContext context) => MemberScreen(),
        '/addmember': (BuildContext context) => AddMemberScreen(),
        '/randomwords': (BuildContext context) => RandomWord(),
      },
    );
  }
}
