import 'package:flutter/material.dart';
import 'package:givoo/pages/organization_info/view/org_info.dart';
import 'package:givoo/provider/OrganizationProvider.dart';

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
  final imagePath;
  final orgId;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () async {
        final result = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context)=> OrgInfoPage(orgId)
          ),
        );
        print("result == $result");
      },
      child: SizedBox(
        height: height * 0.16,
        width: width * 0.3,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: height * 0.1,
                width: width * 0.3,
                child: Image.network(
                  imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                orgName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                orgAddress,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
