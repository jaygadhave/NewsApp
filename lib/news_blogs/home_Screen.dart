import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'article_model.dart';
import 'collectingdata.dart';
import 'news_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ArticleModel> articles = [];

  @override
  void initState() {
    getnews();
    // TODO: implement initState
    super.initState();
  }

  bool _loading = true;

  getnews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFF464646),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Color(0XFF000000),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HEADLINES",
              style: GoogleFonts.robotoSlab(
                textStyle: const TextStyle(
                  color: Color(0XFFFFFFFF),
                  fontSize: 29,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return NewsTile(
                          imageUrl: articles[index].urlToImage,
                          title: articles[index].title,
                          name: articles[index].author,
                          date: articles[index].date,
                          desc: articles[index].description,
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
