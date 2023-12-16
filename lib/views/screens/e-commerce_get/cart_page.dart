import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/Controller/get/e-commerce_get/counter_controller.dart';

class cart_page extends StatefulWidget {
  const cart_page({super.key});

  @override
  State<cart_page> createState() => _cart_pageState();
}

class _cart_pageState extends State<cart_page> {
  CounterController cc = Get.find<CounterController>();
  CounterController1 cc1 = Get.put(CounterController1());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart Page"),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios)),
        ],
      ),
      body: Obx(() {
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
