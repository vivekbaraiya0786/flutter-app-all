import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../Modals/api/news_app/news_modal.dart';

class NewsDetails extends StatefulWidget {
  const NewsDetails({super.key});

  @override
  State<NewsDetails> createState() => _NewsDetailsState();
}

class _NewsDetailsState extends State<NewsDetails> {
  @override
  Widget build(BuildContext context) {
    Article? article = ModalRoute.of(context)!.settings.arguments as Article?;
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          Card(
            margin: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Container(
                    height: 270,
                    width: 330,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black),
                      image: DecorationImage(
                          image: NetworkImage("${article?.urlToImage}"),
                          fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Title : ${article?.title}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Description : ${article?.description}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          _launchURL(article?.url);
                          print("1");
                        },
                        child: Text(
                          "${article?.url}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Content : ${article?.content}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "publishedAt : ${article?.publishedAt}",
                    style: const TextStyle(fontSize: 18),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Author : ${article?.author}",
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _launchURL(String? url) async {
    if (url != null && await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error
      print('Could not launch $url');
    }
  }
}
