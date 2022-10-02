import 'package:antidote/models/complaintmodel.dart';
import 'package:antidote/sheets/complaintsheet.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/material.dart';

class ComplaintsPage extends StatelessWidget {
  ComplaintsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Complaints",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.blue),
      ),
      drawer: NavigationDrawer(),
      body: ComplaintBody(),
    );
  }
}

class ComplaintBody extends StatefulWidget {
  ComplaintBody({super.key});

  @override
  State<ComplaintBody> createState() => _ComplaintBodyState();
}

class _ComplaintBodyState extends State<ComplaintBody> {
  final complaintType = ['Technical', 'VS Services', 'Mess'];

  String? selectedComplaint;

  TextEditingController nameController = new TextEditingController();
  TextEditingController regNoController = new TextEditingController();
  TextEditingController roomNoController = new TextEditingController();
  TextEditingController complaintController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.fromLTRB(10, 5, 5, 0),
            child: Text(
              "Register new complaint",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.person),
            title: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.numbers_rounded),
            title: TextField(
              controller: regNoController,
              decoration: const InputDecoration(
                hintText: "Registration Number",
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.room_rounded),
            title: TextField(
              controller: roomNoController,
              decoration: const InputDecoration(
                hintText: "Room No",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Select Complaint Type",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                DropdownButton<String>(
                  elevation: 1,
                  hint: const Text('Technical'),
                  value: selectedComplaint,
                  items: complaintType.map(buildComplaintItem).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedComplaint = value;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          ListTile(
            title: TextField(
              controller: complaintController,
              decoration: const InputDecoration(
                hintText: "Complaint in Detail",
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: AlignmentDirectional.center,
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () async {
                DateTime now = DateTime.now();
                // ignore: prefer_const_constructors
                final complainttest = Complaints(
                    time: "${now.day}/${now.month}/${now.year}",
                    regNo: regNoController.text.toUpperCase(),
                    name: nameController.text.toUpperCase(),
                    email: 'samarth.asthan2021@vitstudent.ac.in',
                    roomNo: roomNoController.text.toString(),
                    type: '$selectedComplaint',
                    complaint: complaintController.text.toString());
                await UserSheetApi.insert([complainttest.toJson()]);
              },
              icon: const Icon(
                // <-- Icon
                Icons.check,
                size: 24.0,
              ),
              label: const Text('Done'), // <-- Text
            ),
          ),
        ],
      ),
    );
  }

  DropdownMenuItem<String> buildComplaintItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
