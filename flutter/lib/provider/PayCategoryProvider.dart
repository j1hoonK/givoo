import 'package:flutter/cupertino.dart';

class PayCategoryProvider extends ChangeNotifier {

 List<String> payCategory = ["신용카드","무통장 입금","kakaopay"];
 int? _num;
 int? get num => _num;
 String abc="";

 selectedString(var value){
   abc = value;
 }

 selectedPay(var value){
   _num =value;
   notifyListeners();
 }
}