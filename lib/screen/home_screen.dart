import 'package:flutter/material.dart';
import 'package:flutter_application_ps/data/model_student.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeScreen extends StatefulWidget {
  //Firestore대신 FirebaseFirestore써도 되겄지...?
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
