import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/helper/firebase/firebase_auth_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    User? user = ModalRoute.of(context)!.settings.arguments as User?;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Auth"),
        actions: [
          IconButton(
              onPressed: () {
                FireBaseAuthHelper.fireBaseAuthHelper.signOut();
                const GetSnackBar(
                  title: "logout",
                  message: "Successfully logout",
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.green,
                );
                Get.offNamed("/LoginPage");
              },
              icon: const Icon(CupertinoIcons.power))
        ],
      ),
      drawer: Drawer(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage("${user?.photoURL}"),
            ),
            Text("${user?.displayName}"),
            const Divider(),
            (user!.isAnonymous)
                ? const Text("")
                : (user.displayName == null)
                    ? const Text("")
                    : Text("${user.displayName}"),
            (user.isAnonymous) ? const Text("") : Text("${user.email}"),
          ],
        ),
      ),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: StreamBuilder(
            // stream: FireStoreHelper.fireStoreHelper.displayAllUser(),
            stream: FirebaseFirestore.instance.collection("users").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("ERROR : ${snapshot.error}"),
                );
              } else if (snapshot.hasData) {
                QuerySnapshot<Map<String, dynamic>> data =
                    snapshot.data as QuerySnapshot<Map<String, dynamic>>;
                List<QueryDocumentSnapshot<Map<String, dynamic>>> allDocs =
                    data.docs;
                List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
                    [];

                for (int i = 0; i < allDocs.length; i++) {
                  if (user.uid != allDocs[i].data()['uid']) {
                    documents.add(allDocs[i]);
                  }
                }
                return ListView.builder(
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    print("${allDocs[index].data()['email']}");
                    return ListTile(
                      leading: Text("${index + 1}"),
                      title: Text("${documents[index].data()['email']}"),
                      subtitle: Text("${documents[index].data()['uid']}"),
                      onTap: () {
                        Get.toNamed("/chatPage");
                      },
                    );
                  },
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          )),
    );
  }
}
