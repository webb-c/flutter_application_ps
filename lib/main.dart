import 'package:flutter/material.dart';
import 'package:flutter_application_ps/screen/attendance_screen.dart';
import 'package:flutter_application_ps/screen/home_screen.dart';
import 'package:flutter_application_ps/widget/bottom_bar.dart';
import 'package:table_calendar/table_calendar.dart'; //캘린더 라이브러리

void main() => runApp(MyApp()); //main에서 MyApp이란 클래스를 호출한다.

/*캘린더 코드 
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my first app',
      home: calenderinfo(),
    );
  }
}


class calenderinfo extends StatefulWidget {
  const calenderinfo({
    Key? key,
  }) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<calenderinfo> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TableCalendar Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TableCalendar(
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },
              onFormatChanged: (format) {
                if (_calendarFormat != format) {
                  // Call `setState()` when updating calendar format
                  setState(() {
                    _calendarFormat = format;
                  });
                }
              },
              onPageChanged: (focusedDay) {
                // No need to call `setState()` here
                _focusedDay = focusedDay;
              },
            )
          ],
        ),
      ),
    );
  }
}
*/

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
      title: "개인 테스트용 출결앱",
      //theme: ThemeData() 테마 설정
      home: DefaultTabController(
        length: 4, //메인화면(공지), 출결기능, 시간표(미구현), 캘린더
        child: Scaffold(
          //앱바 구성
          appBar: AppBar(
            backgroundColor: Colors.blueAccent[400],
            title: Text('개인 테스트용 출결앱'),
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
                child: Text('TimeTable'),
              ),
              Container(
                child: Text('Calendar'),
              ),
            ],
          ),
          bottomNavigationBar:
              Bottom(), //아래에 위치한 내비게이션바 구성 -> bottom_bar.dart파일
        ),
      ), //아래에 표시되는 탭을 지정 (length : 탭의 개수 / NeverScroll~ : 스크롤로 탭전환이 안되도록 함 / children: 넣을 화면)
    );
  }
}
