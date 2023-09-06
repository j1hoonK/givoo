import 'package:flutter/material.dart';
import 'package:givoo/component/model/OrgBoxModel.dart';

class OrgBox extends StatelessWidget {
  const OrgBox({super.key,
  required this.org});

  final Organization org;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            height: 50,
            child: Image.network("http://localhost:1000/images/1.png"),
          ),
          Text(org.orgName),
          Text(org.orgAddress),
        ],
      ),
    );
  }
}
