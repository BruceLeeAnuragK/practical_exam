import 'package:flutter/material.dart';
import 'package:practical_exam/helper/helper_class.dart';
import 'package:provider/provider.dart';

class QuotesProvider extends ChangeNotifier {
  Map quotes = {};
  searchcity() async {
    quotes = await APIhelper.apihelper.getQuotesResponse() ?? {};
    notifyListeners();
    return 0;
  }
}
