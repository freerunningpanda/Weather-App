import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Util {
  static String getFormattedDate(DateTime dateTime) {
    return DateFormat('EEE, MMM, d, y').format(dateTime);
  }

  static getDetailForecast(String iconData, int value, String units) {
    return Column(
      children: [
        Image(image: AssetImage(iconData)),
        const SizedBox(height: 10.0),
        Text(
          '$value',
          style: const TextStyle(
              fontSize: 20.0,
              color: Colors.black87,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5.0),
        Text(
          units,
          style: const TextStyle(fontSize: 15.0, color: Colors.black87),
        )
      ],
    );
  }
}
