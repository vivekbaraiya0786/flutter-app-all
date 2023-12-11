import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:projects/Controller/Provider/contact_diary/image_picker_provider.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/contact_diary/contact_provider.dart';
import '../../../Controller/Provider/contact_diary/stepper_provider.dart';
import '../../../utils/attributes/attributes.dart';

class add_contact extends StatefulWidget {
  const add_contact({Key? key}) : super(key: key);

  @override
  State<add_contact> createState() => _add_contactState();
}

class _add_contactState extends State<add_contact> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  // int currentstepvalue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    steps = [
      Step(
        isActive: (Provider.of<stepvalue_provider>(context)
                    .stepper_modal
                    .currentStepValue >=
                0)
            ? true
            : false,
        state: (Provider.of<stepvalue_provider>(context)
                    .stepper_modal
                    .currentStepValue >
                0)
            ? StepState.indexed
            : StepState.editing,
        title: Text("Image Choose", style: GoogleFonts.aBeeZee()),
        content: Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: w * 0.18,
              foregroundImage: Provider.of<ImagePickerProvider>(context) != null
                  ? FileImage(
                      File(Provider.of<ImagePickerProvider>(context)
                          .imagePickerModal
                          .image
                          .path),
                    )
                  : null,
            ),
            FloatingActionButton.small(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 240,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Choose Photo From Camera And Gallery",
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ListTile(
                              leading: const Icon(CupertinoIcons.camera),
                              title: const Text('Take photo'),
                              onTap: () async {
                                Provider.of<ImagePickerProvider>(context,
                                        listen: false)
                                    .putImageFromCamera();
                                Navigator.of(context).pop();
                                // ImagePicker picker = ImagePicker();
                                // XFile? img = await picker.pickImage(
                                //     source: ImageSource.camera);
                                // if (img != null) {
                                //   setState(() {
                                //     // image = File(img.path);
                                //   });
                                //   Navigator.of(context).pop();
                                // }
                              }),
                          ListTile(
                              leading: const Icon(CupertinoIcons.photo),
                              title: const Text('Choose photo from gallery'),
                              onTap: () async {
                                Provider.of<ImagePickerProvider>(context,
                                        listen: false)
                                    .putImageFromGallery();
                                Navigator.of(context).pop();
                                // ImagePicker picker = ImagePicker();
                                // XFile? img = await picker.pickImage(
                                //     source: ImageSource.gallery);
                                // if (img != null) {
                                //   setState(() {
                                //     // image = File(img.path);
                                //   });
                                //   Navigator.of(context).pop();
                                // }
                              }),
                          ListTile(
                              leading: const Icon(CupertinoIcons.clear),
                              title: const Text('Remove Image'),
                              onTap: () async {
                                Provider.of<ImagePickerProvider>(context,
                                        listen: false)
                                    .clearPickImage();
                                Navigator.of(context).pop();
                                // ImagePicker picker = ImagePicker();
                                // XFile? img = await picker.pickImage(
                                //     source: ImageSource.gallery);
                                // if (img != null) {
                                //   setState(() {
                                //     // image = File(img.path);
                                //   });
                                // }
                              }),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
      Step(
          isActive: (Provider.of<stepvalue_provider>(context)
                      .stepper_modal
                      .currentStepValue >=
                  1)
              ? true
              : false,
          state: (Provider.of<stepvalue_provider>(context)
                      .stepper_modal
                      .currentStepValue >
                  1)
              ? StepState.indexed
              : StepState.editing,
          title: Text("Full Name", style: GoogleFonts.aBeeZee()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: FirstNameControlller,
                onSaved: (newValue) {
                  firstName = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your First Name...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  labelText: "First Name",
                  labelStyle: GoogleFonts.alkalami(),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: LastNameControlller,
                onSaved: (newValue) {
                  lastName = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Last Name...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                        color: CupertinoColors.activeBlue,
                      ),
                    ),
                    labelText: "Last Name",
                    labelStyle: GoogleFonts.alkalami(),
                    border: const OutlineInputBorder()),
              ),
            ],
          )),
      Step(
        state: (Provider.of<stepvalue_provider>(context)
                    .stepper_modal
                    .currentStepValue >
                2)
            ? StepState.indexed
            : StepState.editing,
        isActive: (Provider.of<stepvalue_provider>(context)
                    .stepper_modal
                    .currentStepValue >=
                2)
            ? true
            : false,
        title: Text("Phone Number", style: GoogleFonts.aBeeZee()),
        content: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              controller: PhoneNumberControlller,
              onSaved: (newValue) {
                phoneNumber = newValue;
                print(phoneNumber);
              },
              validator: (val) {
                if (val!.isEmpty) {
                  return "Please Enter Your Phone Number...";
                }
                return null;
              },
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: CupertinoColors.activeBlue,
                  ),
                ),
                label: const Text("Phone Number"),
                labelStyle: GoogleFonts.alkalami(),
                border: const OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      Step(
          state: (Provider.of<stepvalue_provider>(context)
                      .stepper_modal
                      .currentStepValue >
                  3)
              ? StepState.indexed
              : StepState.complete,
          isActive: (Provider.of<stepvalue_provider>(context)
                      .stepper_modal
                      .currentStepValue >=
                  3)
              ? true
              : false,
          title: Text(
            "Email Id",
            style: GoogleFonts.aBeeZee(),
          ),
          content: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: EmailIdControlller,
                onSaved: (newValue) {
                  // Email = newValue;
                  emailId = newValue;
                },
                validator: (val) {
                  if (val!.isEmpty) {
                    return "Please Enter Your Email...";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.grey,
                      width: 1.5,
                    ),
                  ),
                  disabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: CupertinoColors.activeBlue,
                    ),
                  ),
                  label: const Text("Email Id"),
                  labelStyle: GoogleFonts.alkalami(),
                  border: const OutlineInputBorder(),
                ),
              ),
            ],
          )),
    ];

    // void onStepContinue() {
    //   setState(() {
    //     if (currentstepvalue < steps!.length - 1) {
    //       currentstepvalue++;
    //     }
    //   });
    // }
    //
    // void onStepCancel() {
    //   setState(() {
    //     if (currentstepvalue > 0) {
    //       currentstepvalue--;
    //     }
    //   });
    // }

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Add", style: GoogleFonts.amaranth()),
          actions: [
            IconButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();

                  Provider.of<contact_Provider>(context, listen: false)
                      .addContact
                      .PhoneNumber;
                  Provider.of<contact_Provider>(context, listen: false)
                      .addContact
                      .FirstName;
                  Provider.of<contact_Provider>(context, listen: false)
                      .addContact
                      .LastName;
                  Provider.of<contact_Provider>(context, listen: false)
                      .addContact
                      .PhoneNumber;
                  Provider.of<contact_Provider>(context, listen: false)
                      .addContact
                      .Images;

                  Navigator.of(context).pop();
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/", (route) => false);
                }
              },
              icon: const Icon(Icons.check),
            ),
            SizedBox(
              width: w * 0.001,
            ),
          ],
        ),
        body: Form(
          key: formkey,
          child: Stepper(
            type: StepperType.vertical,
            // onStepContinue: _onStepContinue,
            // onStepCancel: _onStepCancel,
            onStepTapped: (value) {},
            currentStep: Provider.of<stepvalue_provider>(context)
                .stepper_modal
                .currentStepValue,
            steps: steps!,
            controlsBuilder: (context, details) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: h * 0.1,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<stepvalue_provider>(context, listen: false)
                        .onstepContinue();
                  },
                  child: const Text(
                    "Continue",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: w * 0.05,
                ),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<stepvalue_provider>(context, listen: false)
                        .onstepCancel();
                  },
                  child: const Text("Cancel"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// refresh ui of imagepicker use circle avatar inside and alert dialog with out stepper widget
// body: Column(
//   children: [
//     ElevatedButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) => StatefulBuilder(
//             builder: (context, setState) => AlertDialog(
//               title: Column(
//                 children: [
//                   Stack(
//                     alignment: Alignment.bottomRight,
//                     children: [
//                       CircleAvatar(
//                         radius: 60,
//                         backgroundColor: Colors.grey,
//                         foregroundImage: image != null ?FileImage(image!):null,
//                       ),
//                       FloatingActionButton.small(
//                         onPressed: () async {
//                           final pickedfile = await ImagePicker().getImage(source: ImageSource.gallery);
//                           setState(() {
//                             image = File(pickedfile!.path);
//                           });
//
//                           Navigator.of(context).pushNamed('').then((value) =>setState(() {
//                           }) );
//
//                         },
//                         child: Icon(Icons.add),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Yes"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                    setState((){});
//                   },
//                   child: Text("No"),
//                 ),
//               ],
//               content: const Text("Are you Sure to exit ?"),
//             ),
//           ),
//         );
//       },
//       child: Text("Alert Dialog"),
//     ),
//   ],
// ),
//
// refresh ui of imagepicker use circle avatar inside and alert dialog with stepper widget
// body: Column(
//   children: [
//     ElevatedButton(
//       onPressed: () {
//         showDialog(
//           context: context,
//           builder: (context) => StatefulBuilder(
//             builder: (context, setState) => AlertDialog(
//               actions: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                   child: Text("Yes"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                    setState((){});
//                   },
//                   child: Text("No"),
//                 ),
//               ],
//               content:  Container(
//                 width: double.maxFinite,
//                 child: Stepper(
//                   steps: [
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Stack(
//                         alignment: Alignment.bottomRight,
//                         children: [
//                           CircleAvatar(
//                             radius: 60,
//                             backgroundColor: Colors.grey,
//                             foregroundImage: image != null ?FileImage(image!):null,
//                           ),
//                           FloatingActionButton.small(
//                             onPressed: () async {
//                               final pickedfile = await ImagePicker().getImage(source: ImageSource.gallery);
//                               setState(() {
//                                 image = File(pickedfile!.path);
//                               });
//
//                               Navigator.of(context).pushNamed('').then((value) =>setState(() {
//                               }) );
//
//                             },
//                             child: Icon(Icons.add),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                     Step(
//                       title:Text("Image Choose"),
//                       content: Container(
//
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//       child: Text("Alert Dialog"),
//     ),
//   ],
// ),

// FloatingActionButton.small(
// onPressed: () {},
// child: IconButton(
// onPressed: () async {
// ImagePicker picker = ImagePicker();
// XFile? img =
// await picker.pickImage(source: ImageSource.gallery);
// if (img != null) {
// setState(() {
// image = File(img.path);
// });
// }
// },
// icon: const Icon(Icons.add),
// ),
// ),

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//
// import '../../Controller/Provider/counter_provider.dart';
// import '../../Controller/Provider/themeProvider.dart';
//
// class Add_Conatct extends StatefulWidget {
//   const Add_Conatct({super.key});
//
//   @override
//   State<Add_Conatct> createState() => _Add_ConatctState();
// }
//
// class _Add_ConatctState extends State<Add_Conatct> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Add Conatct"),
//         actions: [
//           IconButton(
//               onPressed: () {
//                 Provider.of<ThemeProvider>(context, listen: false)
//                     .changeTheme();
//               },
//               icon: Icon(Icons.light))
//         ],
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//                 "${Provider.of<counterProvider>(context).counterModal.counter}",
//                 style: TextStyle(color: Colors.blue, fontSize: 20)),
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           FloatingActionButton(
//             onPressed: () {
//               Provider.of<counterProvider>(context, listen: false).increment();
//             },
//             child: Icon(Icons.add),
//           ),
//           SizedBox(
//             width: 10,
//           ),
//           FloatingActionButton(
//             onPressed: () {
//               Provider.of<counterProvider>(context, listen: false).decrement();
//             },
//             child: Icon(Icons.remove),
//           ),
//         ],
//       ),
//     );
//   }
// }
