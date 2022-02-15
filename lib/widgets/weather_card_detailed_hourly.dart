import 'package:flutter/material.dart';

import '../models/hourly/weather_forecast_hourly.dart';
import '../utilities/forecast_util.dart';
import 'background_widget.dart';
import 'border_widget.dart';

class WeatherCardDetailedHourly extends StatelessWidget {
  final WeatherForecastHourly state;
  final int index;
  const WeatherCardDetailedHourly(
      {Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: weatherCardDetailed(context, state, index),
    );
  }
}

Widget weatherCardDetailed(
  BuildContext context,
  WeatherForecastHourly state,
  int index,
) {
  var hourly = '';
  var forecastList = state.hourly;
  var icon = forecastList[index].getIconUrl();
  var thermometer = 'assets/icons/thermometer.png';
  var rainy = 'assets/icons/rainy.png';
  var wind = 'assets/icons/wind.png';
  var pressure = forecastList[index].pressure * 0.750062;
  var humidity = forecastList[index].humidity;
  var windSpeed = forecastList[index].windSpeed;
  var description = forecastList[index].weather[0].description.toUpperCase();
  var temperature = forecastList[index].temp.floorToDouble().toInt();
  var time = DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullTime = Util.getFormattedTime(time);
  var feelslike = forecastList[index].feelsLike.floor();
  var dewPoint = forecastList[index].dewPoint;
  var visibility = forecastList[index].visibility;
  hourly = fullTime;

  return Container(
    height: double.infinity,
    decoration: backGroundWidget(),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: borderWidget(),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Text(
                hourly,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 38.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Dew point'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$dewPoint ℃',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: temperature <= 0
                              ? Colors.blue[700]
                              : Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Visibility'.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 15.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$visibility m',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: temperature <= 0
                              ? Colors.blue[700]
                              : Colors.orange[700],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Feels like'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '$feelslike ℃',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: feelslike <= 0 ? Colors.blue[700] : Colors.orange[800],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Wind, Pressure and Precipitation'.toUpperCase(),
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Util.getDetailForecast(wind, windSpeed.toInt(), 'm/s'),
                  Util.getDetailForecast(
                      thermometer, pressure.round(), 'mm Hg'),
                  Util.getDetailForecast(rainy, humidity.toInt(), '%'),
                ],
              ),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: 270.0,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(width: 5),
                      Text(
                        'Back',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.all(
                      Colors.yellow[700],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    ),
  );
}
