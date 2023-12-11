import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../Controller/Provider/api/fitness_app/fitness_app.dart';
import '../../../../Modals/api/fitness-app/fitness_modal.dart';

class fitness_Home_Page extends StatefulWidget {
  const fitness_Home_Page({super.key});

  @override
  State<fitness_Home_Page> createState() => _fitness_Home_PageState();
}

class _fitness_Home_PageState extends State<fitness_Home_Page> {
  late Future<List<FitnessModal>?> fitnessData;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fitnessData = Provider.of<fitnessProvider>(context, listen: false)
        .fetchdata(Provider.of<fitnessProvider>(context, listen: false).search);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fitness-App"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: FutureBuilder(
              future: fitnessData,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  Center(
                    child: Text("ERROR : ${snapshot.error}"),
                  );
                } else if (snapshot.hasData) {
                  List<FitnessModal>? data = snapshot.data;

                  return ListView.builder(
                    itemCount: data!.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Card(
                          color: Colors
                              .primaries[
                                  Random().nextInt(Colors.primaries.length)]
                              .shade200,
                          margin: const EdgeInsets.all(14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("${index + 1}"),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("Name : ${data[index].name}"),
                                      Text("Type : ${data[index].type}"),
                                      Text("Muscle : ${data[index].muscle}"),
                                      Text(
                                          "Equipment : ${data[index].equipment}"),
                                      Text(
                                          "Difficulty : ${data[index].difficulty}"),
                                      const SizedBox(
                                        height: 14,
                                      ),
                                      Text(
                                          "Instructions : ${data[index].instructions}"),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: searchController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: "Please Search"),
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  Provider.of<fitnessProvider>(context, listen: false).search =
                      value;
                  setState(() {
                    fitnessData = Provider.of<fitnessProvider>(context,
                            listen: false)
                        .fetchdata(
                            Provider.of<fitnessProvider>(context, listen: false)
                                .search);
                    print(
                        "${Provider.of<fitnessProvider>(context, listen: false).search}");
                  });
                  searchController.clear();
                }
              },
            ),
          )),
        ],
      ),
    );
  }
}
