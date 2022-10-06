import 'package:antidote/constants.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/material.dart';

class MessMenu extends StatelessWidget {
  const MessMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mess Menu",
          style: TextStyle(color: myColors().themeColor),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: myColors().themeColor),
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
