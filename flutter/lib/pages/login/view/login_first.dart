import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:givoo/component/view/com_textform.dart';
import 'package:givoo/config/palette.dart';
import 'package:kpostal/kpostal.dart';

import 'login_agreement.dart';

class FirstLogin extends StatefulWidget {
  const FirstLogin({super.key});

  @override
  State<FirstLogin> createState() => _FirstLoginState();
}

class _FirstLoginState extends State<FirstLogin> {
  bool allAgreed = false;
  bool allA = false;
  bool allB = false;
  bool allC = false;

  final _controller = TextEditingController();
  final _controller1 = TextEditingController();
  final _controller2 = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isClearButtonVisible = false;
  bool _isClearButtonVisible1 = false;
  bool _isClearButtonVisible2 = false;
  String address = '';

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _isClearButtonVisible = _controller.text.isNotEmpty;
      });
    });
    _controller1.addListener(() {
      setState(() {
        _isClearButtonVisible1 = _controller1.text.isNotEmpty;
      });
    });
    _controller2.addListener(() {
      setState(() {
        _isClearButtonVisible2 = _controller2.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mHeight = MediaQuery.of(context).size.height;
    final mSize = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Image.asset('images/login/logo.png', height: mHeight * 0.05),
          toolbarHeight: mHeight * 0.1),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
            ),
            padding: EdgeInsets.all(mSize * 0.06),
            margin: EdgeInsets.all(10),
            width: double.infinity,
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            ' 필수정보 입력 ',
                            style: TextStyle(
                                color: Color(0xFFFF466E),
                                fontSize: 23,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: mHeight * 0.035,
                        ),
                        ComTextForm(
                          valitext: '이름을 정확히 입력해주세요',
                          prefixIcon: Icon(CupertinoIcons.tag),
                          hintText: '이름',
                          keyboard: TextInputType.name,
                          subject: '성명',
                          suffixIcon: Icon(Icons.clear),
                          focusColor: Palette.textColor1,
                        ),
                        SizedBox(
                          height: mHeight * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text(
                                    '주소',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Palette.textColor1,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => KpostalView(
                                            useLocalServer: true,
                                            localPort: 1024,
                                            // kakaoKey: '{Add your KAKAO DEVELOPERS JS KEY}',
                                            callback: (Kpostal result) {
                                              print('result == $result');
                                              print(
                                                  'adress == ${result.address}');
                                              setState(() {
                                                address = result.address;
                                              });
                                            },
                                          ),
                                        ),
                                      );
                                    },
                                    child: Text('주소검색'))
                              ],
                            ),
                            SizedBox(
                              height: mHeight * 0.02,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Palette.textColor2, width: 1)),
                              ),
                              height: mHeight * 0.05,
                              width: double.infinity,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: mSize * 0.02,
                                  ),
                                  Icon(
                                    Icons.home,
                                    color: Palette.textColor2,
                                  ),
                                  SizedBox(
                                    width: mSize * 0.02,
                                  ),
                                  Text(address),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 0.02,
                            ),
                            TextFormField(
                              controller: _controller,
                              key: Key('2'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return '주소를 정확히 입력해주세요';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.streetAddress,
                              textInputAction: TextInputAction.next,
                              decoration: InputDecoration(
                                labelText: '상세주소',
                                hintText: '상세주소',
                                suffixIcon: _isClearButtonVisible
                                    ? IconButton(
                                        icon: Icon(Icons.clear),
                                        onPressed: () {
                                          _controller.clear();
                                        },
                                      )
                                    : null,
                                enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.textColor2),
                                    borderRadius: BorderRadius.circular(8)),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Palette.textColor1, width: 2),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: mHeight * 0.03,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                '주민등록번호',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Palette.textColor1),
                              ),
                            ),
                            SizedBox(
                              height: mHeight * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: mSize * 0.35,
                                  child: TextFormField(
                                    controller: _controller1,
                                    key: Key('1'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return '유효하지 않은 주민등록번호입니다';
                                      }
                                      return null;
                                    },
                                    maxLength: 6,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: '앞 6자리',
                                      hintText: '앞 6자리',
                                      prefixIcon: Icon(Icons.password),
                                      suffixIcon: _isClearButtonVisible1
                                          ? IconButton(
                                              icon: Icon(Icons.clear),
                                              onPressed: () {
                                                _controller1.clear();
                                              },
                                            )
                                          : null,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor2),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0, 0, 0, mHeight * 0.03),
                                  width: mSize * 0.05,
                                  height: mHeight * 0.003,
                                  color: Palette.textColor2,
                                ),
                                SizedBox(
                                  width: mSize * 0.35,
                                  child: TextFormField(
                                    controller: _controller2,
                                    obscureText: true,
                                    key: Key('1'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'valitext';
                                      }
                                      return null;
                                    },
                                    maxLength: 7,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly
                                    ],
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      labelText: '뒤 7자리',
                                      hintText: '뒤 7자리',
                                      prefixIcon: Icon(Icons.password),
                                      suffixIcon: _isClearButtonVisible2
                                          ? IconButton(
                                              icon: Icon(Icons.clear),
                                              onPressed: () {
                                                _controller2.clear();
                                              },
                                            )
                                          : null,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Palette.textColor2),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Palette.textColor1,
                                            width: 2),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    )),
                LoginSignupScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
