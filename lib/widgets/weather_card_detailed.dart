import 'package:flutter/material.dart';

import '../models/weather_forecast.dart';
import '../utilities/forecast_util.dart';
import '../widgets/background_widget.dart';
import '../widgets/border_widget.dart';

class WeatherCardDetailed extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailed(
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
  WeatherForecast state,
  int index,
) {
  var forecastList = state.list;
  var dayOfTheWeek = '';
  DateTime date =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  var icon = forecastList[index].getIconUrl();
  var thermometer = 'assets/icons/thermometer.png';
  var rainy = 'assets/icons/rainy.png';
  var wind = 'assets/icons/wind.png';
  var pressure = forecastList[index].pressure * 0.750062;
  var humidity = forecastList[index].humidity;
  var windSpeed = forecastList[index].speed;
  var description = forecastList[index].weather[0].description.toUpperCase();
  dayOfTheWeek = fullDate.split(',')[0];
  var city = state.city.name;
  var country = state.city.country;
  var temperature = forecastList[index].temp.min.floorToDouble().toInt();
  forecastList[index].weather[0].description.toUpperCase();
  var formattedDate =
      DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);

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
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 80,
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
