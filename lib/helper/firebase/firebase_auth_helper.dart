import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projects/helper/firebase/firestore_helper.dart';

class FireBaseAuthHelper {
  FireBaseAuthHelper._();

  static final FireBaseAuthHelper fireBaseAuthHelper = FireBaseAuthHelper._();
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final GoogleSignIn googleSignIn = GoogleSignIn();
  static User? currentUser;
  static final db = FireStoreHelper.db;
  static String verify = "";
  static String? userDocumentId;

  fetchCurrentUser() {
    currentUser = firebaseAuth.currentUser!;
  }

  Future<bool> userExits() async {
    fetchCurrentUser();
    bool isUserExit = false;

    QuerySnapshot<Map<String, dynamic>> collectionSnapshot =
        await db.collection("users").get();

    List<QueryDocumentSnapshot<Map<String, dynamic>>> data =
        collectionSnapshot.docs;

    for (int i = 0; i < data.length; i++) {
      if (data[i]['uid'] == currentUser!.uid) {
        isUserExit = true;
        break;
      }
    }
    return isUserExit;
  }

  // Future<User?> signAnonymously() async {
  //   UserCredential userCredential = await firebaseAuth.signInAnonymously();
  //   User? user = userCredential.user;
  //   return user;
  // }

  // Future<User?> signWithEmailPassword(
  //     {required String email, required String password}) async {
  //   UserCredential userCredential = await firebaseAuth
  //       .createUserWithEmailAndPassword(email: email, password: password);
  //   User? user = userCredential.user;
  //   return user;
  // }

  // Future<User?> loginEmailPassword(
  //     {required String email, required String password}) async {
  //   UserCredential userCredential = await firebaseAuth
  //       .signInWithEmailAndPassword(email: email, password: password);
  //   User? user = userCredential.user;
  //   return user;
  // }

  // Future<User?> logInWithGoogle() async {
  //   GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //   GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   UserCredential userCredential =
  //       await firebaseAuth.signInWithCredential(credential);
  //   User? user = userCredential.user;
  //   return user;
  // }

  Future<Map<String, dynamic>> signAnonymously() async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential = await firebaseAuth.signInAnonymously();
      User? user = userCredential.user;
      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          data['msg'] = "Please Connect Your Internet";
        case "admin-restricted-operation":
          data['msg'] = "Service temp down";
        default:
          data['msg'] = e.code;
      }
    }
    return data;
  }

  Future<Map<String, dynamic>> loginEmailPassword(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      data['user'] = user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          data['msg'] = "Please Connect Your Internet";
        case "admin-restricted-operation":
          data['msg'] = "Service temp down";
        case "weak-password":
          data['msg'] = "must be greater than 6 letter";
        case "already-in-use":
          data['msg'] = "user with this email already sign-in";
        default:
          data['msg'] = e.code;
      }
    }
    return data;
  }

  Future<Map<String, dynamic>> signWithEmailPassword(
      {required String email, required String password}) async {
    Map<String, dynamic> data = {};

    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;
      data['user'] = user;
      Map<String, dynamic> userData = {
        'email': user!.email,
        'uid': user.uid,
      };

      bool isUserExit = await userExits();
      if (isUserExit == false) {
        await FireStoreHelper.fireStoreHelper.insertWhileSignIn(data: userData);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          data['msg'] = "Please Connect Your Internet";
        case "admin-restricted-operation":
          data['msg'] = "Service temp down";
        case "wrong-password":
          data['msg'] = "password is wrong";
        case "user-not-found":
          data['msg'] = "user doesn't exit this email";
        case "user-disabled":
          data['msg'] = "user is disabled contact admin";
        default:
          data['msg'] = e.code;
      }
    }
    return data;
  }

  Future<Map<String, dynamic>> logInWithGoogle() async {
    Map<String, dynamic> data = {};

    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);
      User? user = userCredential.user;
      data['user'] = user;

      Map<String, dynamic> userData = {
        'email': user!.email,
        'uid': user.uid,
      };
      bool isUserExits = await userExits();
      if (isUserExits == false) {
        await FireStoreHelper.fireStoreHelper.insertWhileSignIn(data: userData);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "network-request-failed":
          data['msg'] = "Please Connect Your Internet";
        case "admin-restricted-operation":
          data['msg'] = "Service temp down";
        case "user-disabled":
          data['msg'] = "user is disabled contact admin";
        default:
          data['msg'] = e.code;
      }
    }
    return data;
  }

  void signOut() async {
    await firebaseAuth.signOut();
    await googleSignIn.signOut();
  }
}
