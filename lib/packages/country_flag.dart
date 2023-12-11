import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';

class country_flag extends StatefulWidget {
  const country_flag({super.key});

  @override
  State<country_flag> createState() => _country_flagState();
}

class _country_flagState extends State<country_flag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Country Flag"),
      ),
      body: Center(
        child: CountryFlag.fromCountryCode(
          'IN',
          width: 100,
          height: 100,
          borderRadius: 10,
        ),
      ),
    );
  }
}
