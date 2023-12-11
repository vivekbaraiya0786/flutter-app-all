import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // fontFamily: "Overthink",
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.black,
    //   foregroundColor: Colors.white,
    // ),
    // textTheme: const TextTheme(
    //     displaySmall: TextStyle(
    //   fontSize: 18,
    //   color: Colors.red,
    // )),
    // colorScheme: const ColorScheme.light(
    //   brightness: Brightness.light,
    //   primary: Colors.orange,
    //   secondary: Colors.red,
    // ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.blue,
      brightness: Brightness.light,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    // appBarTheme: const AppBarTheme(
    //   backgroundColor: Colors.white,
    //   foregroundColor: Colors.black,
    // ),
    // // fontFamily: "Overthink",
    // colorScheme: const ColorScheme.dark(
    //   brightness: Brightness.dark,
    //   primary: Colors.teal,
    //   secondary: Colors.amber,
    // ),
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.purple,
      brightness: Brightness.dark,
    ),
  );
}
