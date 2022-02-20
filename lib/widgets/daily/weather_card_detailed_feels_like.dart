import 'package:flutter/material.dart';

import '../../models/weather_forecast.dart';

class WeatherCardDetailedFeelsLike extends StatelessWidget {
  final WeatherForecast state;
  final int index;
  const WeatherCardDetailedFeelsLike(
      {Key? key, required this.state, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return weatherCardDetailedFeelsLike(context, state, index);
  }

  Widget weatherCardDetailedFeelsLike(
    BuildContext context,
    WeatherForecast state,
    int index,
  ) {
    var forecastList = state.list;
    var feelslikeMorn = forecastList[index].feelsLike.morn.floor();
    var feelslikeDay = forecastList[index].feelsLike.day.floor();
    var feelslikeEve = forecastList[index].feelsLike.eve.floor();
    var feelslikeNight = forecastList[index].feelsLike.morn.floor();
    return Column(
      children: [
        Text(
          'Feels like'.toUpperCase(),
          style: const TextStyle(
              fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
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
      ],
    );
  }
}
