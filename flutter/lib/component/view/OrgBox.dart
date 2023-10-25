import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:givoo/provider/UserProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/DonationProvider.dart';

class OrgBox extends StatelessWidget {
  OrgBox({
    super.key,
    required this.orgName,
    required this.orgAddress,
    required this.imagePath,
    required this.orgId,
  });

  final orgName;
  final orgAddress;
  final dynamic imagePath;
  final orgId;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () {
        Provider.of<OrganizationProvider>(context, listen: false).orgInfo(orgId,int.parse("${LoginViewModel.userId}"));
        print("orgId : $orgId LoginView : ${LoginViewModel.userId}");
        context.push('/orginfo/$orgId',extra: orgId);
      },
      child: Card(
        child: Column(
          children: [
            Container(
              height: height * 0.13,
              margin: EdgeInsets.all(width * 0.007), // 컨테이너 간의 간격
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey, // 테두리 색상 설정
                  width: 3.0, // 테두리 두께 설정
                ),
                image: DecorationImage(
                  image: NetworkImage(imagePath ??
                      "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png"),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.circular(12.0), // 컨테이너의 모서리를 둥글게 만들기
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text(
                  orgName,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 5, 3),
                child: Text(
                  orgAddress,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
