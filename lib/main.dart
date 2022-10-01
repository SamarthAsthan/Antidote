// ignore_for_file: prefer_const_constructors

import 'package:antidote/screens/notificationspage.dart';
import 'package:antidote/sheets/complaintsheet.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSheetApi.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Notifications",
            style: TextStyle(color: Colors.black),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.deepPurple),
        ),
        body: const HomePage(),
        drawer: const NavigationDrawer(),
      ),
    );
  }
}
