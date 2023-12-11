import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/api/logo_app/logo_proivder.dart';
import '../../../../Modals/api/logo-app/logo_nodal.dart';

class Logo_HomePage extends StatefulWidget {
  const Logo_HomePage({super.key});

  @override
  State<Logo_HomePage> createState() => _Logo_HomePageState();
}

class _Logo_HomePageState extends State<Logo_HomePage> {
  late Future<List<LogoModal>?> logodata;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    logodata = Provider.of<LogoProvider>(context, listen: false).fetchData(
      Provider.of<LogoProvider>(context, listen: false).search,
    );
  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: FutureBuilder(
              future: logodata,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<LogoModal>? data = snapshot.data;

                  return ListView.builder(
                    itemCount: data?.length,
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Container(
                                height: 400,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data![index].image),
                                        fit: BoxFit.contain)),
                              ),
                            ),
                            Text("Name : ${data[index].name}"),
                            Text("Ticker : ${data[index].ticker}"),
                          ],
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Expanded(
              child: TextField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: "Search Logo"),
            controller: textEditingController,
            onSubmitted: (value) {
              onSubmitted:
              (value) {
                if (value.isNotEmpty) {
                  Provider.of<LogoProvider>(context, listen: false).search =
                      value;
                  setState(() {
                    logodata = Provider.of<LogoProvider>(context, listen: false)
                        .fetchData(
                            Provider.of<LogoProvider>(context, listen: false)
                                .search);
                  });
                  textEditingController.clear();
                  print(
                      Provider.of<LogoProvider>(context, listen: false).search);
                }
              };
            },
          )),
        ],
      ),
    );
  }
}
