import 'package:flutter/material.dart';
import 'package:givoo/pages/login/viewmodel/login_viewmodel.dart';
import 'package:givoo/provider/OrganizationProvider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../provider/org_notice_provider.dart';

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
          backgroundImage:NetworkImage(imagePath),
         radius: 30,// Text(key['title']),
       ),
       title: Text(orgName,style: TextStyle(
          fontSize: 14,
       ),),
       subtitle: Text(orgAddress,style: TextStyle(
         fontSize: 12
       ),),
       onTap: (){
         Provider.of<OrganizationProvider>(context, listen: false).orgInfo(orgId,int.parse("${LoginViewModel.userId}"));
         Provider.of<OrgNoticeProvider>(context, listen: false).loadOrgNotice(orgId);
         context.push('/orginfo/$orgId',extra: orgId);
       },
    );
  }
}
