import 'package:flutter/material.dart';

import '../models/hourly/weather_forecast_hourly.dart';
import '../utilities/forecast_util.dart';

Widget weatherCardHourly(WeatherForecastHourly state, int index) {
  var forecastList = state.hourly;
  var hourly = '';
  DateTime time =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullTime = Util.getFormattedTime(time);
  var temperature = forecastList[index].temp.floorToDouble().toInt();
  var icon = forecastList[index].getIconUrl();
  hourly = fullTime;

  return SingleChildScrollView(
    child: Column(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              hourly,
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              icon,
              scale: 1.0,
            ),
            Text(
              '$temperature ℃',
              style: TextStyle(
                fontSize: 25.0,
                color: temperature <= 0 ? Colors.blue[700] : Colors.orange[700],
              ),
            ),
          ],
        )
      ],
    ),
  );
}
