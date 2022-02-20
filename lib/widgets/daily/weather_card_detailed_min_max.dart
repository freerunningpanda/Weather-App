import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';

class WeatherCardDetailedMinMax extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailedMinMax(
      {Key? key, required this.index, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherCardDetailedMinMax(context, state, index);
  }

  Widget weatherCardDetailedMinMax(
      BuildContext context, WeatherForecast state, int index) {
    var forecastList = state.list;
    var minTemperature = forecastList[index].temp.min.floorToDouble().toInt();
    var maxTemperature = forecastList[index].temp.max.floorToDouble().toInt();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              'Min. temperature'.toUpperCase(),
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '$minTemperature ℃',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color:
                    minTemperature <= 0 ? Colors.blue[700] : Colors.orange[700],
              ),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              'Max. temperature'.toUpperCase(),
              style:
                  const TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
            ),
            Text(
              '$maxTemperature ℃',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color:
                    maxTemperature <= 0 ? Colors.blue[700] : Colors.orange[700],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
