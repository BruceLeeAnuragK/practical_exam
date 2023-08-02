import 'package:flutter/material.dart';
import 'package:practical_exam/model/image_preference.dart';
import 'package:practical_exam/model/shared_pref_model.dart';
import 'package:practical_exam/model/theme_model.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:practical_exam/provider/shared_prefProvider.dart';
import 'package:practical_exam/provider/themeProvider.dart';
import 'package:practical_exam/view/bookmark_page.dart';
import 'package:practical_exam/view/quote_screen.dart';
import 'package:practical_exam/view/quotes_detail_screen.dart';
import 'package:practical_exam/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences theme = await SharedPreferences.getInstance();
  bool isDark = theme.getBool("") ?? false;
  SharedPreferences pref = await SharedPreferences.getInstance();
  SharedPreferences imgpref = await SharedPreferences.getInstance();
  SharedPreferences deletepref = await SharedPreferences.getInstance();
  ////////
  List<String> allQuotesBookmark = pref.getStringList("BOOKMARKKEY") ?? [];
  List<String> imagesBookmark = imgpref.getStringList("IMAGEBOOKMARKKEY") ?? [];
  List<String> deleteBookmark =
      deletepref.getStringList("DELETEBOOKMARKKEY") ?? [];
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => QuotesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) =>
            ThemeProvider(themeModel: ThemeModel(isDark: isDark)),
      ),
      ChangeNotifierProvider(
        create: (context) => QuoteBookMarkProvider(
          bookmarkModel: QuotesBookmarkModel(
              quotes: allQuotesBookmark, deletequotes: deleteBookmark),
          imagebookmarkModel: ImageBookmarkModel(image: imagesBookmark),
        ),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(
        useMaterial3: true,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      themeMode: Provider.of<ThemeProvider>(context).themeModel.isDark
          ? ThemeMode.dark
          : ThemeMode.light,
      initialRoute: "splash_screen",
      routes: {
        "/": (context) => QuotePage(),
        "splash_screen": (context) => IntroScreen(),
        "quotes_detail_page": (context) => QuotesDetailScreen(),
        "bookmark": (context) => BookMarks(),
      },
    );
  }
}
