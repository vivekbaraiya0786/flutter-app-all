import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Controller/Provider/platform_convert/app_provider.dart';

class cupertino_homepage extends StatefulWidget {
  const cupertino_homepage({super.key});

  @override
  State<cupertino_homepage> createState() => _cupertino_homepageState();
}

class _cupertino_homepageState extends State<cupertino_homepage> {
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

  DateTime initialDate = DateTime.now();
  DateTime? selectedDate;

  late DateTime initialTime;
  late String periodName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialTime = DateTime.now();

    if (initialTime.hour >= 12) {
      periodName = "pm";
    } else {
      periodName = "am";
    }
  }

  Duration initialtimer = new Duration();
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  double initialValue = 0;

  Map<int, Widget> cupertinoSegment = {
    0: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text("First")),
    1: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text("second")),
    2: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        child: Text("third")),
  };

  int initialGroupValue = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        slivers: [
          CupertinoSliverNavigationBar(
            middle: Text("Cupertino"),
            largeTitle: Text("Cupertino"),
            alwaysShowMiddle: false,
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(CupertinoIcons.settings),
                CupertinoSwitch(
                  value: Provider.of<App_Provider>(context, listen: false)
                      .app_modal
                      .changeApp,
                  onChanged: (value) {
                    Provider.of<App_Provider>(context, listen: false)
                        .changeApp();
                  },
                )
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: CupertinoListSection(
              header: Text("Fruits"),
              footer: Text("List of Fruits"),
              children: [
                CupertinoListTile(
                    leading: Text("🍎"),
                    title: Text("Apple"),
                    subtitle: Text("red")),
                CupertinoListTile(
                    leading: Text("🍉"),
                    title: Text("WaterMelon"),
                    subtitle: Text("green")),
                CupertinoListTile.notched(
                    leading: Text("🍌"),
                    title: Text("Banana"),
                    subtitle: Text("yellow")),
              ],
            ),
          ),
          // SliverFillRemaining(
          //   child: CupertinoListSection(
          //     header: Text("Fruits"),
          //     footer: Text("List of Fruits"),
          //     children: [
          //       CupertinoListTile(
          //           leading: Text("🍎"),
          //           title: Text("Apple"),
          //           subtitle: Text("red")),
          //       CupertinoListTile(
          //           leading: Text("🍉"),
          //           title: Text("WaterMelon"),
          //           subtitle: Text("green")),
          //       CupertinoListTile(
          //           leading: Text("🍌"),
          //           title: Text("Banana"),
          //           subtitle: Text("yellow")),
          //     ],
          //   ),
          // ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            childCount: 10,
            (context, index) {
              return CupertinoListTile(
                leading: CircleAvatar(),
                title: Text("${index + 1}"),
                subtitle: Text("Subtitle"),
              );
            },
          )),
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
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

// CupertinoPageScaffold(
// navigationBar: CupertinoNavigationBar(
// leading: const Icon(CupertinoIcons.app),
// middle: const Text("HomePage"),
// trailing: Row(
// mainAxisSize: MainAxisSize.min,
// children: [
// const Icon(CupertinoIcons.settings),
// CupertinoSwitch(
// value: Provider.of<App_Provider>(context, listen: false)
//     .app_modal
//     .changeApp,
// onChanged: (value) {
// Provider.of<App_Provider>(context, listen: false).changeApp();
// },
// )
// ],
// ),
// ),
// child: Container(
// alignment: Alignment.center,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Text("$initialValue"),
// CupertinoSlider(
// value: initialValue,
// divisions: 20,
// min: 0,
// max: 100,
// onChanged: (value) {
// setState(() {
// initialValue = value;
// });
// },
// ),
// CupertinoSegmentedControl(
// children: cupertinoSegment,
// groupValue: initialGroupValue,
// onValueChanged: (value) {
// setState(() {
// initialGroupValue = value;
// });
// },
// ),
// ],
// ),
// ));
//extra

//   CupertinoTabScaffold(
//   tabBar: CupertinoTabBar(
//     items: const [
//       BottomNavigationBarItem(
//         icon: Icon(Icons.home),
//         label: "Home",
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.chat),
//         label: "chat",
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.call),
//         label: "call",
//       ),
//       BottomNavigationBarItem(
//         icon: Icon(Icons.settings),
//         label: "settings",
//       ),
//     ],
//     currentIndex: _selectedIndex,
//     onTap: (value) {
//       setState(() {
//         _selectedIndex = value;
//         _pageController.animateToPage(
//           _selectedIndex,
//           duration: const Duration(milliseconds: 300),
//           curve: Curves.easeInOut,
//         );
//       });
//     },
//   ),
//   tabBuilder: (context, index) {
//     return CupertinoTabView(
//       builder: (context) {
//         return CupertinoPageScaffold(
//           navigationBar: CupertinoNavigationBar(
//             leading: const Icon(CupertinoIcons.app),
//             middle: const Text("HomePage"),
//             trailing: Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Icon(CupertinoIcons.settings),
//                 CupertinoSwitch(
//                   value: Provider.of<App_Provider>(context, listen: false)
//                       .app_modal
//                       .changeApp,
//                   onChanged: (value) {
//                     Provider.of<App_Provider>(context, listen: false)
//                         .changeApp();
//                   },
//                 )
//               ],
//             ),
//           ),
//           child: PageView(
//             controller: _pageController,
//             onPageChanged: (index) {
//               setState(() {
//                 _selectedIndex = index;
//               });
//             },
//             children: [
//               Container(
//                 color: Colors.yellow,
//                 child: const Center(child: Text("apple")),
//               ),
//               Container(
//                 color: Colors.blue,
//                 child: const Center(child: Text("Cherry")),
//               ),
//               Container(
//                 color: Colors.red,
//                 child: const Center(child: Text("watermelon")),
//               ),
//               Container(
//                 color: Colors.yellow,
//                 child: const Center(child: Text("Banana")),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   },
// );

// IndexedStack(
//   index: index,
//   children: [
//     Chat_components(),
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
// ));

//   CupertinoPageScaffold(
//   navigationBar: CupertinoNavigationBar(
//     leading: const Icon(CupertinoIcons.app),
//     middle: const Text("HomePage"),
//     trailing: Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         const Icon(CupertinoIcons.settings),
//         CupertinoSwitch(
//           value: Provider.of<App_Provider>(context, listen: false)
//               .app_modal
//               .changeApp,
//           onChanged: (value) {
//             Provider.of<App_Provider>(context, listen: false).changeApp();
//           },
//         )
//       ],
//     ),
//   ),
//   child: SafeArea(
//     child: Container(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           // Text(
//           //   myplatform,
//           //   style: const TextStyle(
//           //     color: Colors.black,
//           //   ),
//           // ),
//           // CupertinoButton(
//           //   child: const Text("Check"),
//           //   onPressed: checkPlatForm,
//           // ),
//           CupertinoButton(
//             child: const Text("Cupertino Button"),
//             onPressed: () {},
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           CupertinoButton.filled(
//             child: const Text("Cupertino Button"),
//             onPressed: () {},
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           const CupertinoActivityIndicator(
//             color: CupertinoColors.destructiveRed,
//             animating: true,
//             radius: 50,
//           ),
//           CupertinoButton(
//             color: CupertinoColors.activeOrange,
//             disabledColor: CupertinoColors.quaternarySystemFill,
//             child: const Text("CUpertino Button"),
//             onPressed: () {},
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           CupertinoButton.filled(
//             child: const Text("Cupertino Action Sheet"),
//             onPressed: () {
//               showCupertinoModalPopup(
//                 context: context,
//                 builder: (context) => CupertinoActionSheet(
//                   title: const Text("Fruits"),
//                   message: const Text("List Of Fruits"),
//                   actions: [
//                     CupertinoActionSheetAction(
//                       onPressed: () {},
//                       child: const Text("Apple"),
//                     ),
//                     CupertinoActionSheetAction(
//                       onPressed: () {},
//                       child: const Text("WaterMelaon"),
//                     ),
//                     CupertinoActionSheetAction(
//                       onPressed: () {},
//                       child: const Text("Banana"),
//                     ),
//                     CupertinoActionSheetAction(
//                       onPressed: () {},
//                       child: const Text("Cherry"),
//                     ),
//                   ],
//                   cancelButton: CupertinoActionSheetAction(
//                     isDestructiveAction: true,
//                     child: const Text("Cancel"),
//                     onPressed: () {
//                       Navigator.of(context).pop();
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           const SizedBox(
//             height: 15,
//           ),
//           CupertinoButton.filled(
//             child: const Text("Cupertino Dialogue Box"),
//             onPressed: () {
//               showCupertinoDialog(
//                 context: context,
//                 builder: (context) => CupertinoAlertDialog(
//                   title: const Center(
//                     child: Text("Simple Alert"),
//                   ),
//                   content: const Text("Dummy Text"),
//                   actions: [
//                     CupertinoDialogAction(
//                       isDestructiveAction: true,
//                       onPressed: () {
//                         Navigator.of(context).pop();
//                       },
//                       child: const Text("Dismiss"),
//                     ),
//                     const CupertinoDialogAction(
//                       child: Text("Allow"),
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//           const SizedBox(
//             height: 15,
//           ),
//           SizedBox(
//             height: 120,
//             width: 120,
//             child: Container(
//               color: CupertinoColors.destructiveRed,
//               child: CupertinoContextMenu(
//                 child: FlutterLogo(size: 50),
//                 actions: [
//                   CupertinoContextMenuAction(
//                     child: Text("First"),
//                     onPressed: () {},
//                   ),
//                   CupertinoContextMenuAction(
//                     child: Text("Second"),
//                     onPressed: () {},
//                   ),
//                   CupertinoContextMenuAction(
//                     child: Text("Third"),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           (selectedDate != null)
//               ? Text(
//                   "${selectedDate!.day} : ${selectedDate!.month} : ${selectedDate!.year}")
//               : Text("No Select Date"),
//           CupertinoButton(
//             child: Text("Cupertino Date"),
//             onPressed: () {
//               showCupertinoModalPopup(
//                 context: context,
//                 builder: (context) => Container(
//                   height: 350,
//                   color: Colors.white,
//                   child: CupertinoDatePicker(
//                     mode: CupertinoDatePickerMode.date,
//                     minimumYear: 1901,
//                     maximumYear: 2099,
//                     initialDateTime: initialDate,
//                     onDateTimeChanged: (value) {
//                       setState(() {
//                         selectedDate = value;
//                         print(selectedDate);
//                       });
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//
//           (periodName == 'am')
//               ? Text(
//                   "${initialTime.hour} : ${initialTime.minute} $periodName")
//               : (initialTime.hour > 12)
//                   ? Text(
//                       "${initialTime.hour - 12} : ${initialTime.minute} $periodName")
//                   : Text(
//                       "${initialTime.hour} : ${initialTime.minute} $periodName"),
//           CupertinoButton(
//             child: Text("Cupertino Time Picker"),
//             onPressed: () {
//               showCupertinoModalPopup(
//                 context: context,
//                 builder: (context) => Container(
//                   height: 350,
//                   color: Colors.white,
//                   child: CupertinoDatePicker(
//                     mode: CupertinoDatePickerMode.time,
//                     minimumYear: 1901,
//                     maximumYear: 2099,
//                     initialDateTime: initialDate,
//                     use24hFormat: false,
//                     onDateTimeChanged: (value) {
//                       setState(() {
//                         initialTime = value;
//                         print(selectedDate);
//                       });
//                     },
//                   ),
//                 ),
//               );
//             },
//           ),
//           Text("${initialtimer.inHours} : ${initialtimer.inMinutes}"),
//           CupertinoButton(
//             child: Text("Cupertino Time Picker"),
//             onPressed: () {
//               showCupertinoModalPopup(
//                 context: context,
//                 builder: (context) => Container(
//                     height: 350,
//                     color: Colors.white,
//                     child: CupertinoTimerPicker(
//                       mode: CupertinoTimerPickerMode.hm,
//                       minuteInterval: 1,
//                       secondInterval: 1,
//                       initialTimerDuration: initialtimer,
//                       onTimerDurationChanged: (Duration value) {
//                         setState(() {
//                           initialtimer = value;
//                         });
//                       },
//                     )),
//               );
//             },
//           ),
//         ],
//       ),
//     ),
//   ),
// );
