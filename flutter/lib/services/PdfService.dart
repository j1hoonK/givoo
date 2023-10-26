import 'dart:io';

import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/DonationProvider.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';
class PdfService {
  static Future<File> createAndSavePDF() async {
    final pdf = Document();
    final font = await rootBundle.load('fonts/NanumGothic-Bold.ttf');
    final ttf = Font.ttf(font);

    if (DonationProvider.selectedDonations2.isNotEmpty) {
      // 기부자 정보
      DonationProvider.selectedDonations2.forEach((dnt) {
        pdf.addPage(Page(
            build: (context) => Center(
              child: Container(
                alignment: Alignment.topLeft,
                width: 480,
                height: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: PdfColors.black, // 여기에서 검정색으로 설정
                    width: 2.0, // 테두리 두께
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: PdfColors.black, // 여기에서 검정색으로 설정
                      width: 2.0, // 테두리 두께
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: PdfColors.black, // 여기에서 검정색으로 설정
                            width: 2.0, // 테두리 두께
                          ),
                        ),
                        child: Text('기부금 영수증', style: TextStyle(fontSize: 30,font: ttf)),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text('1. 기부자', style: TextStyle(font: ttf))),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('성 명', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child:
                              Text(LoginViewModel.userName, style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('주민등록번호', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("930729-1111111", style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 30,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('주 소', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 30,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("서울시 송파구 마천1동 170-5호 1층\nㅇㅇㅇㅇ",
                                  style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text('2. 기부금 단체', style: TextStyle(font: ttf))),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('단 체 명', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text(dnt.orgName, style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('사업자등록번호', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("이름입력", style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('소 재 지', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("", style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                      Container(
                          margin: EdgeInsets.all(10),
                          child: Text('3. 기부금 모집처(언론기관등)', style: TextStyle(font: ttf))),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('단 체 명', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 130,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("기부어때", style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('사업자등록번호', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("1111111111111", style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 45,
                        child: Row(children: [
                          Flexible(
                            flex: 1,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('소 재 지', style: TextStyle(font: ttf)),
                            ),
                          ),
                          Flexible(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.center,
                              // height: 40,
                              // width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("서울시 강남구", style: TextStyle(font: ttf)),
                            ),
                          ),
                        ]),
                      ),
                     Container(
                          margin: EdgeInsets.all(10),
                          child: Text('4. 기부내용', style: TextStyle(font: ttf))),
                     Column(children: [
                        SizedBox(
                          height: 45,
                          child: Row(children: [
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text('유 형', style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text("코 드", style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text('년 월 일', style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text("적 요", style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                  alignment: Alignment.center,
                                  // height: 40,
                                  // width: 100,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: PdfColors.black, // 여기에서 검정색으로 설정
                                      width: 2.0, // 테두리 두께
                                    ),
                                  ),
                                  child: Text("금 액", style: TextStyle(font: ttf))),
                            ),
                          ]),
                        ),
                        SizedBox(
                          height: 45,
                          child: Row(children: [
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child:
                                Text(dnt.dntType?? "-", style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text('111', style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text(dnt.dntDate, style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text("적요", style: TextStyle(font: ttf)),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                // height: 40,
                                // width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child: Text(
                                    "${NumberFormat.currency(symbol: "", locale: 'ko_KR')}원",
                                    style: TextStyle(font: ttf)),
                              ),
                            ),
                          ]),
                        ),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PdfColors.black, // 여기에서 검정색으로 설정
                              width: 2.0, // 테두리 두께
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                  margin: EdgeInsets.all(10),
                                  child: Text(
                                      ' 소득세법 제34조, 조세특례제한법 제73조 및 동법 제88조의 4의 규정에 의한 기부금을 위와 같이 기부하였음을 증명하여 주시기 바랍니다.',
                                      style: TextStyle(font: ttf))),
                              Text('년              월              일',style: TextStyle(font: ttf)),
                              Text(
                                  '신청인:                                           (인)',style: TextStyle(font: ttf)),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.all(10),
                            child: Text(' 위와 같이 기부금을 기부하였음을 증명합니다.',
                                style: TextStyle(font: ttf))),
                      /*  SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('년              월              일',style: TextStyle(font: ttf)),
                              Text(
                                  '신청인:                                           (인)',style: TextStyle(font: ttf)),
                              SizedBox(height: 10,)
                            ],
                          ),
                        ),
                        Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두두께)
                                ),
                              ),
                            ),
                            child: Text(' *유형, 코드', style: TextStyle(font: ttf))),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('소득세법 제34조 제2항 기부금',style: TextStyle(font: ttf)),
                                Text('(법정기부금, 코드 10)',style: TextStyle(font: ttf)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('조세특례제한법 제73조 기부금',style: TextStyle(font: ttf)),
                                Text('(조특법 73, 코드 30)',style: TextStyle(font: ttf)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('소득세법 제34조 제1항 기부금',style: TextStyle(font: ttf)),
                                Text('(지정기부금, 코드 40)',style: TextStyle(font: ttf)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('소득세법 제34조 제1항기부금중 종교단체기부금',style: TextStyle(font: ttf)),
                                Text('(종교단체기부금, 코드 41)',style: TextStyle(font: ttf)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('조세특례제한법 제88조의4 기부금 ',style: TextStyle(font: ttf)),
                                Text('(우리사주조합기부금, 코드 42)',style: TextStyle(font: ttf)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('기타기부금 ',style: TextStyle(font: ttf)),
                                Text('(기타기부금 코드 50)',style: TextStyle(font: ttf)),
                              ],
                            ),
                          ],
                        )*/
                      ]),
                    ],
                  ),
                ),
              ),
            ),));
      });
    }
    Directory externalDirectory = Directory('/storage/emulated/0/Download');
    // Create and save the PDF to the given path
    final file = File("${externalDirectory.path}/donation24.pdf");
    await file.writeAsBytes(await pdf.save());
    Fluttertoast.showToast(
      msg: "영수증 다운이 완료되었습니다.",
      toastLength: Toast.LENGTH_SHORT, // 또는 Toast.LENGTH_LONG
      gravity: ToastGravity.SNACKBAR,
    );
    return file;
  }
}
