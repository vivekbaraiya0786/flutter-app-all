import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/api/news_app/news_provider.dart';
import '../../../../Modals/api/news_app/news_modal.dart';
import '../../../../helper/api/api_helper/api_helper.dart';

class News_HomePage extends StatefulWidget {
  const News_HomePage({super.key});

  @override
  State<News_HomePage> createState() => _News_HomePageState();
}

class _News_HomePageState extends State<News_HomePage> {
  // late Future<NewsModal?> news;
  NewsModal? news;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // news = Provider.of<news_Provider>(context, listen: false).fetchData(
    //   Provider.of<news_Provider>(context, listen: false).country,
    //   Provider.of<news_Provider>(context, listen: false).category,
    //   Provider.of<news_Provider>(context, listen: false).language,
    // );
    fetchdata();
  }

  String country = "in";
  String category = "business";
  String language = "en";

  Future<NewsModal?> fetchdata() async {
    news = await Api_Helper.api_helper.fetchNews(country, category, language);
  }

  TextEditingController countryController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController languageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News App"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: FutureBuilder(
              future:
                  Api_Helper.api_helper.fetchNews(country, category, language),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  NewsModal? newsdata = snapshot.data;
                  print(newsdata);
                  if (newsdata != null) {
                    return Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: ListView.builder(
                            itemCount: newsdata.articles.length,
                            itemBuilder: (context, index) {
                              Article? article = newsdata.articles[index];
                              Source? source = newsdata.articles[index].source;
                              return Padding(
                                padding: const EdgeInsets.all(4),
                                child: ListTile(
                                  leading: CircleAvatar(
                                    backgroundImage:
                                        NetworkImage("${article.urlToImage}"),
                                    radius: 40,
                                  ),
                                  title: Text("Title : ${article.title}"),
                                  subtitle: Text("Source : ${source!.name}"),
                                  onTap: () {
                                    Navigator.of(context).pushNamed(
                                        "NewsDetails",
                                        arguments: article);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: Text("No Data Avaiable"),
                    );
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 330,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Enter Your Preference",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter Country"),
                                controller: countryController,
                                onSubmitted: (value) {
                                  if (value.isNotEmpty) {
                                    Provider.of<news_Provider>(context,
                                            listen: false)
                                        .country = value;
                                    setState(() {
                                      Provider.of<news_Provider>(context,
                                              listen: false)
                                          .chooseCountry(value);
                                    });
                                    print(value);
                                  }
                                  countryController.clear();

                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter category"),
                                controller: categoryController,
                                onSubmitted: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      // Provider.of<news_Provider>(context, listen: false)
                                      //     .chooseCountry(value);
                                      // print(value);
                                      category = value;
                                    }
                                    categoryController.clear();

                                    Navigator.of(context).pop();
                                  });
                                },
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: TextField(
                                decoration: const InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintText: "Enter language"),
                                controller: languageController,
                                onSubmitted: (value) {
                                  setState(() {
                                    if (value.isNotEmpty) {
                                      // Provider.of<news_Provider>(context, listen: false)
                                      //     .chooseCountry(value);
                                      // print(value);
                                      language = value;
                                    }
                                    languageController.clear();
                                  });
                                  Navigator.of(context).pop();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: const Text("View"),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
