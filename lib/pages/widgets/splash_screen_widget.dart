import 'package:flutter/material.dart';

Widget splashScreenWidget() {
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage('assets/background/bg.jpg'),
        fit: BoxFit.cover,
      ),
    ),
    child: Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.lightGreen[300],
        color: Colors.green[700],
      ),
    ),
  );
}
