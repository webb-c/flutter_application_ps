import 'package:flutter/material.dart';

class Bottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent[400],
      child: Container(
        height: 50,
        child: TabBar(
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white60,
          indicatorColor: Colors.transparent,
          tabs: <Widget>[
            //각각의 탭을 생성
            Tab(
              //아이콘 설정
              icon: Icon(Icons.home, size: 18),
              child: Text(
                '홈',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              //아이콘 설정
              icon: Icon(Icons.add_alert, size: 18),
              child: Text(
                '출결 관리',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              //아이콘 설정
              icon: Icon(Icons.timelapse, size: 18),
              child: Text(
                '시간표',
                style: TextStyle(fontSize: 9),
              ),
            ),
            Tab(
              //아이콘 설정
              icon: Icon(Icons.calendar_today, size: 18),
              child: Text(
                '캘린더',
                style: TextStyle(fontSize: 9),
              ),
            )
          ],
        ),
      ),
    );
  }
}
