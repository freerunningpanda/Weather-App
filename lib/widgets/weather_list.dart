import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/main_screen/cubit/weather_forecast_daily_cubit.dart';

class WeatherList extends StatelessWidget {
  const WeatherList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 0.5),
                border: Border.all(),
                borderRadius: BorderRadius.circular(15.0)),
            child: Column(
              children: [
                const SizedBox(
                  height: 16.0,
                ),
                Text(
                  'Weather forecast for 7 days'.toUpperCase(),
                  style: const TextStyle(
                      fontSize: 20,
                      color: Colors.black87,
                      fontWeight: FontWeight.bold),
                ),
                Container(
                  height: MediaQuery.of(context).size.height / 5,
                  padding: const EdgeInsets.all(16.0),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
