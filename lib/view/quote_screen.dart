import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practical_exam/helper/helper_class.dart';
import 'package:practical_exam/provider/QuoteProvider.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key});

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<QuotesProvider>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            "Motivational Quotes",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            CupertinoSwitch(
              thumbColor: Colors.deepPurple.shade400,
              trackColor: Colors.white,
              activeColor: Colors.deepPurple.shade900,
              value: provider.isDark,
              onChanged: (val) => provider.changetheme(val: val),
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.star_border,
                  size: 25,
                  color: Colors.white,
                ))
          ],
          centerTitle: true,
          leading: Container(),
        ),
        body: Column(
          children: [
            Expanded(
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
              child: SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: provider.AllQuotes.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      onTap: () {},
                      title: Text(
                        provider.AllQuotes[index],
                        style: TextStyle(
                          color: provider.isDark ? Colors.white : Colors.brown,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        provider.AllQuotes[index],
                        style: TextStyle(
                          color: provider.isDark ? Colors.white : Colors.brown,
                        ),
                      ),
                      leading: Text("Ch:${provider.AllQuotes[index]}"),
                      trailing: Icon(
                        Icons.navigate_next,
                        color: provider.isDark ? Colors.white : Colors.brown,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
