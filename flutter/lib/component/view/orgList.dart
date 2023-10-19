import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';
import 'package:go_router/go_router.dart';

class OrgList extends StatelessWidget {
  const OrgList({super.key,
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
    return ListTile(
       leading: CircleAvatar(
          backgroundImage:NetworkImage(imagePath), // Text(key['title']),
       ),
       title: Text(orgName,style: TextStyle(
          fontSize: 14,
       ),),
       subtitle: Text(orgAddress,style: TextStyle(
         fontSize: 12
       ),),
       onTap: (){
         context.push('/orginfo/$orgId',extra: orgId);
       },
    );
  }
}
