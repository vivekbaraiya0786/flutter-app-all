import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddTodoPage extends StatefulWidget {
  const AddTodoPage({super.key});

  @override
  State<AddTodoPage> createState() => _AddTodoPageState();
}

class _AddTodoPageState extends State<AddTodoPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController desController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add todo"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(hintText: "Title"),
          ),
          const SizedBox(
            height: 10,
          ),
          TextField(
            controller: desController,
            decoration: const InputDecoration(
              hintText: "Description",
            ),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(onPressed: submitData, child: const Text("Submit"))
        ],
      ),
    );
  }

  Future<void> submitData() async {
    final title = titleController.text;
    final des = desController.text;

    final body = {
      "title": title,
      "description": des,
      "is_completed": false,
    };
    String url = "https://api.nstack.in/v1/todos";
    http.Response res =
        await http.post(Uri.parse(url), body: jsonEncode(body), headers: {
      "Content-Type": "application/json",
    });
    if (res.statusCode == 201) {
      print(res);
      print(res.statusCode);
      titleController.text = '';
      desController.text = '';
      setState(() {});
      Navigator.of(context).pushNamed("/");
      showSuccessMessage('creation Sucess');
    } else {
      print("Ceated failed");
      print(res.body);
      showErrorMessage('creation Failed');
    }
  }

  showSuccessMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.green,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      duration: const Duration(seconds: 3),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
