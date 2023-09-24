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

  bool _isClearButtonVisible = false;
  bool _isClearButtonVisible1 = false;
  bool _isClearButtonVisible2 = false;

  final _formKey = GlobalKey<FormState>();
  Map<String, dynamic> userInfo = {
    'userName':'',
    "address": "",
    "subAddress": '',
    'userAddress': '',
    'userNumberFirst': 0,
    'userNumberSecond': 0
  };
  String userAddress = '';
  String address = '';
  String subAddress = '';
  String userName = '';
  dynamic userNumberFirst = 0;
  dynamic userNumberSecond = 0;

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '성명',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Palette.textColor1,
                    ),
                  ),
                ),
                SizedBox(
                  height: mHeight * 0.02,
                ),
                SizedBox(
                  height: mHeight * 0.08,
                  child: TextFormField(
                    key: Key('1'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '이름을 정확히 입력해주세요';
                      }
                      return null;
                    },
                    keyboardType: widget.keyboard,
                    textInputAction: TextInputAction.next,
                    controller: _controller,
                    onSaved: (value) => onSaved,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      labelText: widget.hintText,
                      prefixIcon: widget.prefixIcon,
                      suffixIcon: _isClearButtonVisible
                          ? IconButton(
                        icon: widget.suffixIcon,
                        onPressed: () {
                          _controller.clear();
                        },
                      )
                          : null,
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Palette.textColor1, width: 2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            );
                        ComTextForm(
                          valitext: '이름을 정확히 입력해주세요',
                          prefixIcon: Icon(CupertinoIcons.tag),
                          hintText: '이름',
                          keyboard: TextInputType.name,
                          subject: '성명',
                          suffixIcon: Icon(Icons.clear),
                          focusColor: Palette.textColor1,
                          onSaved: (value) => setState(() {
                            userName = value;
                          }),
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
                              onSaved: (value) => setState(() {
                                userInfo[subAddress] = value!;
                              }),
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
                                    onSaved: (value) => setState(() {
                                      userNumberFirst = value;
                                    }),
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
                                    onSaved: (value) => setState(() {
                                      userNumberSecond = value;
                                    }),
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
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: mHeight * 0.05),
                      Center(
                        child: Text(
                          '이용약관',
                          style: TextStyle(
                              fontSize: 23,
                              color: Color(0xFFFF466E),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: mHeight * 0.015), // 간격 추가

                      // 체크박스 및 텍스트 입력란 추가
                      Column(
                        children: [
                          ListTile(
                            leading: Checkbox(
                              value: allAgreed, // "모두 동의합니다" 체크 상태 설정
                              onChanged: (bool? value) {
                                setState(() {
                                  allAgreed = value ?? false;
                                  allA = allAgreed;
                                  allB = allAgreed;
                                  allC = allAgreed; // 체크 상태 업데이트
                                });
                              },
                              activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                              checkColor: Colors.white,
                            ),
                            title: Text(
                              '모두 동의합니다',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          Divider(
                            thickness: 2,
                            height: 1,
                            indent: 1,
                            //왼쪽 간격 조정
                            endIndent: 15,
                            //오른쪽 간격 조정
                            color: Colors.grey,
                          ), //회색 실선
                          ListTile(
                            leading: Checkbox(
                              value: allA, // 체크 상태 설정
                              onChanged: (bool? value) {
                                allA == false && allB == true && allC == true
                                    ? setState(() {
                                        allAgreed = true;
                                        allA = value ?? false;
                                      })
                                    : setState(() {
                                        allA = value ?? false;
                                      });
                              },
                              activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                              checkColor: Colors.white,
                            ),
                            title: Text(
                              '만 14세 이상입니다',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          ListTile(
                            leading: Checkbox(
                              value: allB, // 체크 상태 설정
                              onChanged: (bool? value) {
                                allA == true && allB == false && allC == true
                                    ? setState(() {
                                        allAgreed = true;
                                        allB = value ?? false;
                                      })
                                    : setState(() {
                                        allB = value ?? false;
                                      });
                              },
                              activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                              checkColor: Colors.white,
                            ),
                            title: Text(
                              '[필수] 기부어때 이용약관 동의',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                          ListTile(
                            leading: Checkbox(
                              value: allC, // 체크 상태 설정
                              onChanged: (bool? value) {
                                allA == true && allB == true && allC == false
                                    ? setState(() {
                                        allAgreed = true;
                                        allC = value ?? false;
                                      })
                                    : setState(() {
                                        allC = value ?? false;
                                      });
                              },
                              activeColor: Color(0xFFFF466E), // 체크된 상태일 때의 색상
                              checkColor: Colors.white,
                            ),
                            title: Text(
                              '[필수] 기부어때 이용약관 동의',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                              ),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios),
                              color: Colors.black,
                            ),
                            contentPadding: EdgeInsets.zero,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: mHeight * 0.02,
                      ),
                      Container(
                        width: double.infinity,
                        height: mHeight * 0.08,
                        color: (allB && allC) || (!allA && !allB && !allC)
                            ? Color(0xFFFF466E)
                            : Colors.grey, // 버튼 활성/비활성 상태에 따라 색상 변경

                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFF466E),
                          ),
                          onPressed: (allB == true && allC == true) ||
                                  (allB == true && allC == true && allC == true)
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('완료'),
                                      action: SnackBarAction(
                                          label: "닫기", onPressed: () {}),
                                    ));
                                    print("userAddress == $userAddress / address == $address / subAddress == $subAddress / userName == $userName / userNumberFirst == $userNumberFirst userNumberSecond == $userNumberSecond");
                                    _formKey.currentState!.save();
                                    print('userInfoMation == $userInfo');
                                  } else {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text('입력을 확인해주세요'),
                                      action: SnackBarAction(
                                          label: "닫기", onPressed: () {}),
                                    ));
                                  }
                                }
                              : () {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Text('필수 약관을 모두 체크해주세요'),
                                    action: SnackBarAction(
                                        label: "닫기", onPressed: () {}),
                                  ));
                                },
                          // allB와 allC가 모두 체크되어야 클릭 가능
                          child: Text(
                            "완료",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ) //LoginSignupScreen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
