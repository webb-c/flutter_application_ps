//학생 데이터 관리를 위한 클래스

import 'package:cloud_firestore/cloud_firestore.dart';

class Student {
  final String name; //이름
  final String number; //학번
  final String img; //사진
  final bool exit; //조퇴 유무
  //final int index;
  final DocumentReference reference;

  Student.fromMap(Map<String, dynamic> map, {required this.reference})
      : name = map['name'],
        number = map['number'],
        img = map['img'],
        exit = map['exit'];

  Student.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data, reference: snapshot.reference);

  @override
  String toString() => "Name<$name:$number>";
}
