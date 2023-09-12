import 'package:flutter/material.dart';

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
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              height: 110,
              child: Image.network("http://localhost:1000/images/1",
                fit: BoxFit.fill,),
            ),
            Text(orgName,
              style: TextStyle(fontWeight: FontWeight.bold,
            ),),
            Text(orgAddress,
              style: TextStyle(color: Colors.grey,
                fontSize: 12), ),
          ],
        ),
      ),
    );
  }
}
