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
        backgroundColor: Colors.deepPurple,
        title: Text(
          "BookMarks",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.white,
            size: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.grid_view_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Consumer<QuoteBookMarkProvider>(
        builder: (context, provider, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: provider.bookmarkModel.quotes.length,
                  itemBuilder: (context, index) => ListTile(
                    title: Text(
                      "${provider.bookmarkModel.quotes[index]}",
                      style: TextStyle(
                        color: Colors.deepPurple,
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        Provider.of<QuoteBookMarkProvider>(context,
                                listen: false)
                            .deletequotes(quotes: "");
                      },
                      icon: Icon(
                        Icons.delete,
                        size: 20,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: provider.imagebookmarkModel.image.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: AspectRatio(
                      aspectRatio: 2,
                      child: CircleAvatar(
                        foregroundImage: NetworkImage(
                          provider.imagebookmarkModel.image[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
