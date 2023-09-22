import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(link) async{
  final  url = link;

  if(await canLaunchUrl(url)){
    await launchUrl(Uri.parse(url));
  }else{
    return null;
  }
}