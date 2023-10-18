import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  runApp(Announce());
}

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

  String _currentTime = ''; // 현재 날짜

  String _buildDate() {
    final now = DateTime.now();
    final formatter = DateFormat('yyyy.MM.dd (EEE)', 'ko_KR');
    return formatter.format(now);
  }

  final List<Map<String, dynamic>> _items = [
    // 하드코딩하여 아이템 초기화
    {
      "title": "행정안전부 출생미등록 아동신고기간 안내", // 첫 번째 공지 제목
      "date": "yyyy.MM.dd (월)",
      "content":
      "안녕하세요, '기부어때'  입니다. '기부어때'의 이용약관이 개정되어 안내드립니다. 어쩌고.",
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





    // 다른 공지들도 추가
  ];

  final List<bool> _isExpandedList = List.generate(500, (index) => false);
  final List<bool> _iconButtonSelectedList = List.generate(100, (index) => false);



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
          backgroundColor: Colors.white,
          elevation: 0,
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
        body: SafeArea(
          child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
            _currentTime = _buildDate();
            return Column(
              children: [
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
                            : Colors.white,
                        elevation: 0,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          height: isExpanded ? 700.0 : 100.0,
                          child: ExpansionTile(
                            iconColor: Colors.black,
                            collapsedIconColor: Colors.black,
                            backgroundColor: Colors.grey[200],
                            onExpansionChanged: (bool expanded) {
                              setState(() {
                                _isExpandedList[index] = expanded;
                                if (expanded) {
                                  _selectedItemIndex = index;
                                }
                              });
                            },
                            initiallyExpanded: false,
                            title: InkWell( // InkWell로 래핑
                              onTap: () {
                                // ListTile가 클릭되었을 때 할 일을 여기에 추가
                              },
                              child: ListTile(
                                title: Text(
                                  isExpanded ? _currentTime : '',
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 10,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text(
                                  item['title'],
                                  style: TextStyle(color: Colors.black, fontSize: 17),
                                ),
                              ),
                            ),
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(30.0),
                                    child: Text(
                                      item['content'],
                                      style: TextStyle(color: Colors.black, fontSize: 23),
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
      ),
    );
  }
}