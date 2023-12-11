import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/json/geeta-app/Language-Change-Provider.dart';
import '../../../../Controller/Provider/json/geeta-app/all_chepter_provider.dart';
import '../../../../Controller/Provider/json/geeta-app/sholakProvider.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';
import '../../../../Modals/json/Geeta-App/sholak_modal.dart';

class Verse_deatils extends StatefulWidget {
  const Verse_deatils({super.key});

  @override
  State<Verse_deatils> createState() => _Verse_deatilsState();
}

class _Verse_deatilsState extends State<Verse_deatils> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Chapter_Provider>(context, listen: false).englishLanuage();
  }

  @override
  Widget build(BuildContext context) {
    ChapterModal shlok = Provider.of<Chapter_Provider>(context)
        .shlokJsonDecodeModel
        .allShloks[shlokIndex];
    return Scaffold(
      appBar: AppBar(
        title: (Provider.of<Language_Change_Provider>(context)
                .language_change_modal
                .changeLanguage)
            ? Text(
                "${Provider.of<AllChepterProvider>(context).jsonDecodeModal.allChepter[chapterIndex].nameTranslation} : ${shlok.verse}")
            : Text(Provider.of<AllChepterProvider>(context)
                .jsonDecodeModal
                .allChepter[chapterIndex]
                .name),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("${shlok.san}", style: const TextStyle(fontSize: 22)),
              const SizedBox(
                height: 14,
              ),
              const Text(
                "Translation",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Chapter_Provider>(context, listen: false)
                          .gujaratiLanuage();
                    },
                    child: const Text("Gujarati"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Chapter_Provider>(context, listen: false)
                          .hindiLanuage();
                    },
                    child: const Text("Hindi"),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<Chapter_Provider>(context, listen: false)
                          .englishLanuage();
                    },
                    child: const Text("English"),
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
              Text("${shlok.translation}", style: TextStyle(fontSize: 22)),
            ],
          ),
        ),
      ),
    );
  }
}
