import 'package:flutter/material.dart';
import 'package:practical_exam/model/shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuoteBookMarkProvider extends ChangeNotifier {
  QuotesBookmarkModel bookmarkModel;

  QuoteBookMarkProvider({
    required this.bookmarkModel,
  });

  chagequotes({required String quotes}) async {
    bookmarkModel.quotes.add(quotes);
    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setStringList("BOOKMARKKEY", bookmarkModel.quotes);

    notifyListeners();
  }
}
