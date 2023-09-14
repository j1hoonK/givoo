import 'package:flutter/material.dart';

class OrgBox extends StatelessWidget {
  OrgBox({super.key,
    required this.orgName,
    required this.orgAddress,
    required this.orgPath});

  final orgName;
  final orgAddress;
  final orgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 150,
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: 110,
                width: 150,
                child: Image.network("http://10.0.2.2:1000/images/1",
                  fit: BoxFit.fill,
                ),
              ),
              Text(orgName,
                style: TextStyle(fontWeight: FontWeight.bold,
                ),),
              Text(orgAddress,
                style: TextStyle(color: Colors.grey,
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
