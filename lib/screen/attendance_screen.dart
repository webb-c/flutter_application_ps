import 'package:flutter/material.dart';
import 'package:flutter_application_ps/data/model_student.dart';
import 'package:flutter_application_ps/screen/attendance_screen2.dart';

class AtdScreen extends StatefulWidget {
  _AtdScreenState createState() => _AtdScreenState();
}

class _AtdScreenState extends State<AtdScreen> {
  //학생 정보 더미데이터
  int index = 0;
  bool check = false;
  List<Student> students = [
    Student.fromMap(
        {'name': 'Weezer', 'number': '1994', 'img': 'test.png', 'exit': false}),
    Student.fromMap(
        {'name': 'muse', 'number': '2009', 'img': 'test2.jpg', 'exit': false}),
    Student.fromMap(
        {'name': 'RHCP', 'number': '2016', 'img': 'test3.jpg', 'exit': false}),
    Student.fromMap(
        {'name': 'RATM', 'number': '1992', 'img': 'test4.jpg', 'exit': true}),
  ];

  late List<Widget> images;
  late List<String> names;
  late List<String> numbers;
  late List<bool> exits;

  @override
  void initState() {
    super.initState();
    images = students.map((m) => Image.asset('./images/' + m.img)).toList();
    names = students.map((m) => m.name).toList();
    numbers = students.map((m) => m.number).toList();
    exits = students.map((m) => m.exit).toList();
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 60),
                  Text('학생정보 검색', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 30),
                  Form(
                      child: Theme(
                          data: ThemeData(
                              primaryColor: Colors.blueAccent[300],
                              inputDecorationTheme: InputDecorationTheme(
                                labelStyle: TextStyle(
                                    color: Colors.blueAccent, fontSize: 16.0),
                              )),
                          child: Container(
                            padding: EdgeInsets.all(60.0),
                            child: Column(
                              children: <Widget>[
                                TextField(
                                  controller: controller,
                                  decoration: InputDecoration(
                                      labelText: 'Enter "name"'),
                                  keyboardType: TextInputType.text,
                                ),
                                SizedBox(
                                  height: 40.0,
                                ),
                                ButtonTheme(
                                    minWidth: 70.0,
                                    height: 35.0,
                                    child: RaisedButton(
                                        color: Colors.blueAccent[800],
                                        child: Icon(
                                          Icons.search,
                                          color: Colors.white,
                                          size: 25.0,
                                        ),
                                        onPressed: () {
                                          //if(controller.text == 'name'){
                                          for (int i = 0; i < 4; i++) {
                                            if (names[i].toString().compareTo(
                                                    controller.text) ==
                                                0) {
                                              check = true;
                                              index = i;
                                            }
                                          }
                                          if (check) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Jot(students, index)));
                                          }
                                          //없는경우
                                          else {
                                            showSnackBar(context);
                                          }
                                          ;
                                        })),
                              ],
                            ),
                          )))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '해당 입력정보와 일치하는 학생이 존재하지 않습니다.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.grey[500],
  ));
}
