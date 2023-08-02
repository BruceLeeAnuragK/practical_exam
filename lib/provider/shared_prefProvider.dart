import 'package:flutter/material.dart';
import 'package:practical_exam/model/shared_pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/image_preference.dart';

class QuoteBookMarkProvider extends ChangeNotifier {
  QuotesBookmarkModel bookmarkModel;
  ImageBookmarkModel imagebookmarkModel;
  QuoteBookMarkProvider(
      {required this.bookmarkModel, required this.imagebookmarkModel});

  chagequotes({required String quotes}) async {
    bookmarkModel.quotes.add(quotes);
    SharedPreferences Pref = await SharedPreferences.getInstance();

    await Pref.setStringList("BOOKMARKKEY", bookmarkModel.quotes);

    notifyListeners();
  }

  deletequotes({required String quotes}) async {
    SharedPreferences Pref = await SharedPreferences.getInstance();
    Pref.remove("BOOKMARKKEY");
    notifyListeners();
  }

  changeimages({required String images}) async {
    imagebookmarkModel.image.add(images);
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setStringList("IMAGEBOOKMARKKEY", imagebookmarkModel.image);
    notifyListeners();
  }
}
