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
                    height: 800,
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
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: PdfColors.black, // 여기에서 검정색으로 설정
                              width: 2.0, // 테두리 두께
                            ),
                          ),
                          child: Text('기부금 영수증', style: TextStyle(font: ttf,
                          fontSize: 40)),
                        ),
                        Text('1. 기부자', style: TextStyle(font: ttf)),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 40,
                          child:Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('성 명', style: TextStyle(font: ttf)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text(LoginViewModel.userName, style: TextStyle(font: ttf)),
                          ), Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 140,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('주민등록번호(사업자등록번호)',
                                  style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 110,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("1111111111111", style: TextStyle(font: ttf)),
                            ),
                          ]),
                        ]),),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('주 소', style: TextStyle(font: ttf)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text("이름입력", style: TextStyle(font: ttf)),
                          ),
                        ]),
                        Text('2. 기부금 단체', style: TextStyle(font: ttf)),
                        SizedBox(
                          height: 20
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('단 체 명', style: TextStyle(font: ttf)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child:  Text(dnt.orgName, style: TextStyle(font: ttf)),
                          ),  Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child:  Text('주민등록번호(사업자등록번호)', style: TextStyle(font: ttf)),
                          ),  Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text("이름입력", style: TextStyle(font: ttf)),
                          ),

                        ]),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('소 재 지', style: TextStyle(font: ttf)),
                          ), Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text("", style: TextStyle(font: ttf)),
                          ),
                        ]),
                        Text('기부금 모집처(언론기관등)', style: TextStyle(font: ttf)),
                        SizedBox(
                          height: 20
                        ),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('단 체 명', style: TextStyle(font: ttf)),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 130,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child:  Text("기부어때", style: TextStyle(font: ttf)),
                          ),  Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 140,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child:  Text('사업자등록번호', style: TextStyle(font: ttf)),
                          ),  Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text("1111111111111", style: TextStyle(font: ttf)),
                          ),
                        ]),
                        Row(children: [
                          Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text('소 재 지', style: TextStyle(font: ttf)),
                          ), Container(
                            alignment: Alignment.center,
                            height: 40,
                            width: 110,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: PdfColors.black, // 여기에서 검정색으로 설정
                                width: 2.0, // 테두리 두께
                              ),
                            ),
                            child: Text("서울시 강남구", style: TextStyle(font: ttf)),
                          ),

                        ]),
                        Text('1. 기부내용', style: TextStyle(font: ttf)),
                        SizedBox(
                          height: 20,
                        ),
                        Column(children: [
                          Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('유 형', style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("코 드", style: TextStyle(font: ttf)),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('년 월 일', style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("적 요", style: TextStyle(font: ttf)),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: PdfColors.black, // 여기에서 검정색으로 설정
                                    width: 2.0, // 테두리 두께
                                  ),
                                ),
                                child:
                                    Text("금 액", style: TextStyle(font: ttf))),
                          ]),
                          Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text(dnt.dntType?? "-", style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('111', style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text(dnt.dntDate, style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("적요", style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text("${NumberFormat.currency(symbol: "", locale: 'ko_KR').format(dnt.dntAmount)}원", style: TextStyle(font: ttf)),
                            ),
                          ]),
                          Row(children: [
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('입력', style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('입력', style: TextStyle(font: ttf)),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('입력', style: TextStyle(font: ttf)),
                            ),
                            Container(
                                alignment: Alignment.center,
                                height: 40,
                                width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('입력', style: TextStyle(font: ttf)),
                            ),
                            Container(
                            alignment: Alignment.center,
                            height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: PdfColors.black, // 여기에서 검정색으로 설정
                                  width: 2.0, // 테두리 두께
                                ),
                              ),
                              child: Text('입력', style: TextStyle(font: ttf)),
                            ),
                          ]),
                        ]),
                      ],
                    ),
                  ),
                )));
      });
    }
    final dir = await getExternalStorageDirectory();
    Directory externalDirectory = Directory('/storage/emulated/0/Download');
    // Create and save the PDF to the given path
    final file = File("${externalDirectory.path}/donation.pdf");
    await file.writeAsBytes(await pdf.save());
    Fluttertoast.showToast(
      msg: "영수증 다운이 완료되었습니다.",
      toastLength: Toast.LENGTH_SHORT, // 또는 Toast.LENGTH_LONG
      gravity: ToastGravity.SNACKBAR,
    );
    return file;
  }
}
