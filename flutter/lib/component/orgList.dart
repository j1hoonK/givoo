import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';

Widget OrgList(MyOrgList myOrgList){
   return ListTile(
      leading: FlutterLogo(),
      title: Text(myOrgList.orgName),
      onTap: (){
         print(myOrgList.orgId);
      },
   );

}