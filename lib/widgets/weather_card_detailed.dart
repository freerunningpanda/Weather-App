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
  var minTemperature = forecastList[index].temp.min.floorToDouble().toInt();
  var icon = forecastList[index].getIconUrl();
  var thermometer = 'assets/icons/thermometer.png';
  var rainy = 'assets/icons/rainy.png';
  var wind = 'assets/icons/wind.png';
  var pressure = forecastList[0].pressure * 0.750062;
  var humidity = forecastList[0].humidity;
  var windSpeed = forecastList[0].speed;
  dayOfTheWeek = fullDate.split(',')[0];

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
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    dayOfTheWeek,
                    style: const TextStyle(
                        fontSize: 27,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold),
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
                    '$minTemperature ℃',
                    style: TextStyle(
                      fontSize: 25.0,
                      color: minTemperature <= 0
                          ? Colors.blue[700]
                          : Colors.orange[700],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
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
