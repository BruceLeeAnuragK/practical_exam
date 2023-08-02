import 'package:flutter/material.dart';
import 'package:practical_exam/model/shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteBookMarkProvider extends ChangeNotifier {
  QuoteBookMarkProvider bookmarkModel;

  QuoteBookMarkProvider({
    required this.bookmarkModel,
  });

  changeTheme() async {
    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setStringList("BOOKMARKKEY", []);

    notifyListeners();
  }
}
