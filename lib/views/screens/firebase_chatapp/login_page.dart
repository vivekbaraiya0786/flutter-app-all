import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:projects/helper/firebase/local_notification_helper.dart';
import 'package:timezone/data/latest.dart' as tz;

import '../../../helper/firebase/firebase_auth_helper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  AppLifecycleState? appLifecycleState;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings("mipmap/ic_launcher");
    DarwinInitializationSettings darwinInitializationSettings =
        const DarwinInitializationSettings();
    InitializationSettings initializationSettings = InitializationSettings(
        android: androidInitializationSettings,
        iOS: darwinInitializationSettings);
    tz.initializeTimeZones();

    LocalNotificationHelper.flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        print("===============");
        print("payload : ${notificationResponse.payload}");
        print("===============");
      },
      // onDidReceiveBackgroundNotificationResponse:
      //     (NotificationResponse notificationResponse) {
      //   print("===============");
      //   print("payload : ${notificationResponse.payload}");
      //   print("===============");
      // },
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // TODO: implement didChangeAppLifecycleState
    super.didChangeAppLifecycleState(state);
    appLifecycleState = state;
    print(appLifecycleState);
    // if (state == AppLifecycleState.inactive) {
    //   print("InActive State");
    // }
    // if (state == AppLifecycleState.paused) {
    //   print("paused State");
    // }
    // if (state == AppLifecycleState.resumed) {
    //   print("resumed State");
    // }
    // if (state == AppLifecycleState.detached) {
    //   print("detached/Terminated State");
    // }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text("Enter Email"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your Email",
                ),
                onSaved: (newValue) {
                  setState(() {
                    email = newValue;
                  });
                },
                validator: (value) =>
                    (value!.isEmpty) ? "Please enter your email" : null,
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                children: [
                  Text("Enter password"),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter your password",
                ),
                onSaved: (newValue) {
                  setState(() {
                    password = newValue;
                  });
                },
                validator: (value) =>
                    (value!.isEmpty) ? "Please enter your password" : null,
              ),
              const SizedBox(
                height: 16,
              ),
              // ElevatedButton(
              //     onPressed: () async {
              //       if (formkey.currentState!.validate()) {
              //         (formkey.currentState!.save());
              //         User? user = await FireBaseAuthHelper.fireBaseAuthHelper
              //             .loginEmailPassword(
              //                 email: email!, password: password!);
              //         if (user != null) {
              //           Get.showSnackbar(
              //             const GetSnackBar(
              //               title: "Successfully",
              //               message: "Successfully Login",
              //               duration: Duration(seconds: 3),
              //               backgroundColor: Colors.green,
              //             ),
              //           );
              //           Get.offAllNamed("/");
              //           emailController.clear();
              //           passwordController.clear();
              //         } else {
              //           Get.showSnackbar(
              //             const GetSnackBar(
              //               title: "UnSuccessfully",
              //               message: "Login Failed...",
              //               duration: Duration(seconds: 3),
              //               backgroundColor: Colors.green,
              //             ),
              //           );
              //         }
              //
              //         setState(() {
              //           email = null;
              //           password = null;
              //         });
              //       }
              //     },
              //     child: Text("Login")),

              ElevatedButton(
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      (formkey.currentState!.save());
                      Map<String, dynamic> data = await FireBaseAuthHelper
                          .fireBaseAuthHelper
                          .loginEmailPassword(
                              email: email!, password: password!);
                      if (data['user'] != null) {
                        Get.showSnackbar(
                          const GetSnackBar(
                            title: "Successfully",
                            message: "Successfully Login",
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Get.offAllNamed("/", arguments: data['user']);
                        emailController.clear();
                        passwordController.clear();
                      } else {
                        Get.showSnackbar(
                          GetSnackBar(
                            title: "UnSuccessfully",
                            message: "${data['msg']}",
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                      setState(() {
                        email = null;
                        password = null;
                      });
                    }
                  },
                  child: const Text("Login")),

              const SizedBox(
                height: 16,
              ),
              RichText(
                  text: TextSpan(
                      text: "create have new Account? ",
                      style: const TextStyle(color: Colors.black),
                      children: [
                    TextSpan(
                        text: "Sign up",
                        style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed("/SignUp");
                          }),
                  ])),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // IconButton(
                  //     onPressed: () async {
                  //       User? user = await FireBaseAuthHelper.fireBaseAuthHelper
                  //           .logInWithGoogle();
                  //       if (user != null) {
                  //         Get.showSnackbar(
                  //           const GetSnackBar(
                  //             title: "Successfully",
                  //             message: "Successfully Login",
                  //             duration: Duration(seconds: 3),
                  //             backgroundColor: Colors.green,
                  //           ),
                  //         );
                  //         Get.offNamed("/");
                  //       } else {
                  //         Get.showSnackbar(
                  //           const GetSnackBar(
                  //             title: "UnSuccessfully",
                  //             message: "Login Failed...",
                  //             duration: Duration(seconds: 3),
                  //             backgroundColor: Colors.green,
                  //           ),
                  //         );
                  //       }
                  //     },
                  //     icon: Icon(Icons.email)),

                  IconButton(
                      onPressed: () async {
                        Map<String, dynamic> data = await FireBaseAuthHelper
                            .fireBaseAuthHelper
                            .logInWithGoogle();
                        if (data['user'] != null) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "Successfully",
                              message: "Successfully Login",
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Get.offNamed("/", arguments: data['user']);
                        } else {
                          Get.showSnackbar(
                            GetSnackBar(
                              title: "UnSuccessfully",
                              message: "${data['msg']}",
                              duration: const Duration(seconds: 3),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.email)),

                  // IconButton(
                  //   onPressed: () async {
                  //     User? user = await FireBaseAuthHelper
                  //         .fireBaseAuthHelper
                  //         .signAnonymously();
                  //
                  //     if (user != null) {
                  //       Get.showSnackbar(
                  //         const GetSnackBar(
                  //           title: "Successfully",
                  //           message: "Successfully Login",
                  //           duration: Duration(seconds: 3),
                  //           backgroundColor: Colors.green,
                  //         ),
                  //       );
                  //       Get.toNamed("/");
                  //     } else {
                  //       Get.showSnackbar(
                  //         GetSnackBar(
                  //           title: "UnSuccessfully",
                  //           message: "UnSuccessfully",
                  //           duration: Duration(seconds: 3),
                  //           backgroundColor: Colors.green,
                  //         ),
                  //       );
                  //     }
                  //   },
                  //   icon: const Icon(Icons.person),
                  // ),

                  IconButton(
                    onPressed: () async {
                      Map<String, dynamic> data = await FireBaseAuthHelper
                          .fireBaseAuthHelper
                          .signAnonymously();
                      print("ERROR :${data['msg']}");
                      if (data['user'] != null) {
                        Get.showSnackbar(
                          const GetSnackBar(
                            title: "Successfully",
                            message: "Successfully Login",
                            duration: Duration(seconds: 3),
                            backgroundColor: Colors.green,
                          ),
                        );
                        Get.toNamed("/", arguments: data['user']);
                      } else {
                        Get.showSnackbar(
                          GetSnackBar(
                            title: "UnSuccessfully",
                            message: "${data['msg']}",
                            duration: const Duration(seconds: 3),
                            backgroundColor: Colors.green,
                          ),
                        );
                      }
                    },
                    icon: const Icon(Icons.person),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: () {
                    LocalNotificationHelper.localNotificationHelper
                        .showSimpleLocalPushNotification();
                  },
                  child: const Text("Simple notification")),
              ElevatedButton(
                  onPressed: () {
                    LocalNotificationHelper.localNotificationHelper
                        .showScheduleLocalPushNotification();
                  },
                  child: const Text("scheduled notification")),
              ElevatedButton(
                  onPressed: () {
                    LocalNotificationHelper.localNotificationHelper
                        .showBigPictureLushNotification();
                  },
                  child: const Text("big screen notification")),
              ElevatedButton(
                  onPressed: () {
                    LocalNotificationHelper.localNotificationHelper
                        .showMediaStyleLocalPushNotification();
                  },
                  child: const Text("Media Style notification")),
            ],
          ),
        ),
      ),
    );
  }
}
