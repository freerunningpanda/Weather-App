import 'package:flutter/material.dart';

Widget splashScreenWidget() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/background/bg.png'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.blueGrey[800],
        color: Colors.yellow,
      ),
    ),
  );
}
