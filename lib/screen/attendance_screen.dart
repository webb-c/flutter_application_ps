import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_ps/data/model_student.dart';
import 'package:flutter_application_ps/screen/attendance_screen2.dart';
import 'package:flutter_application_ps/screen/home_screen.dart';

class AtdScreen extends StatefulWidget {
  _AtdScreenState createState() => _AtdScreenState();
}

class _AtdScreenState extends State<AtdScreen> {
  //학생 정보 더미데이터
  // List<Student> students = [
  //   Student.fromMap(
  //       {'name': 'Weezer', 'number': '2002', 'img': 'test.png', 'exit': false}),
  //   Student.fromMap({
  //     'name': 'Weezer2',
  //     'number': '2002',
  //     'img': 'test.png',
  //     'exit': false
  //   }),
  //   Student.fromMap({
  //     'name': 'Weezer3',
  //     'number': '2002',
  //     'img': 'test.png',
  //     'exit': false
  //   }),
  // ];
  Firestore firestore = Firestore.instance;
  late Stream<QuerySnapshot> streamData;
  bool research = false;

  @override
  void initState() {
    super.initState();
    streamData = firestore
        .collection('student')
        .snapshots(); //괄호안에는 파이어베이스 DB에서 작성한 컬렉션의 이름
  }

  TextEditingController controller = TextEditingController();

  //스냅샷으로 가져온 COLUMN을 가지고 데이터를 뽑아내는 과정
  Widget _fetchData(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('student').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return LinearProgressIndicator(); //로딩
        return _buildSearch(
            context, snapshot.data!.documents); //데이터 가져옴 - 계속 오류나는데 어쩌죠
      },
    );
  }

  Widget _buildSearch(BuildContext context, List<DocumentSnapshot> snapshot) {
    List<DocumentSnapshot> searchResults = [];
    for (DocumentSnapshot d in snapshot) {
      if (d.data.toString().compareTo(controller.text) == 0) {
        research = true;
      }
    }
    return _buildBody(context, snapshot);
  }

  Widget _buildBody(BuildContext context, List<DocumentSnapshot> snapshot) {
    final List<Student> students =
        snapshot.map((d) => Student.fromSnapshot(d)).toList();
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
                                          //학생이름이 데이터에 있는 경우
                                          if (research) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (BuildContext
                                                            context) =>
                                                        Jot(
                                                            students:
                                                                students)));
                                          }
                                          //없는경우
                                          else
                                            () {
                                              showSnackBar(context);
                                            };
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

  @override
  Widget build(BuildContext context) {
    return _fetchData(context);
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
