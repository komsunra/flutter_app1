import 'package:flutter/material.dart';
import 'package:flutter_app1/screens/home_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController ctrlUserName = TextEditingController();
  TextEditingController ctrlPassword = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void doLogin(){
    print(ctrlUserName.text);
    
    if (ctrlUserName.text == 'admin' && ctrlPassword.text == 'admin'){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => HomeScreen())
      );
    }else{
      print('Error !! login');
      showSnackBar('เกิดข้อผิดพลาด !!');
      showDialog<Null>(
        context: context,
        builder: (BuildContext context){
          return errorDialog(context,'เกิดข้อผลพลาด','ชื่อ หรือ รหัสผ่าน ไม่ถูกต้อง !!!');
        }
      );
    }
  }

  Widget errorDialog(BuildContext context,String title,String text){
     Widget dialog = new SimpleDialog(
      title: Text(title),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 30.0),
          child: Text(text),
        ),
        new SimpleDialogOption(
          onPressed: () => Navigator.pop(context),
          child: Text('ตกลง'),
        )
      ],
    );
     return dialog;
  }

  Widget showSnackBar(String text){
    Widget snackBar = new SnackBar(content: new Row(
      children: <Widget>[
        new Text(text)
      ],
    ));
    return snackBar;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: Colors.blue,
          ),
          Scaffold(
            body: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/dog1.jpg')
                        )
                      ),
                    ),
                    ListView(children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 30.0,width: 300.0,),
                          Image(image: AssetImage('assets/images/login_logo.png'),width: 150.0,height: 150.0,),
                          Text("Luv Me Luv My Dog.",style: TextStyle(color:Colors.white,fontSize: 26.0,fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(50.0, 0.0, 50.0, 10.0),
                            child:
                            Form(child: Column(
                              children: <Widget>[
                                TextFormField(
                                  controller: ctrlUserName,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    labelText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                    filled: true,
                                    fillColor: Colors.white54,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                TextFormField(
                                  controller: ctrlPassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    labelText: 'Password',
                                    prefixIcon: Icon(Icons.vpn_key),
                                    filled: true,
                                    fillColor: Colors.white54,
                                  ),
                                ),
                                SizedBox(height: 10.0,),
                                RawMaterialButton(
                                  fillColor: Colors.lightBlueAccent,
                                  onPressed: () => doLogin() ,
                                  shape: const StadiumBorder(),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 50.0),
                                    child: (
                                        Text('Login',style: TextStyle(color: Colors.white,fontSize: 20.0))
                                    ),
                                  ),
                                ),
                                FlatButton(
                                  onPressed: () {},
                                  child: Text('Register now?',style: TextStyle(color: Colors.white,fontSize: 18.0),),
                                )
                              ],
                            ),),
                          )
                        ],
                      ),
                    ],
                    ),
                  ],

                )

          )
        ],
      ),
    );
  }
}
