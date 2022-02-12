import 'package:flutter/material.dart';

import '../widgets/background_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final items = ['By the hour', 'By the day'];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.my_location,
            color: Colors.yellow,
          ),
        ),
        centerTitle: true,
        title: Image.asset(
          'assets/logo/logo.png',
          width: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.green[100],
                value: dropdownValue,
                icon: Image.asset('assets/icons/arrow_down.png'),
                elevation: 16,
                style: const TextStyle(color: Colors.black87),
                onChanged: (value) => setState(() => dropdownValue = value),
                items: items.map(buildMenuItem).toList(),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: backGroundWidget(),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
