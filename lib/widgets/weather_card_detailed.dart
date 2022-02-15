import 'package:flutter/material.dart';

import '../models/weather_forecast.dart';
import '../utilities/forecast_util.dart';
import 'background_widget.dart';
import 'border_widget.dart';

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

  Widget weatherCardDetailed(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    var forecastList = state.list;
    var icon = forecastList[index].getIconUrl();
    var thermometer = 'assets/icons/thermometer.png';
    var rainy = 'assets/icons/rainy.png';
    var wind = 'assets/icons/wind.png';
    var pressure = forecastList[index].pressure * 0.750062;
    var humidity = forecastList[index].humidity;
    var windSpeed = forecastList[index].speed;
    var description = forecastList[index].weather[0].description.toUpperCase();
    var city = state.city.name;
    var country = state.city.country;
    var temperature = forecastList[index].temp.day.floorToDouble().toInt();
    forecastList[index].weather[0].description.toUpperCase();
    var minTemperature = forecastList[index].temp.min.floorToDouble().toInt();
    forecastList[index].weather[0].description.toUpperCase();
    var maxTemperature = forecastList[index].temp.max.floorToDouble().toInt();
    forecastList[index].weather[0].description.toUpperCase();
    var formattedDate =
        DateTime.fromMillisecondsSinceEpoch(forecastList[index].dt * 1000);
    var feelslikeMorn = forecastList[index].feelsLike.morn.floor();
    var feelslikeDay = forecastList[index].feelsLike.day.floor();
    var feelslikeEve = forecastList[index].feelsLike.eve.floor();
    var feelslikeNight = forecastList[index].feelsLike.morn.floor();

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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Min. temperature'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$minTemperature ℃',
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
                          'Max. temperature'.toUpperCase(),
                          style: const TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '$maxTemperature ℃',
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
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Image.asset('assets/icons/sunrise.png'),
                        const SizedBox(height: 5),
                        Image.asset('assets/icons/sun.png'),
                        const SizedBox(height: 5),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          '$feelslikeMorn ℃',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: feelslikeMorn <= 0
                                ? Colors.blue[700]
                                : Colors.orange[800],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$feelslikeDay ℃',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: feelslikeDay <= 0
                                ? Colors.blue[700]
                                : Colors.orange[800],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        Image.asset('assets/icons/sunset.png'),
                        const SizedBox(height: 5),
                        Image.asset('assets/icons/night.png'),
                        const SizedBox(height: 5),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          '$feelslikeEve ℃',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: feelslikeEve <= 0
                                ? Colors.blue[700]
                                : Colors.orange[800],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '$feelslikeNight ℃',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: feelslikeNight <= 0
                                ? Colors.blue[700]
                                : Colors.orange[800],
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
}
