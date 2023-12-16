import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/Controller/get/e-commerce_get/counter_controller.dart';

class e_commerce_home_page extends StatefulWidget {
  const e_commerce_home_page({super.key});

  @override
  State<e_commerce_home_page> createState() => _e_commerce_home_pageState();
}

class _e_commerce_home_pageState extends State<e_commerce_home_page> {
  CounterController cc = Get.put(CounterController());
  CounterController1 cc1 = Get.put(CounterController1());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                (Get.isDarkMode)
                    ? Get.changeTheme(ThemeData.light(useMaterial3: true))
                    : Get.changeTheme(ThemeData.dark(useMaterial3: true));
              });
              print(Get.isDarkMode);
            },
            icon: (Get.isDarkMode) ? Icon(Icons.dark_mode) : Icon(Icons.light),
          ),
          IconButton(
              onPressed: () {
                Get.toNamed("/cart_page");
              },
              icon: Icon(Icons.shopping_cart)),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Obx(() {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("${cc1.counterModal1.i1}"),
              Row(
                children: [
                  IconButton(
                      onPressed: () {
                        cc1.increment();
                      },
                      icon: Icon(Icons.add)),
                  IconButton(
                      onPressed: () {
                        cc1.decrement();
                      },
                      icon: Icon(Icons.remove)),
                ],
              ),
              GetBuilder<CounterController>(
                builder: (controller) {
                  return Text(
                    "${cc.counterModal.i}",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              Row(mainAxisSize: MainAxisSize.min, children: []),
            ],
          );
        }),
      ),
      floatingActionButton: GetBuilder<CounterController>(
        builder: (controller) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  cc.increment();
                },
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: 10,
              ),
              FloatingActionButton(
                onPressed: () {
                  cc.decrement();
                },
                child: Icon(Icons.remove),
              ),
            ],
          );
        },
      ),
    );
  }
}
