import 'package:antidote/constants.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/cupertino.dart';
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
          style: TextStyle(color: CupertinoColors.activeBlue),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
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
    return Container(
      color: Colors.white,
    );
  }
}
