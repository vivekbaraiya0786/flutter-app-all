import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/api/qoutes_app_api/qoute_app_provider.dart';
import '../../../../Modals/api/qoutes_app_api/qoute_modal.dart';

class qoute_home_page extends StatefulWidget {
  const qoute_home_page({super.key});

  @override
  State<qoute_home_page> createState() => _qoute_home_pageState();
}

class _qoute_home_pageState extends State<qoute_home_page> {
  late Future<List<QoutesModal>?> qoutesdata;

  @override
  void initState() {
    super.initState();
    qoutesdata = Provider.of<qoute_app_proivder>(context, listen: false)
        .fetchqouteData(
            Provider.of<qoute_app_proivder>(context, listen: false).name);
  }

  TextEditingController qoutesControler = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Qoutes App"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Search",
                ),
                controller: qoutesControler,
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    Provider.of<qoute_app_proivder>(context, listen: false)
                        .name = value;
                    setState(() {
                      qoutesdata = Provider.of<qoute_app_proivder>(context,
                              listen: false)
                          .fetchqouteData(
                        Provider.of<qoute_app_proivder>(context, listen: false)
                            .name,
                      );
                    });
                  }
                  qoutesControler.clear();
                },
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: FutureBuilder(
              future: qoutesdata,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(child: Text("ERROR : ${snapshot.error}"));
                } else if (snapshot.hasData) {
                  List<QoutesModal>? data = snapshot.data;

                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      print(data[index].category);
                      return Card(
                        margin: EdgeInsets.all(12),
                        child: ListTile(
                          isThreeLine: true,
                          leading: Text("${index + 1}"),
                          title: Text("Category : ${data[index].category}"),
                          subtitle: Text(
                              "Author : ${data[index].author}\nQoute :${data[index].quote}"),
                        ),
                      );
                    },
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
