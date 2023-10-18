
import 'package:flutter/cupertino.dart';
class DropdownProvider with ChangeNotifier {
  List<String> _options = ['2023'];
  String _selectedOption = "2023";

  List<String> get options => _options;
  String get selectedOption => _selectedOption;

  void setSelectedOption(String? option) {
    _selectedOption = option?? "2023";
    notifyListeners();
  }
}