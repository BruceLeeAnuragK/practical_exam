import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practical_exam/helper/helper_class.dart';
import 'package:practical_exam/model/quote_model.dart';
import 'package:provider/provider.dart';

class QuotesProvider extends ChangeNotifier {
  bool isDark = false;
  void changetheme({required bool val}) {
    isDark = val;
    notifyListeners();
  }

  Map quotes = {};
  searchcity() async {
    quotes = await APIhelper.apihelper.getQuotesResponse() ?? {};
    notifyListeners();
    return 0;
  }

  int currentIndex = 0;
  changeCurrentPageIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  List imageList = [
    "https://louisem.com/wp-content/uploads/2022/11/hustle-quotes-FB.jpg",
    "https://www.trvst.world/wp-content/uploads/2021/11/purple-color-quotes-teufel-damon-under-the-purple-sky-fulgent-stars-in-subdued-m-5350.png",
    "https://www.azquotes.com/picture-quotes/quote-you-should-hear-me-on-my-own-it-s-horrendous-i-saw-deep-purple-live-once-and-i-paid-angus-young-111-2-0254.jpg",
    "https://wallpapers.com/images/hd/quote-dark-purple-picsart-nffs82i3mmbjr410.jpg",
    "https://www.azquotes.com/picture-quotes/quote-deep-purple-is-a-damn-good-band-and-we-ve-made-a-niche-in-rock-n-roll-history-maybe-jon-lord-100-1-0154.jpg",
    "https://hips.hearstapps.com/hmg-prod/images/sad-quotes7-6414cb9a76afe.jpg",
  ];
  QuotesProvider() {
    loadJSONQuotes();
  }
  List AllQuotes = [];
  loadJSONQuotes() async {
    String quotes = await rootBundle.loadString("assets/json/quotes.json");
    List allQuotes = jsonDecode(quotes);
    AllQuotes = allQuotes.map((e) => QuotesModel.fromMap(quotes: e)).toList();
  }
}
