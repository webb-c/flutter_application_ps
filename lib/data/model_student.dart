//학생 데이터 관리를 위한 클래스

class Student {
  final String name; //이름
  final String number; //학번
  final String img; //사진
  final bool exit; //조퇴 유무
  //final int index;

  Student.fromMap(Map<String, dynamic> map)
      : name = map['name'],
        number = map['number'],
        img = map['img'],
        exit = map['exit'];

  @override
  String toString() => "Name<$name:$number>";
}
