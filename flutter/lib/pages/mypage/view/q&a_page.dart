import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:intl/date_symbol_data_local.dart';

class faqpage extends StatefulWidget {
  const faqpage({Key? key}) : super(key: key);

  @override
  _faqpageState createState() => _faqpageState();
}

class _faqpageState extends State<faqpage> {
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
      "title": "[후원문의] 후원신청 가능한 후원사업 종류와 후원사업 변경은 어떻게 하나요?", // 첫 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "안녕하세요, '기부어때'  입니다. 회원님께서 후원중인 사업에 대한 내용은 기부어때 홈페이지 로그인 > 나의 후원 페이지 내 회원님의 후원이 만든 변화에서 더 상세히 확인 가능합니다. 또한 사업 변경을 원하시면 기부어때 홈페이지 로그인 > 후원내용확인 및 변경에서 변경 가능하십니다. 온라인 외에도 회원상담센터(1544-0000)를 통해서도 변경 가능합니다.",
    },
    {
      "title": "[후원문의] 후원을 중단하고 싶습니다.", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "회원님 후원중단을 원하시면 회원상담센터 1544-0000로 연락 주시기 바랍니다. 온라인으로 중단을 원하시면 홈페이지 나의후원 > FAQ/1:1 문의 > 1:1문의하기에서 문의종류 카테고리에서 후원중단을 선택하시고 문의글을 남겨주시면 후원 중단이 가능합니다.",
    },
    {
      "title": "제목 3", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 Q&A 내용입니다.",
    },
    {
      "title": "제목 4", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 Q&A 내용입니다.",
    },
    {
      "title": "제목 5", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 Q&A 내용입니다.",
    },
    {
      "title": "제목 6", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 Q&A 내용입니다.",
    },
    {
      "title": "제목 7", // 두 번째 Q&A 제목
      "date": "yyyy.MM.dd (월)",
      "content": "두 번째 Q&A 내용입니다.",
    },
    // 다른 Q&A 추가
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
      /*AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'FAQ',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        centerTitle: true,
      ),*/
      body: SafeArea(
        child: TimerBuilder.periodic(Duration(seconds: 1), builder: (context) {
          _currentTime = _buildDate();
          return Column(
            children: [
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
                        height: isExpanded ? 500.0 : 100.0, //답변내용 보이는 컨테이너 높이
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
