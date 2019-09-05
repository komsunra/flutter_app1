import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String firstName = 'Komsun';
  String lastName = 'Rattanaprom';
  String address = '''
  sathorn road,
  bkk,
  10120''';

  int age = 20;
  double weight = 80.0;
  double height = 178.0;

  bool isActive = true;
  bool isCancel = false;

  var description;
  List<String> sex = ['Male', 'Female'];
  Map myMap = {'type': 'Admin', 'code': '62001', 'age': 20};

  void displyName(String name, int age) {
    print('Name: $name , Age: $age');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Application')),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            print('$firstName $lastName');
            print(address);
            print('--------------------------');

            double bmi = weight / ((height / 100) * (height / 100));
            print('BMI : $bmi');

            print('--------------------------');
            displyName('Somchai Thaidee', 35);

            print('--------------------------');
            Person p1 = Person('Komsun', 'Rattanaprom', 30);
            p1.toString();
          },
          child: Text('Click me!!'),
          color: Colors.blue,
          textColor: Colors.white,
        ),
      ),
    );
  }
}

class Person {
  String firstName;
  String lastName;
  int age;

  Person(this.firstName, this.lastName, this.age) {}

  toString() {
    print('''
    Name: $firstName $lastName
    Age: $age''');
  }
}
