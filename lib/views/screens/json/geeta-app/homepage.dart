import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/json/geeta-app/Language-Change-Provider.dart';
import '../../../../Controller/Provider/json/geeta-app/all_chepter_provider.dart';
import '../../../../Modals/json/Geeta-App/jsondecode_modal.dart';

class geeta_Home_Page extends StatefulWidget {
  const geeta_Home_Page({super.key});

  @override
  State<geeta_Home_Page> createState() => _geeta_Home_PageState();
}

class _geeta_Home_PageState extends State<geeta_Home_Page> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadJson();
  }

  Future<void> loadJson() async {
    await Provider.of<AllChepterProvider>(context, listen: false).loadJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
              onPressed: () {
                Provider.of<Language_Change_Provider>(context, listen: false)
                    .changeLanguage();
              },
              icon: Icon(Icons.change_circle)),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: Provider.of<AllChepterProvider>(context)
              .jsonDecodeModal
              .allChepter
              .length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8),
              child: ListTile(
                onTap: () {
                  chapterIndex = index;
                  Navigator.of(context).pushNamed("chapter-DetailsPage");
                },
                leading: Text(
                    "${Provider.of<AllChepterProvider>(context).jsonDecodeModal.allChepter[index].id}"),
                title: (Provider.of<Language_Change_Provider>(context)
                        .language_change_modal
                        .changeLanguage)
                    ? Text(Provider.of<AllChepterProvider>(context)
                        .jsonDecodeModal
                        .allChepter[index]
                        .nameTranslation)
                    : Text(Provider.of<AllChepterProvider>(context)
                        .jsonDecodeModal
                        .allChepter[index]
                        .name),
                subtitle: Text(
                    "${Provider.of<AllChepterProvider>(context).jsonDecodeModal.allChepter[index].versesCount}"),
              ),
            );
          },
        ),
      ),
    );
  }
}
