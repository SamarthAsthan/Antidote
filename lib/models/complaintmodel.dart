class ComplaintField {
  static const String name = 'Name';
  static const String regNo = 'Reg no';
  static const String time = 'Time';
  static const String email = 'Email';
  static const String roomNo = 'Room no';
  static const String type = 'Type';
  static const String complaint = 'Complaint';

  static List<String> getFields() =>
      [time, regNo, name, email, roomNo, type, complaint];
}

class Complaints {
  final String? time;
  final String? regNo;
  final String? name;
  final String? email;
  final String? roomNo;
  final String? type;
  final String? complaint;

  const Complaints({
    this.time,
    this.regNo,
    this.name,
    this.email,
    this.roomNo,
    this.type,
    this.complaint,
  });

  Map<String, dynamic> toJson() => {
        ComplaintField.time: time,
        ComplaintField.regNo: regNo,
        ComplaintField.name: name,
        ComplaintField.email: email,
        ComplaintField.roomNo: roomNo,
        ComplaintField.type: type,
        ComplaintField.complaint: complaint,
      };
}
