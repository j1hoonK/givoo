import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  bool _isClearButtonVisible = false;
  bool _isSearchIconVisible = true;

  @override
  void initState() {
    super.initState();

    // 텍스트가 변경될 때마다 이벤트 처리
    _controller.addListener(() {
      setState(() {
        _isClearButtonVisible = _controller.text.isNotEmpty;
        _isSearchIconVisible = _controller.text.isEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          '검색',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              style: TextStyle(color: Colors.black),
              cursorColor: Colors.black,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    color: Color(0xFFFF466E),
                    width: 3.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Color(0xFFFF466E),
                  ),
                ),
                hintText: '찾고자하는 단체를 검색해주세요',
                prefixIcon: _isSearchIconVisible
                    ? Icon(Icons.search)
                    : null, // 텍스트 입력 전에만 search 아이콘 표시
                prefixIconColor: Colors.black,
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _isClearButtonVisible
                        ? IconButton(
                      onPressed: () {
                        _controller.clear();
                      },
                      icon: Icon(Icons.clear, color: Colors.black),
                    )
                        : SizedBox(),
                    !_isSearchIconVisible
                        ? IconButton(
                      onPressed: () {
                        // 검색 기능 구현
                        // 여기에 검색 기능 추가하기
                      },
                      icon: Icon(Icons.search, color: Colors.black),
                    )
                        : SizedBox(),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView(
                // 검색 결과를 표시할 목록 또는 위젯을 추가
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();//_controller라는 TextEditingController를 초기화할 때 사용된 컨트롤러를 해제하는 역할
    super.dispose();
  }
}
