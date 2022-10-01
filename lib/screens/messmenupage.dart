import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/material.dart';

class MessMenu extends StatelessWidget {
  const MessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Mess Menu",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
        backgroundColor: Colors.deepPurple,
      ),
      body: const MessBody(),
      drawer: const NavigationDrawer(),
    );
  }
}

class MessBody extends StatelessWidget {
  const MessBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center();
  }
}
