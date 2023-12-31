import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:givoo/component/view/appbar.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Announcement(),
  ));
}

//////////////////////////////////앱 전체 공지사항/////////////////////////////////
class Announcement extends StatefulWidget {
  const Announcement({Key? key}) : super(key: key);

  @override
  _AnnouncementState createState() => _AnnouncementState();
}

class _AnnouncementState extends State<Announcement> {
  final List<Map<String, dynamic>> _items = [
    {
      "title": "2023년 기부금 세액공제 변경안내 ", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
          "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다.",
    },
    {
      "title": "2023 좋은 이웃 콘서트 & 전시회로 회원님을 초대합니다", // 두 번째 공지 제목
      "date": "2023.09.11 (월)",
      "content":
          "두 번째 공지 내용입니다.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용",
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
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
          "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고...",
    },
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
          "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고...",
    },
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
          "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고...",
    },
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "2023.10.09 (월)",
      "content":
          "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고...",
    },

    // 다른 공지들도 추가
  ];

  /*void _removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: const Duration(milliseconds: 600),
        content: Text('Item with id #$id has been removed')));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppbar(title: "공지사항"),
        backgroundColor: Colors.white,
        /*appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
          backgroundColor: Colors.white,//배경화면 색상
          elevation: 0,
          //그림자 제거
          title: Text(
            '공지사항',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Colors.white,*/ //배경화면 색상
        body: SafeArea(
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
                      collapsedShape: RoundedRectangleBorder(
                        side: BorderSide
                            .none, //expansiontile펼칠 때 연한 grey border색상을 없앰
                      ),
                      shape: RoundedRectangleBorder(
                        side: BorderSide
                            .none, //expansiontile펼칠 때 연한 grey border색상을 없앰
                      ),

                      trailing: const SizedBox(),
                      //화살표 아이콘 야매로 없애기
                      childrenPadding: const EdgeInsets.symmetric(
                          vertical: 50, horizontal: 20),
                      //타일 펼쳤을 때 너비와 높이
                      expandedCrossAxisAlignment: CrossAxisAlignment.end,
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            item['title'],
                            style: const TextStyle(
                                color: Colors.black,
                              fontSize: 18,),
                          ),
                          SizedBox(height: 15),
                          Text(
                            item['date'],
                            style: TextStyle(
                                color: Colors.grey,
                              fontSize: 14,),
                          ),
                        ],
                      ),

                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                             //날짜와 내용사이 간격 띄우기
                            Text(
                              item['content'], //공지 내용 표시
                              style: const TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey, // 선의 색상 설정
                    thickness: 0.5, // 선의 두께 설정
                  ),
                ],
              );
            },
          ),
        ));
  }
}
