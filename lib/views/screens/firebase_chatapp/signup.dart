import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projects/helper/firebase/firebase_auth_helper.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String? name;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(12),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Row(
                  children: [
                    Text("Enter Name"),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter your name",
                  ),
                  onSaved: (newValue) {
                    setState(() {
                      name = newValue;
                    });
                  },
                  validator: (value) =>
                      (value!.isEmpty) ? "Please enter your name" : null,
                ),
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
                // ElevatedButton(
                //     onPressed: () async {
                //       if (formkey.currentState!.validate()) {
                //         (formkey.currentState!.save());
                //         User? user = await FireBaseAuthHelper.fireBaseAuthHelper
                //             .signWithEmailPassword(
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
                //           Get.toNamed("/LoginPage");
                //           emailController.clear();
                //           passwordController.clear();
                //           nameController.clear();
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
                //           name = null;
                //         });
                //       }
                //     },
                //     child: Text("Sign Up")),

                ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        (formkey.currentState!.save());
                        Map<String, dynamic> data = await FireBaseAuthHelper
                            .fireBaseAuthHelper
                            .signWithEmailPassword(
                                email: email!, password: password!);
                        if (data['user'] != null) {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "Successfully",
                              message: "Successfully sign-in",
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,
                            ),
                          );
                          Get.toNamed("/LoginPage");
                          emailController.clear();
                          passwordController.clear();
                          nameController.clear();
                        } else {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: "UnSuccessfully",
                              message: "Login Failed...",
                              duration: Duration(seconds: 3),
                              backgroundColor: Colors.green,
                            ),
                          );
                        }

                        setState(() {
                          email = null;
                          password = null;
                          name = null;
                        });
                      }
                    },
                    child: const Text("Sign Up")),

                const SizedBox(
                  height: 10,
                ),
                RichText(
                    text: TextSpan(
                        text: "Already have Account? ",
                        style: const TextStyle(color: Colors.black),
                        children: [
                      TextSpan(
                          text: "Log In",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed("/LoginPage");
                            }),
                    ])),
                const SizedBox(
                  height: 10,
                ),
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
                      Get.toNamed("/");
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
          ),
        ),
      ),
    );
  }
}
