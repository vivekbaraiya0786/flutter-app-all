import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projects/helper/firebase/firebase_auth_helper.dart';

class FireStoreHelper {
  FireStoreHelper._();

  static final FireStoreHelper fireStoreHelper = FireStoreHelper._();
  static final FirebaseFirestore db = FirebaseFirestore.instance;
  static String? toUid;
  static String? chatDocId;

  //todo:insert user while sign in

  // insertWhileSignIn({required Map<String, dynamic> data}) async {
  //   DocumentReference documentReference =
  //       await db.collection("users").add(data);
  //
  //   String docId = documentReference.id;
  //
  //   print("============");
  //   print("DOC ID : ${docId}");
  //   print("============");
  // }

  insertWhileSignIn({required Map<String, dynamic> data}) async {
    DocumentSnapshot<Map<String, dynamic>> docSnapshot =
        await db.collection("records").doc("users").get();

    Map<String, dynamic> res = docSnapshot.data() as Map<String, dynamic>;

    int id = res['id'];
    int length = res['length'];

    await db.collection("users").doc("${++id}").set(data);

    await db
        .collection("records")
        .doc("users")
        .update({'id': id, 'length': ++length});
  }

  Stream displayAllUser() {
    Stream<QuerySnapshot<Map<String, dynamic>>> userStream =
        db.collection("users").snapshots();
    return userStream;
  }

  createChatRoomDocument() async {
    String uid1 = FireBaseAuthHelper.currentUser!.uid;
    String uid2 = toUid!;

    String user1 = "${uid1}_$uid2";
    String user2 = "${uid2}_$uid1";
    bool chatDocExit = false;

    QuerySnapshot<Map<String, dynamic>> snapshot =
        await db.collection("chatroom").get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> chatDocList =
        snapshot.docs;

    if (chatDocList.isNotEmpty) {
      for (var elemets in chatDocList) {
        if (elemets.id == user1 || elemets.id == user2) {
          chatDocExit = true;
          chatDocId = elemets.id;
          break;
        } else {
          chatDocId = user1;
        }
      }

      if (chatDocExit == false) {
        await db.collection("chatroom").doc(user1).set({
          "user": [uid1, uid1]
        });
      }
    } else {
      chatDocId = user1;

      await db.collection("chatroom").doc(user1).set({
        "users": [uid1, uid2]
      });
    }
  }
}
