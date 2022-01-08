import 'package:flutter/material.dart';
import 'package:flutter_application_ps/data/model_student.dart';
import 'package:flutter_application_ps/screen/attendance_screen.dart';

class Jot extends StatefulWidget {
  final List<Student> students;
  Jot({required this.students});
  _JotState createState() => _JotState(); //MyApp의 상태를 관리하는 _MyAppState() 클래스
}

class _JotState extends State<Jot> {
  late List<Student> students;
  late List<Widget> images;
  late List<String> names;
  late List<String> numbers;
  late List<bool> exits;
  //추가
  //int _currentPage = 0;
  //late String _currentNumber;
  //출결 기록용
  String check = "X";
  String write = "조퇴";

  @override
  void initState() {
    super.initState();
    students = widget.students;
    images = students.map((m) => Image.asset('./images/' + m.img)).toList();
    names = students.map((m) => m.name).toList();
    numbers = students.map((m) => m.number).toList();
    exits = students.map((m) => m.exit).toList();
    //_currentNumber = numbers[_currentPage];

    //이제 저 0번이 파이어베이스에서 검색했을 떄 나온 데이터의 index값으로 지정하면 되는데...

    if (exits[0]) {
      check = "O";
      write = "조퇴 취소";
    } else {
      check = "X";
      write = "조퇴";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //앱바 구성
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[400],
        title: Text('맥북타고 이 회사 뜬다'),
        centerTitle: true, //가운데 정렬
        elevation: 0.0, //투명도 없앰
      ),
      body: Builder(builder: (context) {
        return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
                child: Column(children: [
              SizedBox(height: 60),
              Text('학생정보 출력', style: TextStyle(fontSize: 20)),
              SizedBox(height: 30),
              Row(
                children: [
                  //이미지 출력
                  Padding(padding: EdgeInsets.all(30)),
                  Image.asset('images/' + students[0].img,
                      width: 150, height: 150),
                  SizedBox(width: 30),
                  //학번 및 이름 출력
                  Column(
                    children: [
                      Text("이름 : " + names[0]),
                      Text("학번 : " + numbers[0]),
                      Text("조퇴 유무 : " + check)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              //버튼
            ])));
      }),
    );
  }
}
