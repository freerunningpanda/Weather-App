import 'package:flutter/material.dart';

import 'border_widget.dart';
import '../utilities/forecast_util.dart';
import '../models/weather_forecast.dart';

class CityTempView extends StatelessWidget {
  final WeatherForecast data;
  const CityTempView({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var forecastList = data.list;
    var icon = forecastList[0].getIconUrl();
    var city = data.city.name;
    var country = data.city.country;
    var temperature = forecastList[0].temp.day.floorToDouble().toInt();
    var description = forecastList[0].weather[0].description.toUpperCase();
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: borderWidget(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                '$city, $country',
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                    fontSize: 38.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
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
          ),
        ),
      ),
    );
  }
}
