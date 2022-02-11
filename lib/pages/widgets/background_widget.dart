import 'package:flutter/material.dart';

BoxDecoration backGroundWidget() {
  return const BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/background/bg.jpg'),
      fit: BoxFit.cover,
    ),
  );
}
