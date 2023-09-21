import 'package:flutter/material.dart';
import 'package:givoo/pages/organization_info/view/org_info.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:go_router/go_router.dart';

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
      },
      child: SizedBox(
        height: height * 0.25,
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
                  "",  //imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: height*0.023,
                child: Text(
                  orgName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: height*0.015,
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
      ),
    );
  }
}
