import 'package:flutter/material.dart';
import 'package:flutter_application_ps/screen/attendance_screen.dart';
import 'package:flutter_application_ps/screen/calendar_screen.dart';
import 'package:flutter_application_ps/screen/home_screen.dart';
import 'package:flutter_application_ps/widget/bottom_bar.dart';

void main() => runApp(MyApp()); //main에서 MyApp이란 클래스를 호출한다.

//MyApp 클래스 선언
class MyApp extends StatefulWidget {
  _MyAppState createState() =>
      _MyAppState(); //MyApp의 상태를 관리하는 _MyAppState() 클래스
}

class _MyAppState extends State<MyApp> {
  late TabController controller; //전역 선언
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "개인 - 출결프로그램 테스트",
      //theme: ThemeData() 테마 설정
      home: DefaultTabController(
        length: 4, //메인화면(공지), 출결기능, 시간표(미구현), 캘린더
        child: Scaffold(
          //앱바 구성
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[400],
            title: Text('개인 - 출결프로그램 테스트'),
            centerTitle: true, //가운데 정렬
            elevation: 0.0, //투명도 없앰
          ),
          //바디 구성
          body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            children: <Widget>[
              HomeScreen(),
              AtdScreen(),
              Container(
                child: Center(
                  child: Text('TimeTable - 미완성'),
                ),
              ),
              Calendar(),
            ],
          ),
          bottomNavigationBar:
              Bottom(), //아래에 위치한 내비게이션바 구성 -> bottom_bar.dart파일
        ),
      ), //아래에 표시되는 탭을 지정 (length : 탭의 개수 / NeverScroll~ : 스크롤로 탭전환이 안되도록 함 / children: 넣을 화면)
    );
  }
}
