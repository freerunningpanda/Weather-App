import 'package:flutter/material.dart';

import '../widgets/background_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                dropdownColor: Colors.yellow[100],
                value: dropdownValue,
                icon: Image.asset('assets/icons/arrow_down.png'),
                elevation: 16,
                style: const TextStyle(color: Colors.blueGrey),
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
