import 'package:flutter/material.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';

class OrgBox extends StatelessWidget {
  OrgBox({super.key,
  required this.orgName,
  required this.orgAddress,
  required this.orgPath});

  var orgName;
  var orgAddress;
  var orgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("바보");
      },
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 50,
              child: Image.network("http://localhost:1000/images/1.png"),
            ),
            Text(orgName),
            Text(orgAddress),
          ],
        ),
      ),
    );
  }
}
