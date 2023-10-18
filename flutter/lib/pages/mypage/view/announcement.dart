import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/date_symbol_data_local.dart';

class Announce extends StatefulWidget {
  const Announce({Key? key}) : super(key: key);

  @override
  _AnnounceState createState() => _AnnounceState();
}

class _AnnounceState extends State<Announce> {
  @override
  void initState() {
    initializeDateFormatting("ko_KR", null);
    super.initState();
  }

  int _selectedItemIndex = -1; // 선택한 항목의 인덱스를 저장

  String _currentTime = ''; //현재날짜

  String _buildDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy.MM.dd (EEE)', 'ko_KR');
    return formatter.format(now);
  }

  final List<Map<String, dynamic>> _items = [
    //하드코딩하여 아이템 초기화
    {
      "title": "제목 1", // 첫 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.",
    },
    {
      "title": "제목 2", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "제목 3", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "제목 4", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "제목 5", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "제목 6", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    {
      "title": "제목 7", // 두 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 공지 내용입니다.",
    },
    // 다른 공지들도 추가
  ];

  final List<bool> _isExpandedList = List.generate(50, (index) => false);
  final List<bool> _iconButtonSelectedList = List.generate(50, (index) => false);

  void _removeItem(int id) {
    setState(() {
      _items.removeWhere((element) => element['id'] == id);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(milliseconds: 600),
        content: Text('Item with id #$id has been removed'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: BaseAppbar(),
      body: SafeArea(
        child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
          _currentTime = _buildDate();
          return Column(
            children: [
              SizedBox(height: height * 0.02,),
              Text(
                "공지사항",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              SizedBox(height: height * 0.015,),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (_, index) {
                    final item = _items[index];
                    final isExpanded = _isExpandedList[index];
                    final isIconButtonSelected = _iconButtonSelectedList[index];
                    return Card(
                      key: PageStorageKey(item['id']),
                      color: _selectedItemIndex == index
                          ? Colors.white
                          : isIconButtonSelected
                              ? Colors.grey
                              : Colors.white, // 선택한 항목 또는 아이콘 버튼 선택 여부에 따라 배경색 변경
                      elevation: 0,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        height: isExpanded ? 500 : 100.0, //공지내용 보이는 컨테이너 높이
                        child: ExpansionTile(
                          iconColor: Colors.black,
                          collapsedIconColor: Colors.black,
                          backgroundColor: Colors.grey[200],
                          // ExpansionTile의 배경색, 연한 그레이
                          onExpansionChanged: (bool expanded) {
                            setState(() {
                              _isExpandedList[index] = expanded;
                              if (expanded) {
                                _selectedItemIndex = index;
                              }
                            });
                          },
                          initiallyExpanded: false,
                          title: ListTile(
                            title: Text(
                              _currentTime, // 현재 날짜 표시
                              style: TextStyle(color: Colors.grey),
                            ),
                            subtitle: Text(
                              item['title'], //제목 입력
                              style: TextStyle(color: Colors.black, fontSize: 23),
                            ),
                          ),
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(30.0), // content 패딩값
                                  child: Text(
                                    item['content'],
                                    style:
                                        TextStyle(color: Colors.black, fontSize: 23),
                                    maxLines: 10,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
