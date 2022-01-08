import 'package:flutter/material.dart';
import 'package:flutter_application_ps/data/model_student.dart';

class HomeScreen extends StatelessWidget {
  //학생 정보 더미데이터
  //List<Student> students = [
  //  Student.fromMap(
  //      {'name': 'Weezer', 'number': '2002', 'img': 'test.png', 'exit': false})
  //];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(height: 60),
          Text('공지사항', style: TextStyle(fontSize: 20)),
          SizedBox(height: 30),
          Center(
            child: Container(
              height: 350,
              width: 250,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black87, width: 1),
              ),
              child: Text("공지사항 작성할 박스"),
            ),
          ),
        ],
      ),
    );
  }
}
