import 'package:flutter/material.dart';





class Notice extends StatefulWidget {
  const Notice({Key? key}) : super(key: key);

  @override
  _NoticeState createState() => _NoticeState();
}

class _NoticeState extends State<Notice> {
  final List<Map<String, dynamic>> _items = [
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
      "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고...",
    },
    {
      "title": "2023 좋은 이웃 콘서트 & 전시회로 회원님을 초대합니다", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용",
    },
    {
      "title": "2023 자립준비청년 포럼: 자립 준비청년과의 동행", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "아이티 해외결연아동후원 종결 안내", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "기부어때 개인정보처리방침 개정 안내", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "'The 좋은 부모교육' 사전신청 안내", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    // 다른 공지들도 추가
  ];

  void _removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 600),
        content: Text('Item with id #$id has been removed')));
  }

  @override
  Widget build(BuildContext context) {
    return
       SafeArea(
        child: ListView.builder(
          itemCount: _items.length,
          itemBuilder: (_, index) {
            final item = _items[index];
            return Column(
              children: [
                Card(
                  color: Colors.white,
                  elevation: 0, // 그림자 없애기
                  child: ExpansionTile(
                    trailing: null,
                    childrenPadding:

                    const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    expandedCrossAxisAlignment: CrossAxisAlignment.end,
                    title: Text(
                      item['title'],
                      style: const TextStyle(color: Colors.black),
                    ),
                    children: [
                      Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                      children:[
                      Text(
                        item['date'], // 날짜 표시
                        style: TextStyle(color: Colors.grey),
                      ),

                      Text(
                        item['content'],
                        style: const TextStyle(color: Colors.black),
                      ),
],),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey, // 선의 색상 설정
                  thickness: 1.0, // 선의 두께 설정
                ),
              ],
            );
          },
        ),
       );

  }
}
