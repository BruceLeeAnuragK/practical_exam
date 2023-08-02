import 'package:flutter/material.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:practical_exam/provider/shared_prefProvider.dart';
import 'package:provider/provider.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    int index = ModalRoute.of(context)!.settings.arguments as int;
    return Consumer<QuotesProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quote",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  Provider.of<QuoteBookMarkProvider>(context, listen: false)
                      .chagequotes(quotes: provider.AllQuotes[index].quote);
                  Provider.of<QuoteBookMarkProvider>(context, listen: false)
                      .chagequotes(quotes: provider.AllQuotes[index].image);
                },
                icon: Icon(
                  Icons.bookmark,
                  color: Colors.white,
                  size: 20,
                ))
          ],
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage("${provider.AllQuotes[index].image}"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 250,
              width: double.infinity,
              margin: EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Text(
                    "${provider.AllQuotes[index].quote}\n       -${provider.AllQuotes[index].author}",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                      "https://i.pinimg.com/originals/a3/b9/21/a3b9210ec332a5adcfcf87cfe4ac5377.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
