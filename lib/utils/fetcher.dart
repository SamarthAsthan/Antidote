// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:antidote/constants.dart';
import 'package:antidote/models/notificationsmodel.dart';
import 'package:http/http.dart' as http;

List<NotificationsDataModel> newsList = [];
// Fetching Json file.
Future<List<NotificationsDataModel>> ReadJsonData() async {
  var response = await http.get(Uri.parse(urlNotifications));
  if (response.statusCode == 200) {
    var listNews = json.decode(response.body) as List<dynamic>;
    //print(listNews.length);
    return listNews.map((e) => NotificationsDataModel.fromJson(e)).toList();
  } else {
    return newsList;
  }
}
