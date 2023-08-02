import 'package:flutter/material.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:provider/provider.dart';

class QuotesDetailScreen extends StatefulWidget {
  const QuotesDetailScreen({super.key});

  @override
  State<QuotesDetailScreen> createState() => _QuotesDetailScreenState();
}

class _QuotesDetailScreenState extends State<QuotesDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Quote",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.deepPurple,
        ),
        body: Column(
          children: [
            Stack(children: [
              Container(
                height: 250,
                width: double.infinity,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://i.pinimg.com/originals/a3/b9/21/a3b9210ec332a5adcfcf87cfe4ac5377.jpg"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text("${provider.AllQuotes}")
            ]),
          ],
        ),
      );
    });
  }
}
