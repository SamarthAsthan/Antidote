// ignore_for_file: prefer_const_constructors, unnecessary_new

import 'package:antidote/constants.dart';
import 'package:antidote/widgets/notificationbody.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class newlist extends StatelessWidget {
  const newlist(
      {super.key,
      required this.title,
      required this.body,
      required this.priority,
      required this.links,
      required this.source});
  final String title, body, priority, links, source;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        elevation: 4.0,
        margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          child: ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              leading: Container(
                decoration: new BoxDecoration(
                    border: new Border(
                        right: new BorderSide(
                            width: 10.0, color: Colors.white24))),
                child: Icon(Icons.notifications_none_rounded,
                    color: CupertinoColors.activeBlue),
              ),
              title: Text(
                "$title ",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
              ),
              // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),

              subtitle: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Row(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: <Widget>[
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: CupertinoColors.systemRed,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Text("Important",
                          style: TextStyle(color: Colors.black, fontSize: 15)),
                    )
                  ],
                ),
              ),
              trailing: Icon(Icons.keyboard_arrow_right,
                  color: Colors.black, size: 30.0)),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NotificationBody(
                  titleBody: title,
                  bodyBody: body,
                  linkBody: links,
                  sourceBody: source,
                )));
      },
    );
  }
}
