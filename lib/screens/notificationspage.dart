// ignore_for_file: prefer_const_constructors

import 'package:antidote/constants.dart';
import 'package:antidote/models/notificationsmodel.dart';
import 'package:antidote/screens/signinpage.dart';
import 'package:antidote/utils/fetcher.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:antidote/widgets/notificationlist.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required User user})
      : _user = user,
        super(key: key);

  final User? _user;

  @override
  State<HomePage> createState() => _HomePageState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _HomePageState extends State<HomePage> {
  late User _user;
  bool _isSigningOut = false;

  Route _routeToSignInScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => SignInScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(-1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  @override
  void initState() {
    _user = widget._user!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeBody(),
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(
          "Notifications",
          // ignore: prefer_const_constructors
          style: TextStyle(
              color: CupertinoColors.activeBlue, fontWeight: FontWeight.w800),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: CupertinoColors.activeBlue),
        actions: [
          IconButton(
              onPressed: () {
                APICacheManager().emptyCache();
                User? user = FirebaseAuth.instance.currentUser;
                Navigator.pushAndRemoveUntil(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation1, animation2) =>
                        HomePage(user: user!),
                    transitionDuration: Duration.zero,
                    reverseTransitionDuration: Duration.zero,
                  ),
                  (Route<dynamic> route) => false,
                );
              },
              icon: Icon(Icons.refresh_rounded))
        ],
      ),
      drawer: const NavigationDrawer(),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: FutureBuilder(
        future: ReadJsonData(),
        builder: (context, data) {
          if (data.hasError) {
            return Center(
              child: Text("${data.error}"),
            );
          } else if (data.hasData) {
            var items = data.data as List<NotificationsDataModel>;
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return newlist(
                        title: items[index].title.toString(),
                        body: items[index].body.toString(),
                        priority: items[index].priority.toString(),
                        links: items[index].links.toString(),
                        source: items[index].source.toString(),
                      );
                    },
                  ),
                ),
              ],
            );
          } else {
            return SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    CupertinoActivityIndicator(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Loading Notifications"),
                    )
                  ],
                ));
          }
        },
      ),
    );
  }
}

/*var newl = listNotifications.where((element) => (element['Title'] != null
        ? element['Title'].contains('samarth')
        : false));
    print(newl);*/