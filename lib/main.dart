// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:projects/Modals/contact_diary/contact_modal.dart';
// import 'package:projects/Modals/contact_diary/stepper_modal.dart';
// import 'package:projects/utils/themeutils.dart';
// import 'package:projects/views/screens/contact_diary/add_contact_page.dart';
// import 'package:projects/views/screens/contact_diary/homepage.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Controller/Provider/contact_diary/contact_provider.dart';
// import 'Controller/Provider/contact_diary/counter_provider.dart';
// import 'Controller/Provider/contact_diary/image_picker_provider.dart';
// import 'Controller/Provider/contact_diary/stepper_provider.dart';
// import 'Controller/Provider/contact_diary/themeProvider.dart';
// import 'Modals/contact_diary/counter_modal.dart';
// import 'Modals/contact_diary/image_picker_modal.dart';
// import 'Modals/contact_diary/themeModal.dart';
// import 'views/screens/contact_diary/intro_screen.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   // SystemChrome.setSystemUIOverlayStyle(
//   //   const SystemUiOverlayStyle(
//   //     statusBarColor: Colors.red,
//   //     statusBarBrightness: Brightness.light,
//   //     systemNavigationBarColor: Colors.blue,
//   //   ),
//   // );
//   //
//   // await SystemChrome.setPreferredOrientations(
//   //   [
//   //     DeviceOrientation.landscapeLeft,
//   //     DeviceOrientation.landscapeRight,
//   //     DeviceOrientation.portraitDown,
//   //     DeviceOrientation.portraitUp,
//   //   ],
//   // );
//   // bool isDarkMode = false;
//   // String myFont = "Overthink";
//   // runApp(
//   //   MaterialApp(
//   //     debugShowCheckedModeBanner: false,
//   //     // theme: ThemeData(
//   //     //   colorScheme: const ColorScheme.light(
//   //     //     brightness: Brightness.light,
//   //     //     primary: Colors.orange,
//   //     //     secondary: Colors.red,
//   //     //   ),
//   //     // ),
//   //     // darkTheme: ThemeData(
//   //     //   colorScheme: const ColorScheme.dark(
//   //     //     brightness: Brightness.dark,
//   //     //     primary: Colors.teal,
//   //     //     secondary: Colors.amber,
//   //     //   ),
//   //     // ),
//   //     theme: AppTheme.lightTheme,
//   //     darkTheme: AppTheme.darkTheme,
//   //     themeMode: (isDarkMode == false) ? ThemeMode.light : ThemeMode.dark,
//   //     initialRoute: '/',
//   //     routes: {
//   //       '/': (context) => HomePage(),
//   //     },
//   //   ),
//   // );
//
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   bool isDarkMode = prefs.getBool('darkMode') ?? false;
//   bool isIntroVisited = prefs.getBool('isIntroVisited') ?? false;
//   int countervalue = prefs.getInt('countervalue') ?? 0;
//   int steppervalue = prefs.getInt('stepper-value') ?? 0;
//   String Image = prefs.getString('Image') ?? '';
//
//   List<String> firstname = prefs.getStringList('firstname') ?? [];
//   List<String> lastname = prefs.getStringList('lastName') ?? [];
//   List<String> emailId = prefs.getStringList('emailId') ?? [];
//   List<String> phoneNumber = prefs.getStringList('phoneNumber') ?? [];
//   List<String> allimage = prefs.getStringList('allimage') ?? [];
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => ThemeProvider(
//             themeModal: ThemeModal(isDarkMode: isDarkMode),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => counterProvider(
//             counterModal: CounterModal(counter: countervalue),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => ImagePickerProvider(
//             imagePickerModal: ImagePickerModal(
//               image: File(Image),
//             ),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => stepvalue_provider(
//             stepper_modal: stepper_Modal(currentStepValue: steppervalue),
//           ),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => contact_Provider(
//               addContact: Add_Contact_Modal(
//             FirstName: firstname,
//             LastName: lastname,
//             EmailId: emailId,
//             Images: allimage,
//             PhoneNumber: phoneNumber,
//           )),
//         )
//       ],
//       builder: (context, child) {
//         return MaterialApp(
//           theme: AppTheme.lightTheme,
//           darkTheme: AppTheme.darkTheme,
//           themeMode:
//               (Provider.of<ThemeProvider>(context).themeModal.isDarkMode ==
//                       false)
//                   ? ThemeMode.light
//                   : ThemeMode.dark,
//           debugShowCheckedModeBanner: false,
//           initialRoute: (isIntroVisited) ? '/' : 'introScreen',
//           routes: {
//             '/': (context) => const homepage(),
//             'add-contact': (context) => const add_contact(),
//             'introScreen': (context) => const IntroScreen(),
//           },
//         );
//       },
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:projects/views/screens/geeta-app/chepter-details-page.dart';
// import 'package:projects/views/screens/geeta-app/homepage.dart';
// import 'package:projects/views/screens/geeta-app/verse_details_page.dart';
// import 'package:projects/views/screens/geeta-app/verse_page.dart';
// import 'package:provider/provider.dart';
//
// import 'Controller/Provider/geeta-app/Language-Change-Provider.dart';
// import 'Controller/Provider/geeta-app/all_chepter_provider.dart';
// import 'Controller/Provider/geeta-app/sholakProvider.dart';
//
// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => AllChepterProvider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => Language_Change_Provider(),
//         ),
//         ChangeNotifierProvider(
//           create: (context) => Chapter_Provider(),
//         ),
//       ],
//       builder: (context, child) {
//         return MaterialApp(
//           debugShowCheckedModeBanner: false,
//           theme: ThemeData.light(useMaterial3: true),
//           darkTheme: ThemeData.dark(useMaterial3: true),
//           themeMode: ThemeMode.system,
//           routes: {
//             '/': (context) => const geeta_Home_Page(),
//             'chapter-DetailsPage': (context) => const chepter_Details_page(),
//             'verse_page': (context) => const verse_page(),
//             'Verse_deatils': (context) => const Verse_deatils(),
//           },
//         );
//       },
//     ),
//   );
// }

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   bool isDarkMode = false;
//   String myFont = "Overthink";
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // theme: ThemeData(
//       //   colorScheme: const ColorScheme.light(
//       //     brightness: Brightness.light,
//       //     primary: Colors.orange,
//       //     secondary: Colors.red,
//       //   ),
//       // ),
//       // darkTheme: ThemeData(
//       //   colorScheme: const ColorScheme.dark(
//       //     brightness: Brightness.dark,
//       //     primary: Colors.teal,
//       //     secondary: Colors.amber,
//       //   ),
//       // ),
//       theme: AppTheme.lightTheme,
//       darkTheme: AppTheme.darkTheme,
//       themeMode: (isDarkMode == false) ? ThemeMode.light : ThemeMode.dark,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => HomePage(),
//       },
//     );
//   }
// }

// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:projects/views/screens/firebase_chatapp/chat_page.dart';
// import 'package:projects/views/screens/firebase_chatapp/homepage.dart';
// import 'package:projects/views/screens/firebase_chatapp/login_page.dart';
// import 'package:projects/views/screens/firebase_chatapp/signup.dart';
//
// import 'firebase_options.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(useMaterial3: true),
//       darkTheme: ThemeData.dark(useMaterial3: true),
//       initialRoute: '/LoginPage',
//       getPages: [
//         GetPage(
//           name: '/',
//           page: () => const HomePage(),
//         ),
//         GetPage(
//           name: '/SignUp',
//           page: () => const SignUp(),
//         ),
//         GetPage(
//           name: '/LoginPage',
//           page: () => const LoginPage(),
//         ),
//         GetPage(
//           name: '/chatPage',
//           page: () => const chatPage(),
//         )
//       ],
//     ),
//   );
// }

// import 'package:flutter/material.dart';
// import 'package:projects/packages/country_flag.dart';
// import 'package:projects/packages/glass.dart';
// import 'package:projects/packages/screen_capture.dart';
//
// void main() {
//   runApp(
//     MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.light(useMaterial3: true),
//       darkTheme: ThemeData.dark(useMaterial3: true),
//       themeMode: ThemeMode.system,
//       initialRoute: 'glass',
//       routes: {
//         '/': (context) => const country_flag(),
//         'screen_capture': (context) => const screen_capture(),
//         'glass': (context) => const glass(),
//       },
//     ),
//   );
// }

// fitness-app

// import 'package:flutter/material.dart';
// import 'package:projects/Controller/Provider/fitness_app/fitness_app.dart';
// import 'package:projects/views/screens/fitness-app/homepage.dart';
// import 'package:provider/provider.dart';
//
// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => fitnessProvider(),
//       ),
//     ],
//     builder: (context, child) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         themeMode: ThemeMode.system,
//         // initialRoute: ,
//         routes: {
//           '/': (context) => fitness_Home_Page(),
//         },
//       );
//     },
//   ));
// }

//qouteapp

// import 'package:flutter/material.dart';
// import 'package:projects/views/screens/qoute_app_api/homepgae.dart';
// import 'package:provider/provider.dart';
//
// import 'Controller/Provider/qoutes_app_api/qoute_app_provider.dart';
//
// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => qoute_app_proivder(),
//       ),
//     ],
//     builder: (context, child) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         themeMode: ThemeMode.system,
//         // initialRoute: ,
//         routes: {
//           '/': (context) => qoute_home_page(),
//         },
//       );
//     },
//   ));
// }

//Logo-App

// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => LogoProvider(),
//       ),
//     ],
//     builder: (context, child) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         themeMode: ThemeMode.system,
//         // initialRoute: ,
//         routes: {
//           '/': (context) => Logo_HomePage(),
//         },
//       );
//     },
//   ));
// }

//newsapp
// import 'package:flutter/material.dart';
// import 'package:projects/views/screens/api/news_app/homepage.dart';
// import 'package:projects/views/screens/api/news_app/news_details.dart';
// import 'package:provider/provider.dart';
//
// import 'Controller/Provider/api/news_app/news_provider.dart';
//
// void main() {
//   runApp(MultiProvider(
//     providers: [
//       ChangeNotifierProvider(
//         create: (context) => news_Provider(),
//       ),
//     ],
//     builder: (context, child) {
//       return MaterialApp(
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//         themeMode: ThemeMode.system,
//         // initialRoute: ,
//         routes: {
//           '/': (context) => News_HomePage(),
//           'NewsDetails': (context) => NewsDetails(),
//         },
//       );
//     },
//   ));
// }

// product-app

import 'package:flutter/material.dart';
import 'package:projects/views/screens/json/product_app.dart';
import 'package:provider/provider.dart';

import 'Controller/Provider/api/news_app/news_provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => news_Provider(),
      ),
    ],
    builder: (context, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        themeMode: ThemeMode.system,
        // initialRoute: ,
        routes: {
          '/': (context) => product_homepage(),
        },
      );
    },
  ));
}
