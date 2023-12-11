import 'package:flutter/material.dart';
import 'package:glass/glass.dart';

class glass extends StatefulWidget {
  const glass({super.key});

  @override
  State<glass> createState() => _glassState();
}

class _glassState extends State<glass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Glass"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('Assets/Images/virat-kohli-png.jpg'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: const Padding(
                        padding: EdgeInsets.all(150.0),
                        child: Text(
                          "virat kohli",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ).asGlass(
                      tintColor: Colors.transparent,
                      clipBorderRadius: BorderRadius.circular(15),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
