import 'package:flutter/material.dart';

class NotificationBody extends StatelessWidget {
  const NotificationBody(
      {super.key,
      required this.titleBody,
      required this.bodyBody,
      required this.linkBody,
      required this.sourceBody});
  final String titleBody, bodyBody, linkBody, sourceBody;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleBody),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  bodyBody,
                  style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Link- $linkBody',
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      'Source- $sourceBody',
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.w800),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
