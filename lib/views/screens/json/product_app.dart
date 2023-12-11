import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../Modals/json/product_app/product_modal.dart';

class product_homepage extends StatefulWidget {
  const product_homepage({super.key});

  @override
  State<product_homepage> createState() => _product_homepageState();
}

class _product_homepageState extends State<product_homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loaddata();
  }

  ProductModal? productdata;

  loaddata() async {
    String data =
        await rootBundle.loadString("Assets/product_app/product.json");
    Map decodedata = jsonDecode(data);
    // print(decodedata);
    productdata = ProductModal.fromJson(json: decodedata);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product-App"),
      ),
      body: ListView.builder(
        itemCount: productdata?.productsData.length,
        itemBuilder: (context, index) {
          return Container(
            padding: const EdgeInsets.all(12),
            child: Card(
              margin: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 300,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              (productdata?.productsData[index].image == null)
                                  ? "https://cdn.pixabay.com/photo/2017/02/12/21/29/false-2061131_1280.png"
                                  : "${productdata?.productsData[index].image}",
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    (productdata?.productsData[index].name != null)
                        ? "Product Name : ${productdata?.productsData[index].name}"
                        : "No Name Available",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    (productdata?.productsData[index].category != null)
                        ? "Category : ${productdata?.productsData[index].category}"
                        : "No Name Available",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    (productdata?.productsData[index].ratings != null)
                        ? "Rating : ${productdata?.productsData[index].ratings}"
                        : "No Name Available",
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Text(
                    (productdata?.productsData[index].price != null)
                        ? "Price : ${productdata?.productsData[index].price}"
                        : "No Name Available",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
