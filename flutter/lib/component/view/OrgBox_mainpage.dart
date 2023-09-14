import 'package:flutter/material.dart';

class MainPageOrgBox extends StatelessWidget {
  MainPageOrgBox({super.key,
  required this.orgName,
  required this.imagePath
  });


  final orgName;
  final imagePath;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 150,
        child: Card(
          margin: EdgeInsets.only(left: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                height: 110,
                width: 150,
                child: Image.asset(imagePath,
                  fit: BoxFit.fill,
                ),
              ),
              Text(orgName,
                style: TextStyle(fontWeight: FontWeight.bold,
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
