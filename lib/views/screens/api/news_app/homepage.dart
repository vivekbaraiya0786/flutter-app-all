import 'package:flutter/material.dart';

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
        title: const Text("HomePage"),
      ),
      body: FutureBuilder(
        future: Api_Helper.api_helper.fetchNews(country, category, language),
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
                              Navigator.of(context)
                                  .pushNamed("NewsDetails", arguments: article);
                            },
                          ),
                        );
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
                                height: 300,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: "Enter Country"),
                                        controller: countryController,
                                        onSubmitted: (value) {
                                          setState(() {
                                            if (value.isNotEmpty) {
                                              // Provider.of<news_Provider>(context, listen: false)
                                              //     .chooseCountry(value);
                                              // print(value);
                                              country = value;
                                            }
                                            countryController.clear();

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
    );
  }
}
