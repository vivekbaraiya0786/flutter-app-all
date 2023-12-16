import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/platform_convert/app_provider.dart';

class platFrom_HomePage_material extends StatefulWidget {
  const platFrom_HomePage_material({super.key});

  @override
  State<platFrom_HomePage_material> createState() =>
      _platFrom_HomePage_materialState();
}

class _platFrom_HomePage_materialState
    extends State<platFrom_HomePage_material> {
  String myplatform = "";

  checkPlatForm() {
    if (Platform.isAndroid) {
      setState(() {
        myplatform = "isAndroid";
      });
    }
    if (Platform.isIOS) {
      setState(() {
        myplatform = "isIOS";
      });
    }
    if (Platform.isFuchsia) {
      setState(() {
        myplatform = "isFuchsia";
      });
    }
    if (Platform.isLinux) {
      setState(() {
        myplatform = "isLinux";
      });
    }
    if (Platform.isWindows) {
      setState(() {
        myplatform = "isWindows";
      });
    }
    if (Platform.isMacOS) {
      setState(() {
        myplatform = "Is operating";
      });
    } else {
      setState(() {
        myplatform = "operatingSystem ${Platform.operatingSystem}";
      });
    }
  }

  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  DateTime initialDate = DateTime.now();
  DateTime? selectedDate;

  TimeOfDay initialTime = TimeOfDay.now();

  List<String> fruits = [
    "Mango",
    "Apple",
    "Grapes",
    "Kiwi",
  ];

  int initialIndex = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          collapsedHeight: 80,
          expandedHeight: 200,
          pinned: true,
          floating: true,
          snap: true,
          backgroundColor: Colors.red,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text("Flexible AppBar",
                style: TextStyle(color: Colors.black)),
            centerTitle: true,
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
              ),
            ),
          ),
          actions: [
            Switch(
              value: Provider.of<App_Provider>(context, listen: false)
                  .app_modal
                  .changeApp,
              onChanged: (value) {
                Provider.of<App_Provider>(context, listen: false).changeApp();
              },
            ),
          ],
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(color: Colors.red, height: 200),
              Container(color: Colors.blue, height: 200),
              Container(color: Colors.lightBlue, height: 200),
              Container(color: Colors.teal, height: 200),
              Container(color: Colors.blueAccent, height: 200),
              Container(color: Colors.deepOrange, height: 200),
            ],
          ),
        ),
        SliverGrid(
            delegate: SliverChildListDelegate([
              Container(color: Colors.red, height: 200),
              Container(color: Colors.blue, height: 200),
              Container(color: Colors.lightBlue, height: 200),
              Container(color: Colors.teal, height: 200),
              Container(color: Colors.blueAccent, height: 200),
              Container(color: Colors.deepOrange, height: 200),
            ]),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5)),
        SliverGrid(
            delegate: SliverChildBuilderDelegate(
              childCount: 10,
              (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  child: Text("${index + 1}"),
                  alignment: Alignment.center,
                  color: Colors.amber,
                );
              },
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 5, crossAxisSpacing: 5)),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          childCount: 100,
          (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              child: Text("${index + 1}"),
              alignment: Alignment.center,
              color: Colors.amber,
            );
          },
        )),
      ],
    ));
  }
}

//
// Scaffold(
// key: scaffoldkey,
// appBar: AppBar(
// title: const Text("homepage"),
// actions: [
// Switch(
// value: Provider.of<App_Provider>(context, listen: false)
//     .app_modal
//     .changeApp,
// onChanged: (value) {
// Provider.of<App_Provider>(context, listen: false).changeApp();
// },
// ),
// ],
// ),
// body: Container(
// alignment: Alignment.center,
// child: Column(
// children: [
// CircularProgressIndicator.adaptive(),
// SwitchListTile.adaptive(
// title: Text("Male"),
// subtitle: Text("Gender"),
// value: true,
// onChanged: (value) {},
// ),
// Switch.adaptive(
// value: true,
// onChanged: (value) {},
// ),
// ElevatedButton(
// onPressed: () {
// showDialog(
// context: context,
// builder: (context) {
// return const AlertDialog.adaptive(
// title: Text("Dummy"),
// content: Column(
// children: [
// Text("first"),
// Text("first"),
// Text("first"),
// ],
// ),
// );
// },
// );
// },
// child: const Text("Alert Dialogue adepative")),
// Slider.adaptive(
// value: 0,
// onChanged: (value) {},
// )
// ],
// ),
// ),

// PageView.builder(
//   controller: pageController,
//   itemCount: fruits.length,
//   onPageChanged: (value) {
//     setState(() {
//       initialIndex = value;
//     });
//   },
//   itemBuilder: (context, index) {
//     return Container(
//       alignment: Alignment.center,
//       child: Text("${fruits[index]}"),
//     );
//   },
// ),
// bottomNavigationBar: BottomNavigationBar(
// backgroundColor: Colors.grey.shade200,
// selectedItemColor: Colors.black,
// unselectedItemColor: Colors.grey,
// currentIndex: initialIndex,
// onTap: (value) {
// setState(() {
// initialIndex = value;
// pageController.animateToPage(
// initialIndex,
// duration: const Duration(microseconds: 500),
// curve: Curves.bounceIn,
// );
// });
// },
// items: const [
// BottomNavigationBarItem(
// icon: Icon(Icons.home),
// label: "Home",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.chat),
// label: "chat",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.call),
// label: "call",
// ),
// BottomNavigationBarItem(
// icon: Icon(Icons.settings),
// label: "settings",
// ),
// ],
// ),
// PageView(
//   physics: const ClampingScrollPhysics(),
//   scrollDirection: Axis.horizontal,
//   pageSnapping: true,
//   children: [
//     const Chat_components(),
//     Container(
//       color: Colors.blue,
//       child: const Center(child: Text("Cherry")),
//     ),
//     Container(
//       color: Colors.red,
//       child: const Center(child: Text("Mango")),
//     ),
//     Container(
//       color: Colors.yellow,
//       child: const Center(child: Text("banana")),
//     )
//   ],
// )

//     Container(
//   alignment: Alignment.center,
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text(
//         myplatform,
//         style: const TextStyle(
//           color: Colors.black,
//         ),
//       ),
//       ElevatedButton(
//         onPressed: checkPlatForm,
//         child: const Text("Check PlatFrom"),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       ElevatedButton(
//         onPressed: () {
//           scaffoldkey.currentState?.showBottomSheet(
//             (context) => Container(
//               height: 300,
//               width: double.infinity,
//               decoration: const BoxDecoration(
//                 color: Colors.blueGrey,
//               ),
//               child: const Center(
//                 child: Text("Simple Bottom Sheet"),
//               ),
//             ),
//           );
//         },
//         child: const Text("Simple Bottom Sheet"),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       ElevatedButton(
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (context) {
//               return Container(
//                 height: 300,
//                 width: double.infinity,
//                 decoration: const BoxDecoration(
//                   color: Colors.blueGrey,
//                 ),
//                 child: const Center(
//                   child: Text("Show Modal bottom-sheet"),
//                 ),
//               );
//             },
//           );
//         },
//         child: const Text("Show Modal bottom-sheet"),
//       ),
//       const SizedBox(
//         height: 10,
//       ),
//       (selectedDate != null)
//           ? Text(
//               "${selectedDate!.day} : ${selectedDate!.month} : ${selectedDate!.year}")
//           : Container(),
//       SizedBox(
//         height: 10,
//       ),
//       ElevatedButton(
//         onPressed: () async {
//           DateTime? picked = await showDatePicker(
//             context: context,
//             initialDate: initialDate,
//             firstDate: DateTime(1901),
//             lastDate: DateTime(2099),
//           );
//           if (picked != null && picked != selectedDate) {
//             setState(() {
//               selectedDate = picked;
//             });
//           }
//         },
//         child: const Text("Open Date Picker"),
//       ),
//       (initialTime.periodOffset == 0)
//           ? Text(
//               "${initialTime.hour} : ${initialTime.minute} ${initialTime.period.name}")
//           : Text(
//               "${initialTime.hour - 12} : ${initialTime.minute} ${initialTime.period.name}"),
//       ElevatedButton(
//         onPressed: () async {
//           TimeOfDay? pickedTime = await showTimePicker(
//             context: context,
//             initialTime: initialTime,
//           );
//           if (pickedTime != null || pickedTime != initialTime) {
//             setState(() {
//               initialTime = pickedTime!;
//             });
//           }
//         },
//         child: const Text("Open time Picker"),
//       ),
//     ],
//   ),
// ),
// );
