import 'package:flutter/material.dart';

class OrgNotice extends StatefulWidget {
  const OrgNotice(
      {Key? key,
      required this.title,
      required this.date,
      required this.content})
      : super(key: key);
  final String title;
  final String date;
  final String content;

  @override
  _OrgNoticeState createState() => _OrgNoticeState();
}

class _OrgNoticeState extends State<OrgNotice> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none, // expansiontile 펼칠 때 연한 grey border 색상을 없앰
        ),
        shape: RoundedRectangleBorder(
          side: BorderSide.none, // expansiontile 펼칠 때 연한 grey border 색상을 없앰
        ),
        trailing: const SizedBox(),
        // 화살표 아이콘 야매로 없애기
        childrenPadding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        // 타일 펼쳤을 때 너비와 높이
        expandedCrossAxisAlignment: CrossAxisAlignment.end,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                // 텍스트 맨 위 왼쪽부터 시작
                child: Text(
                  widget.date,
                  // 공지 업로드 날짜 표시
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              SizedBox(height: 8), // 날짜와 내용 사이 간격 띄우기
              Text(
                widget.content, // 공지 내용 표시
                style: const TextStyle(color: Colors.black),
              ),
            ],
          ),
          Divider(
            color: Colors.grey, // 선의 색상 설정
            thickness: 0.5, // 선의 두께 설정
          ),
        ],
      );
  }
}
