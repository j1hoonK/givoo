import 'package:flutter/material.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:go_router/go_router.dart';



class TermsCondition extends StatefulWidget {
  const TermsCondition({Key? key}) : super(key: key);

  @override
  State<TermsCondition> createState() => _TermsConditionState();
}

class _TermsConditionState extends State<TermsCondition> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedItemIndex = -1; // 선택한 항목의 인덱스를 저장

  Widget title(String text, {double size = 14}) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size,
        color: Colors.black,
      ),
    );
  }

  Widget description(String text, {int tabIn = 0}) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // 타이틀 중앙 정렬
        elevation: 0.0, // 앱바 하단 그림자 없애기
        title: Image.asset('images/login/logo.png',width: MediaQuery.of(context).size.width * 0.3),
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){context.pop();}, icon: Icon(Icons.arrow_back, color: Colors.black,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Center(
                child: Text(
                  '기부어때 이용약관',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              title('  제1조 (약관의 목적)', size: 15),
              const SizedBox(height: 10),
              description(
                  "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다."
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 15),
              title('  제2조 (약관의 목적)', size: 15),
              const SizedBox(height: 10),
              description(
                  "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다."
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
              const SizedBox(height: 15),
              title('  제3조 (약관의 목적)', size: 15),
              const SizedBox(height: 10),
              description(
                  "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다."
              ),
              const SizedBox(height: 10),
              description(
                "본 약관의 목적은 기부어때를 이용하는 데 필요한 '주식회사 Kibwa(이하 '회사')'과 이용자 사이의 권리 및 의무,이용 조건 및 절차 등 요기패스 이용계약(이하 '이용계약')의 내용을 정하는 것입니다.",
                tabIn: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
