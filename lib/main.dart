// ignore_for_file: prefer_const_constructors

import 'package:antidote/screens/notificationspage.dart';
import 'package:antidote/screens/signinpage.dart';
import 'package:antidote/sheets/complaintsheet.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserSheetApi.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    bool isLoggedIn = FirebaseAuth.instance.currentUser != null ? true : false;
    if (isLoggedIn) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(
          user: user!,
        ),
      );
    } else {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignInScreen(),
      );
    }
  }
}
