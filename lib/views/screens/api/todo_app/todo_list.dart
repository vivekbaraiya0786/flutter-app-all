import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:projects/helper/api/api_helper/api_helper.dart';
import 'package:projects/views/screens/api/todo_app/todo_add.dart';

import '../../../../Modals/api/todo-app/todo_modal.dart';

class todo_homepage extends StatefulWidget {
  const todo_homepage({super.key});

  @override
  State<todo_homepage> createState() => _todo_homepageState();
}

class _todo_homepageState extends State<todo_homepage> {
  TodoModal? todoModal;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchTodo();
  }

  Future<TodoModal?> fetchTodo() async {
    todoModal = await Api_Helper.api_helper.fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      floatingActionButton: OutlinedButton(
        onPressed: navigateToAddPage,
        child: Text("Add Todo"),
      ),
      body: RefreshIndicator(
        onRefresh: fetchTodo,
        child: FutureBuilder(
          future: Api_Helper.api_helper.fetchTodo(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text("ERROR : ${snapshot.error}"),
              );
            } else if (snapshot.hasData) {
              TodoModal? todoModal = snapshot.data;
              print(todoModal);
              if (todoModal != null) {
                return Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: ListView.builder(
                        itemCount: todoModal.items.length,
                        itemBuilder: (context, index) {
                          Item item = todoModal.items[index];
                          final id = item.id;
                          return ListTile(
                            leading: Text("${index + 1}"),
                            title: Text("${item.title}"),
                            subtitle: Text("${item.description}"),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {}, icon: Icon(Icons.edit)),
                                IconButton(
                                    onPressed: () {
                                      deleteById(id);
                                    },
                                    icon: Icon(Icons.delete)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text("No Data Avaiable"),
                );
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }

  void navigateToAddPage() {
    final route = MaterialPageRoute(
      builder: (context) => AddTodoPage(),
    );
    Navigator.of(context).push(route);
  }

  Future<void> deleteById(String id) async {
    final url = "https://api.nstack.in/v1/todos/$id";
    http.Response res = await http.delete(Uri.parse(url));
    if (res.statusCode == 200) {
      fetchTodo();
    }
  }
}
