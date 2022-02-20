import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';
import '../../utilities/forecast_util.dart';

class WeatherCardDetailedCityTemp extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailedCityTemp(
      {Key? key, required this.index, required this.state})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherCardDetailedCityTemp(context, state, index);
  }

  Widget weatherCardDetailedCityTemp(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    var forecastList = state.list;
    var city = state.city.name;
    var country = state.city.country;
    var temperature = forecastList[index].temp.day.floorToDouble().toInt();
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
    var description = forecastList[index].weather[0].description.toUpperCase();
    var icon = forecastList[index].getIconUrl();

    return Column(
      children: [
        Text(
          '$city, $country',
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          style: const TextStyle(
            fontSize: 38.0,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Text(
          Util.getFormattedDate(formattedDate),
          style: const TextStyle(fontSize: 15),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              icon,
              scale: 0.5,
            ),
            const SizedBox(width: 20.0),
            Column(
              children: [
                Text(
                  '$temperature ℃',
                  style: TextStyle(
                      fontSize: 35,
                      color: temperature <= 0
                          ? Colors.blue[700]
                          : Colors.orange[700],
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
