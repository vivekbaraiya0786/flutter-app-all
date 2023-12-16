import 'package:flutter/material.dart';

class Chat_components extends StatefulWidget {
  const Chat_components({super.key});

  @override
  State<Chat_components> createState() => _Chat_componentsState();
}

class _Chat_componentsState extends State<Chat_components> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.purple,
      child: Center(child: Text("Apple")),
    );
  }
}
