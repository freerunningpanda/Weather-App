import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/main_screen/cubit/weather_forecast_daily_cubit.dart';

class TemperatureView extends StatelessWidget {
  const TemperatureView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        if (state is WeatherForecastLoadedState) {
          var forecastList = state.loadWeather.list;
          var icon = forecastList[0].getIconUrl();
          var temperature = forecastList[0].temp.day.toStringAsFixed(0);
          return Row(
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
                        fontSize: 50,
                        color: Colors.orange[800],
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
