import 'package:flutter/material.dart';
import 'package:practical_exam/provider/shared_prefProvider.dart';
import 'package:provider/provider.dart';

class BookMarks extends StatefulWidget {
  const BookMarks({super.key});

  @override
  State<BookMarks> createState() => _BookMarksState();
}

class _BookMarksState extends State<BookMarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BookMarks",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.grid_view_outlined,
                color: Colors.deepPurple,
              ),
            ),
          ],
        ),
        body: Consumer<QuoteBookMarkProvider>(
            builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.bookmarkModel.quotes.length,
            itemBuilder: (context, index) => ListTile(
              title: Text("${provider.bookmarkModel.quotes[index]}"),
            ),
          );
        }));
  }
}
