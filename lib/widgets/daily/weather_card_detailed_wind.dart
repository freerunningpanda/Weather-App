import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';
import '../../utilities/forecast_util.dart';

class WeatherCardDetailedWind extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailedWind(
      {Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherCardDetailed(context, state, index);
  }

  Widget weatherCardDetailed(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    var forecastList = state.list;
    var thermometer = 'assets/icons/thermometer.png';
    var rainy = 'assets/icons/rainy.png';
    var wind = 'assets/icons/wind.png';
    var pressure = forecastList[index].pressure * 0.750062;
    var humidity = forecastList[index].humidity;
    var windSpeed = forecastList[index].speed;
    return Column(
      children: [
        Text(
          'Wind, Pressure and Precipitation'.toUpperCase(),
          style: const TextStyle(
              fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Util.getDetailForecast(wind, windSpeed.toInt(), 'm/s'),
            Util.getDetailForecast(thermometer, pressure.round(), 'mm Hg'),
            Util.getDetailForecast(rainy, humidity.toInt(), '%'),
          ],
        ),
      ],
    );
  }
}
