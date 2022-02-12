import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/main_screen/cubit/weather_forecast_daily_cubit.dart';
import '../utilities/forecast_util.dart';

class CityView extends StatelessWidget {
  const CityView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        if (state is WeatherForecastLoadedState) {
          var forecastList = state.loadWeather.list;
          var city = state.loadWeather.city.name;
          var country = state.loadWeather.city.country;
          var formattedDate =
              DateTime.fromMillisecondsSinceEpoch(forecastList[0].dt * 1000);
          return Column(
            children: [
              Text(
                '$city, $country',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange[800]),
              ),
              Text(
                Util.getFormattedDate(formattedDate),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
