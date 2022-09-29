// ignore_for_file: non_constant_identifier_names

class NotificationsDataModel {
  String? title;
  String? body;
  int? priority;
  String? links;
  String? source;

  NotificationsDataModel(
      {this.title, this.body, this.priority, this.links, this.source});

  NotificationsDataModel.fromJson(Map<String, dynamic> json) {
    title = json["Title"];
    body = json["Body"];
    priority = json["Priority"];
    links = json["Links"];
    source = json["Source"];
  }
}
