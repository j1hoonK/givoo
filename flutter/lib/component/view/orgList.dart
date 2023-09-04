import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';

class OrgList extends StatelessWidget {
  const OrgList({super.key,
  required this.myOrgList
  });
  final MyOrgList myOrgList;

  @override
  Widget build(BuildContext context) {
    return ListTile(
       leading: CircleAvatar(
          backgroundImage: AssetImage("images/org/img.png"), // Text(key['title']),
       ),
       title: Text(myOrgList.orgName,style: TextStyle(
          fontSize: 12,
       ),),
       onTap: (){
          print(myOrgList.orgId);
       },
    );
  }
}
