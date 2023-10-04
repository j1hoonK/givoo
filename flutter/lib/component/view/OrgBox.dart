import 'package:flutter/material.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class OrgBox extends StatelessWidget {
  OrgBox(
      {super.key,
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
          context.push('/orginfo/$orgId',extra: orgId);
          Provider.of<OrganizationProvider>(context, listen: false).orgInfo(orgId, 1);
      },
      child:Card(
        margin: EdgeInsets.all(width*0.007),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                //border: Border.all(),
              ),
              height: height * 0.1,
              width: width * 0.3,
              child: Image.network(
                imagePath ?? "https://givoo-org-image.s3.ap-northeast-2.amazonaws.com/mainlogo.png",  //imagePath,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
              child: SizedBox(
              height: height*0.023,
                child: Text(
                  orgName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 5, 3),
              child: Text(
                orgAddress,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
