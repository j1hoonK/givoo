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
            height: 50,
          ),
          Text(org.orgName),
          Text(org.orgAddress),
        ],
      ),
    );
  }
}
