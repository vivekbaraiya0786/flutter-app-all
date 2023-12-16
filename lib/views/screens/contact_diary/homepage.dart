import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Controller/Provider/contact_diary/contact_provider.dart';
import '../../../Controller/Provider/contact_diary/themeProvider.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  String? popmenuvalue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Contacts",
          style: GoogleFonts.amaranth(),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              // await prefs.remove('username');
              // // await prefs.remove('Password');
              // await prefs.remove('IsIntroVisited');
              //
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => introscreen(),),);
            },
            icon: const Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).changeTheme();
            },
            icon: const Icon(Icons.circle),
          ),
          PopupMenuButton(
            initialValue: popmenuvalue,
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              popmenuvalue = value;
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: "pohs",
                child: Text("Place On Home Screen"),
              ),
              const PopupMenuItem(
                value: "vminu",
                child: Text("Voice Mail is Not Use"),
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // image = null;
          Navigator.of(context)
              .pushNamed('add-contact')
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Text("Welcome, ${getUsername(context)}!"),
      //       SizedBox(height: 16.0),
      //       ElevatedButton(
      //         onPressed: () async {
      //           // Clear the stored user credentials
      //           final prefs = await SharedPreferences.getInstance();
      //           await prefs.remove("username");
      //           await prefs.remove("password");
      //
      //           // Go back to the login page
      //           Navigator.pushReplacement(
      //             context,
      //             MaterialPageRoute(builder: (context) => introscreen()),
      //           );
      //         },
      //         child: Text("Logout"),
      //       ),
      //     ],
      //   ),
      // ),
      body: Container(
          alignment: Alignment.center,
          child: (Provider.of<contact_Provider>(context)
                  .addContact
                  .FirstName
                  .isEmpty)
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.account_box, size: h * 0.25, color: Colors.blue),
                    Text(
                      "You have not Contact yet",
                      style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.bold,
                        fontSize: w * 0.05,
                      ),
                    ),
                  ],
                )
              : ListView.builder(
                  itemCount: Provider.of<contact_Provider>(context)
                      .addContact
                      .FirstName
                      .length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      onTap: () {
                        // Navigator.of(context).pushNamed('edit-page',
                        //     arguments: Global.allcontacts[index]);
                        // setState(() {});
                      },
                      // leading: CircleAvatar(
                      //   foregroundImage: (Global.allcontacts[index].image) !=
                      //           null
                      //       ? FileImage(Global.allcontacts[index].image as File)
                      //       : null,
                      // ),
                      title: Text(
                        "${Provider.of<contact_Provider>(context).addContact.PhoneNumber}",
                      ),

                      // subtitle: Text(
                      //   "+91 ${Global.allcontacts[index].phonenumber}",
                      // ),
                      // trailing: const Icon(
                      //   Icons.phone,
                      //   color: Colors.green,
                      // ),
                    );
                  },
                )),
    );
  }
// String getUsername(BuildContext context) {
//   final prefs = SharedPreferences.getInstance();
//   final username = prefs.then((value) => value.getString("username"));
//   return username.toString();
// }

// void addcontact(BuildContext,ContactModel contactModel){
//     final provider = Provider.of<ContactListPovider>(context,listen: false);
//     provider.addcontact(contactModel);
// }
}

// import 'package:flutter/material.dart';
// import 'package:projects/Controller/Provider/counter_controller.dart';
// import 'package:provider/provider.dart';
//
// import '../../Controller/Provider/themeProvider.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String? initialPopMenuValue;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Contacts"),
//         actions: [
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).pushNamed('Add_Contact');
//             },
//             icon: Icon(Icons.chevron_right),
//           ),
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
//             Consumer<counterProvider>(
//               builder: (context, value, child) {
//                 return Text("${value.counterModal.counter}");
//               },
//             ),
//             Text(
//                 "${Provider.of<counterProvider>(context).counterModal.counter}",
//                 style: TextStyle(color: Colors.blue, fontSize: 20)),
//             PopupMenuButton(
//               initialValue: initialPopMenuValue,
//               onSelected: (value) {
//                 setState(() {
//                   initialPopMenuValue = value;
//                 });
//
//               },
//               onCanceled: () {
//                 setState(() {
//
//                 });
//               },
//               itemBuilder: (context) {
//                 return [
//                   PopupMenuItem(child: Text("First"), value: "1"),
//                   PopupMenuItem(child: Text("second"), value: "2"),
//                   PopupMenuItem(child: Text("third"), value: "3"),
//                 ];
//               },
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Consumer<counterProvider>(
//             builder: (context, value, child) {
//               return FloatingActionButton(
//                 onPressed: () {
//                   value.increment();
//                   // Provider.of<counterProvider>(context, listen: false).increment();
//                 },
//                 child: Icon(Icons.add),
//               );
//             },
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

// import 'package:flutter/material.dart';
// // import 'package:stories_editor/stories_editor.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool isDarkMode = false;
//
//   // String myFont = "Overthink";
//
//   List<String> myFont = ['Overthink', 'Overthink'];
//
//   List<Color> myColor = [
//     Colors.amber,
//     Colors.red,
//     Colors.blue,
//     Colors.grey,
//   ];
//
//   List<List<Color>> gradientColor = [
//     [Colors.amber, Colors.red],
//     [Colors.blue, Colors.grey],
//   ];
//
//   List<String> mysticker = [
//     'Assets/Images/virat-kohli-png.jpg',
//     'Assets/Images/virat-kohli-png.jpg',
//     'Assets/Images/virat-kohli-png.jpg',
//     'Assets/Images/virat-kohli-png.jpg',
//   ];
//   int currentStepValue = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("HomePage"),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             onPressed: () {
//               setState(() {
//                 isDarkMode = !isDarkMode;
//                 print(isDarkMode);
//               });
//             },
//             icon: Icon(
//               (isDarkMode == false) ? Icons.dark_mode : Icons.light,
//             ),
//           ),
//         ],
//       ),
//       body: Stepper(
//         type: StepperType.vertical,
//         currentStep: currentStepValue,
//         onStepTapped: (value) {},
//         onStepContinue: () {
//           setState(() {
//             if (currentStepValue < 2) {
//               currentStepValue++;
//             }
//           });
//         },
//         onStepCancel: () {
//           setState(() {
//             if (currentStepValue > 0) {
//               currentStepValue--;
//             }
//           });
//         },
//         // controlsBuilder: (context, details) {
//         //   return Container();
//         // },
//         steps: [
//           Step(
//             isActive: (currentStepValue >= 0) ? true : false,
//             title: Text("demo"),
//             subtitle: Text("subtitle"),
//             state: StepState.editing,
//             content: Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Ok"),
//                 ),
//               ],
//             ),
//           ),
//           Step(
//             isActive: (currentStepValue >= 1) ? true : false,
//             title: Text("demo"),
//             content: Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Ok"),
//                 ),
//               ],
//             ),
//           ),
//           Step(
//             isActive: (currentStepValue >= 2) ? true : false,
//             state: StepState.complete,
//             title: Text("demo"),
//             content: Column(
//               children: [
//                 ElevatedButton(
//                   onPressed: () {},
//                   child: Text("Ok"),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//
//       // body: Column(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     ElevatedButton(
//       //       onPressed: () async {
//       //         Directory dir = await getTemporaryDirectory();
//       //         print("======================");
//       //         print(dir);
//       //         print("======================");
//       //       },
//       //       child: Text("Get Temp Directory path"),
//       //     ),
//       //     ElevatedButton(
//       //       onPressed: () async {
//       //         Directory appdoc = await getApplicationDocumentsDirectory();
//       //         print("======================");
//       //         print(appdoc);
//       //         print("======================");
//       //       },
//       //       child: Text("Get App doc Directory"),
//       //     ),
//       //   ],
//       // ),
//
//       // body: StoriesEditor(
//       //   giphyKey: 'C4dMA7Q19nqEGdpfj82T8ssbOeZIylD4',
//       //
//       //   /// (String) required param
//       //   onDone: (String uri) {
//       //     print("===========");
//       //     print(uri);
//       //     print("===========");
//       //   },
//       //   colorList: myColor,
//       //   gradientColors: gradientColor,
//       //   middleBottomWidget: FlutterLogo(
//       //     size: 100,
//       //   ),
//       //   fontFamilyList: myFont,
//       //   isCustomFontList: true,
//       //   // onDoneButtonStyle: Container() ,
//       //   // onBackPress: ,
//       //   // editorBackgroundColor: ,
//       //   // galleryThumbnailQuality: ,
//       // ),
//       // body: StickerEditingView(
//       //   height: 200,
//       //   width: 200,
//       //   fonts: myFont,
//       //   isnetwork: false,
//       //   imgUrl: 'Assets/Images/virat-kohli-png.jpg',
//       //   assetList: mysticker,
//       //   palletColor: myColor,
//       // ),
//
//       // body: Container(
//       //   // padding: const EdgeInsets.all(12),
//       //   alignment: Alignment.center,
//       //   child: Column(
//       //     // mainAxisAlignment: MainAxisAlignment.center,
//       //     children: [
//       //       // ElevatedButton(
//       //       //   onPressed: () {},
//       //       //   child: const Text("add"),
//       //       // ),
//       //       // Text(
//       //       //   "You have no contact yet....",
//       //       //   style: Theme.of(context).textTheme.displayMedium,
//       //       // ),
//       //       // Text(
//       //       //   "demotext",
//       //       //   style: Theme.of(context)
//       //       //       .textTheme
//       //       //       .displayMedium!
//       //       //       .copyWith(color: Colors.blue),
//       //       // ),
//       //       // Text("Hello How Are You...", style: GoogleFonts.abel()),
//       //       // Text(
//       //       //   "Hello How Are You...",
//       //       //   style: TextStyle(
//       //       //       // fontFamily: myFont,
//       //       //       ),
//       //       // ),
//       //
//       //     ],
//       //   ),
//       // ),
//
//       // floatingActionButton: Theme(
//       //   data: ThemeData(
//       //       colorScheme: const ColorScheme.light(secondary: Colors.teal)),
//       //   child: FloatingActionButton(
//       //     onPressed: () {},
//       //     child: const Icon(Icons.add),
//       //   ),
//       // ),
//     );
//   }
// }
