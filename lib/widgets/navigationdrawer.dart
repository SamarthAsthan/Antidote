// ignore_for_file: sort_child_properties_last

import 'package:antidote/main.dart';
import 'package:antidote/screens/complaintpage.dart';
import 'package:antidote/screens/messmenupage.dart';
import 'package:antidote/screens/settingpage.dart';
import 'package:antidote/screens/signinpage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            buildHeader(context),
            buildMenuItems(context),
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    return Container(
      color: Colors.blue,
      child: Column(
        children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage('${user?.photoURL}'),
          ),
          const SizedBox(height: 10),
          Text(
            '${user?.displayName}',
            textAlign: TextAlign.center,
            // ignore: prefer_const_constructors
            style: TextStyle(
                color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            '${user?.email}',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top, bottom: 24),
    );
  }

  Widget buildMenuItems(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Wrap(
        runSpacing: 1,
        children: [
          ListTile(
            leading: const Icon(Icons.notifications_active),
            title: const Text("Notifications"),
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const MyApp()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.fastfood_rounded),
            title: const Text("Mess Menu"),
            onTap: () {
              //Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MessMenu()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.warning_amber_rounded),
            title: const Text("Complaints"),
            onTap: () {
              //Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => ComplaintsPage()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              //Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const Settings()));
            },
          ),
          ListTile(
            selectedColor: Colors.deepPurple,
            leading: const Icon(Icons.people_alt_rounded),
            title: const Text("Antidote Team"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.share_rounded),
            title: const Text("Share App"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.bug_report_rounded),
            title: const Text("Bug Report"),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.logout_rounded),
            title: const Text("Log Out"),
            onTap: () async {
              Future<SignInScreen> _signOut() async {
                await FirebaseAuth.instance.signOut();

                return new SignInScreen();
              }

              _signOut();
              //Navigator.pop(context);
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SignInScreen()));
            },
          )
        ],
      ),
    );
  }
}
