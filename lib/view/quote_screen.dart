import 'package:flutter/material.dart';
import 'package:practical_exam/helper/helper_class.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Motivational Quotes",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: Container(),
      ),
      body: FutureBuilder(
        future: APIhelper.apihelper.getQuotesResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column();
          } else if (snapshot.hasError) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
