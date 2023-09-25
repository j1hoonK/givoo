import 'package:flutter/material.dart';
import 'package:givoo/component/view/OrgBox.dart';
import 'package:givoo/component/view/appbar.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:provider/provider.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
          appBar: BaseAppbar(),
          body: SingleChildScrollView(
            child: Consumer<OrganizationProvider>(
              builder: (context, provider, child) {
                return  Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      height: 50,
                      child: TextField(
                        controller: provider.controller,
                        onChanged: (value) {
                          provider.listener(value);
                        },
                        style: TextStyle(
                          color: Colors.black,
                        ),
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
                          prefixIcon: provider.isSearchIconVisible
                              ? Icon(Icons.search)
                              : null,
                          // 텍스트 입력 전에만 search 아이콘 표시
                          prefixIconColor: Colors.black,
                          suffixIcon: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              provider.isClearButtonVisible
                                  ? IconButton(
                                      onPressed: () {
                                        provider.clear();
                                      },
                                      icon: Icon(Icons.clear, color: Colors.black),
                                    )
                                  : SizedBox(),
                              !provider.isSearchIconVisible
                                  ? IconButton(
                                      onPressed: () {
                                        provider.searchOrg(provider.searchValue);
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
                    ),
                    SizedBox(
                      height: 20.0,
                    ),provider.OrgList.length!=0 ? GridView.builder(
                      itemCount: provider.OrgList.length, //item 개수
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
                        //  childAspectRatio: 1 / 2, //item 의 가로 1, 세로 2 의 비율
                        mainAxisSpacing: 10, //수평 Padding
                        crossAxisSpacing: 10, //수직 Padding
                      ),
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext ctx2, int idx) {
                        return OrgBox(orgName: provider.OrgList[idx].orgName,
                            orgAddress: provider.OrgList[idx].orgAddress,
                            imagePath:provider.OrgList[idx].imagePath, orgId: provider.OrgList[idx].orgId,);
                      },
                    ) : Container(
                      height: 500,
                      child: Center(
                        child: Column(
                          children: [
                            Container(
                              height: 300,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('images/person.png'),
                                ),
                              ),
                            ),Text("검색하신 결과가 없습니다.",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            SizedBox(height: 15),
                          ],
                        ),
                ),
                    )
                  ],
                );
              },
            ),
          )),
    );
  }
}
