import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/main_screen/cubit/weather_forecast_daily_cubit.dart';
import '../utilities/forecast_util.dart';

class CityTempView extends StatelessWidget {
  const CityTempView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        if (state is WeatherForecastLoadedState) {
          var forecastList = state.loadWeather.list;
          var icon = forecastList[0].getIconUrl();
          var city = state.loadWeather.city.name;
          var country = state.loadWeather.city.country;
          var temperature = forecastList[0].temp.day.floorToDouble().toInt();
          var description =
              forecastList[0].weather[0].description.toUpperCase();
          var formattedDate =
              DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(255, 255, 255, 0.5),
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(15.0)),
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Text(
                    '$city, $country',
                    style: TextStyle(
                        fontSize: 42.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange[800]),
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
                ],
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
