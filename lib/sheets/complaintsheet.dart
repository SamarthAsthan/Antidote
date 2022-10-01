import 'package:antidote/constants.dart';
import 'package:antidote/models/complaintmodel.dart';
import 'package:gsheets/gsheets.dart';

class UserSheetApi {
  static final _gsheet = GSheets(credentials);

  static Worksheet? _complaintSheet;

  static Future init() async {
    try {
      final spreadsheet = await _gsheet.spreadsheet(complaintSheetID);
      // get worksheet by its title
      _complaintSheet = spreadsheet.worksheetByTitle('example');
      // create worksheet if it does not exist yet
      _complaintSheet ??= await spreadsheet.addWorksheet('example');
      //_complaintSheet = await _getWorkSheet(spreadsheet, title: 'Complaints');

      final firstRow = ComplaintField.getFields();
      _complaintSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init Eror: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return await spreadsheet.addWorksheet(title);
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_complaintSheet == null) return;
    _complaintSheet!.values.map.appendRows(rowList);
  }
}
