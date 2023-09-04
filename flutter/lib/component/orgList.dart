import 'package:flutter/material.dart';
import 'package:givoo/pages/mypage/model/MyOrgList.dart';

Widget OrgList(MyOrgList myOrgList){
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