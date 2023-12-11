import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/json/geeta-app/Language-Change-Provider.dart';
import '../../../../Controller/Provider/json/geeta-app/all_chepter_provider.dart';
import '../../../../Controller/Provider/json/geeta-app/sholakProvider.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';

class chepter_Details_page extends StatefulWidget {
  const chepter_Details_page({super.key});

  @override
  State<chepter_Details_page> createState() => _chepter_Details_pageState();
}

class _chepter_Details_pageState extends State<chepter_Details_page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJSON();
  }

  Future<void> loadJSON() async {
    await Provider.of<Chapter_Provider>(context, listen: false).loadJsondata(
        Provider.of<AllChepterProvider>(context, listen: false)
            .jsonDecodeModal
            .allChepter);
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
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Language_Change_Provider>(context, listen: false)
                    .changeLanguage();
              },
              icon: const Icon(Icons.change_circle)),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(12),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            Container(
              height: 400,
              width: 200,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: AssetImage(
                      "Assets/geeta-app-data/images/${Provider.of<AllChepterProvider>(context).jsonDecodeModal.allChepter[chapterIndex].imageName}.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            (Provider.of<Language_Change_Provider>(context)
                    .language_change_modal
                    .changeLanguage)
                ? const Text("Name Meaning :")
                : const Text("नाम का अर्थ :"),
            Text(Provider.of<AllChepterProvider>(context)
                .jsonDecodeModal
                .allChepter[chapterIndex]
                .nameMeaning),
            const SizedBox(
              height: 16,
            ),
            (Provider.of<Language_Change_Provider>(context)
                    .language_change_modal
                    .changeLanguage)
                ? const Text("Chapter Summary : ")
                : const Text("अध्याय का सारांश : "),
            (Provider.of<Language_Change_Provider>(context)
                    .language_change_modal
                    .changeLanguage)
                ? Text(Provider.of<AllChepterProvider>(context)
                    .jsonDecodeModal
                    .allChepter[chapterIndex]
                    .chapterSummary)
                : Text(Provider.of<AllChepterProvider>(context)
                    .jsonDecodeModal
                    .allChepter[chapterIndex]
                    .chapterSummaryHindi),
            const SizedBox(
              height: 16,
            ),
            ActionChip(
              label: (Provider.of<Language_Change_Provider>(context)
                      .language_change_modal
                      .changeLanguage)
                  ? const Text("All Verse")
                  : const Text("सभी श्लोक"),
              onPressed: () {
                Navigator.of(context).pushNamed("verse_page");
              },
            )
          ],
        ),
      ),
    );
  }
}
