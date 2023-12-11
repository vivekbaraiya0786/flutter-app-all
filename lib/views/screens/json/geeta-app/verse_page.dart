import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/json/geeta-app/Language-Change-Provider.dart';
import '../../../../Controller/Provider/json/geeta-app/all_chepter_provider.dart';
import '../../../../Controller/Provider/json/geeta-app/sholakProvider.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';
import '../../../../Modals/json/Geeta-App/sholak_modal.dart';

class verse_page extends StatefulWidget {
  const verse_page({super.key});

  @override
  State<verse_page> createState() => _verse_pageState();
}

class _verse_pageState extends State<verse_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Provider.of<Chapter_Provider>(context).loadJsondata([]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (Provider.of<Language_Change_Provider>(context)
                .language_change_modal
                .changeLanguage)
            ? Text(Provider.of<AllChepterProvider>(context)
                .jsonDecodeModal
                .allChepter[chapterIndex]
                .nameTranslation)
            : Text(Provider.of<AllChepterProvider>(context)
                .jsonDecodeModal
                .allChepter[chapterIndex]
                .name),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: ListView.builder(
          padding: const EdgeInsets.all(9),
          itemCount: Provider.of<Chapter_Provider>(context)
              .shlokJsonDecodeModel
              .allShloks
              .length,
          itemBuilder: (context, index) {
            ChapterModal shlok = Provider.of<Chapter_Provider>(context)
                .shlokJsonDecodeModel
                .allShloks[index];
            return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  onTap: () {
                    shlokIndex = index;
                    Navigator.of(context).pushNamed("Verse_deatils");
                  },
                  leading: Text(shlok.verse),
                  title: Text(shlok.san),
                ));
          },
        ),
      ),
    );
  }
}
