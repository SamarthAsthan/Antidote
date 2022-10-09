// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:antidote/constants.dart';
import 'package:antidote/models/notificationsmodel.dart';
import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:http/http.dart' as http;

List<NotificationsDataModel> newsList = [];
// Fetching Json file.
Future<List<NotificationsDataModel>> ReadJsonData() async {
  var isCacheExist = await APICacheManager().isAPICacheKeyExist("Notify");
  if (!isCacheExist) {
    var response = await http.get(Uri.parse(urlNotifications));
    if (response.statusCode == 200) {
      APICacheDBModel cacheDBModel =
          new APICacheDBModel(key: "Notify", syncData: response.body);
      await APICacheManager().addCacheData(cacheDBModel);
      var newsList = json.decode(response.body) as List<dynamic>;
      print("API-Hit");
      return newsList.map((e) => NotificationsDataModel.fromJson(e)).toList();
    } else {
      return newsList;
    }
  } else {
    var cacheData = await APICacheManager().getCacheData("Notify");
    var newsList = json.decode(cacheData.syncData) as List<dynamic>;
    print("Cache-Hit");

    return newsList.map((e) => NotificationsDataModel.fromJson(e)).toList();
  }
}
