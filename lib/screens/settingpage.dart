import 'package:antidote/constants.dart';
import 'package:antidote/widgets/navigationdrawer.dart';
import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings", style: TextStyle(color: myColors().themeColor)),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: myColors().themeColor),
      ),
      drawer: NavigationDrawer(),
      body: SettingsBody(),
    );
  }
}

class SettingsBody extends StatefulWidget {
  SettingsBody({super.key});

  @override
  State<SettingsBody> createState() => _SettingsBodyState();
}

class _SettingsBodyState extends State<SettingsBody> {
  final hostels = ['A Block', 'B Block Mens', 'B Block Womens', 'C Block'];
  final mess = ['Veg Mess', 'Non-Veg Mess', 'Special Mess'];

  String? selectedHostel;
  String? selectedMess;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select your Hostel Block",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              DropdownButton<String>(
                elevation: 1,
                hint: const Text('Block'),
                value: selectedHostel,
                items: hostels.map(buildMenuItem).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedHostel = value;
                  });
                },
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Select your Mess",
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
              DropdownButton<String>(
                elevation: 1,
                hint: const Text('Mess'),
                value: selectedMess,
                items: mess.map(buildHostelItem).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedMess = value;
                  });
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  DropdownMenuItem<String> buildHostelItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item),
      );
}
