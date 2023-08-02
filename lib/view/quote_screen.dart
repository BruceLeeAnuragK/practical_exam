import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:practical_exam/provider/themeProvider.dart';
import 'package:provider/provider.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.deepPurple,
            title: Text(
              "Motivational Quotes",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  Provider.of<ThemeProvider>(context, listen: false)
                      .changeTheme();
                },
                icon: Provider.of<ThemeProvider>(context, listen: true)
                        .themeModel
                        .isDark
                    ? Icon(
                        Icons.nightlight,
                        color: Colors.black,
                      )
                    : Icon(
                        Icons.sunny,
                        color: Colors.white,
                      ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).pushNamed("bookmark");
                },
                icon: Icon(
                  Icons.star_border,
                  size: 25,
                  color: Colors.white,
                ),
              ),
            ],
            centerTitle: true,
            leading: Container(),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 2,
                child: CarouselSlider(
                  items: provider.imageList.map((i) {
                    return Container(
                      height: 250,
                      width: double.infinity,
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: NetworkImage(i),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    autoPlay: true,
                    height: 250,
                    aspectRatio: 1.0,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, reason) =>
                        provider.changeCurrentPageIndex(index),
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount: provider.imageList.length,
                position: provider.currentIndex,
                decorator: DotsDecorator(
                  color: Colors.deepPurple.shade100,
                  activeColor: Colors.deepPurple,
                  size: Size.fromRadius(5),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20),
                          child: MaterialButton(
                            color: Colors.deepPurple,
                            onPressed: () {
                              provider.fetchAllQuotes =
                                  provider.fetchAllQuotes + 1;
                            },
                            child: Text(
                              "Fetch Quotes",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            provider.fetchAllQuotes =
                                provider.fetchAllQuotes - 1;
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.deepPurple,
                            size: 40,
                          ),
                        ),
                      ],
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    ),
                    provider.fetchAllQuotes > 0
                        ? Expanded(
                            child: SizedBox(
                              height: 300,
                              child: ListView.builder(
                                  itemCount: provider.fetchAllQuotes,
                                  itemBuilder: (context, index) {
                                    print(
                                        "id: ${provider.AllQuotes[index].id}");
                                    print("index ${index}");
                                    return Card(
                                      color: Colors.deepPurple,
                                      child: ListTile(
                                        onTap: () {
                                          Navigator.of(context).pushNamed(
                                              "quotes_detail_page",
                                              arguments: index);
                                          provider
                                              .changeCurrentPageIndex(index);
                                        },
                                        title: Text(
                                          provider.AllQuotes[index].quote,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        subtitle: Text(
                                          provider.AllQuotes[index].author,
                                          style:
                                              TextStyle(color: Colors.yellow),
                                        ),
                                        leading: Text(
                                          "${provider.AllQuotes[index].id}",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25),
                                        ),
                                        trailing: Icon(
                                          Icons.navigate_next,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          )
                        : Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Text(
                                    "The Quotes will be appear here,\npress Fetch Quotes to get all Quotes",
                                    style: TextStyle(
                                      color: Colors.deepPurple.shade200,
                                      fontSize: 15,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                ),
                              ],
                            ),
                          ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
