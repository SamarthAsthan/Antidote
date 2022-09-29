class MenuModel {
  late String sunday;
  late String monday;
  late String tuesday;
  late String wednesday;
  late String thursday;
  late String friday;
  late String saturday;

  MenuModel(
      {required this.sunday,
      required this.monday,
      required this.tuesday,
      required this.wednesday,
      required this.thursday,
      required this.friday,
      required this.saturday});

  factory MenuModel.fromJson(dynamic json) {
    return MenuModel(
      sunday: "${json['Sunday']}",
      monday: "${json['Monday']}",
      tuesday: "${json['Tuesday']}",
      wednesday: "${json['Wednesday']}",
      thursday: "${json['Thursday']}",
      friday: "${json['Friday']}",
      saturday: "${json['Saturday']}",
    );
  }

  Map toJson() => {
        "Sunday": sunday,
        "Monday": monday,
        "Tuesday": tuesday,
        "Wednesday": wednesday,
        "Thursday": thursday,
        "Friday": friday,
        "Saturday": saturday,
      };
}
