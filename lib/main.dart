import 'package:flutter/material.dart';
import 'package:practical_exam/model/shared_pref_model.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:practical_exam/provider/shared_prefProvider.dart';
import 'package:practical_exam/view/bookmark_page.dart';
import 'package:practical_exam/view/quote_screen.dart';
import 'package:practical_exam/view/quotes_detail_screen.dart';
import 'package:practical_exam/view/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();
  List<String> allQuotesBookmark = pref.getStringList("BOOKMARKKEY") ?? [];
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => QuotesProvider(),
      ),
      ChangeNotifierProvider(
        create: (context) => QuoteBookMarkProvider(
            bookmarkModel: QuotesBookmarkModel(quotes: allQuotesBookmark)),
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
      themeMode: Provider.of<QuotesProvider>(context).isDark
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
