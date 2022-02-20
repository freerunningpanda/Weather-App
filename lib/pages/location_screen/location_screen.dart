import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../cubit/weather_forecast_hourly_cubit.dart';
import '../home_screen/home_screen.dart';
import '/api/weather_repository.dart';
import '/cubit/weather_forecast_daily_cubit.dart';
import '/widgets/splash_screen_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherForecastDailyCubit(WeatherRepository()),
        ),
        BlocProvider(
          create: (context) => WeatherForecastHourlyCubit(WeatherRepository()),
        ),
      ],
      child: BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
        builder: (context, state) {
          if (state is WeatherForecastDailyInitial) {
            context.read<WeatherForecastDailyCubit>().fetchWeatherWithCity();
            context
                .read<WeatherForecastHourlyCubit>()
                .fetchWeatherForecastHourly();
            return splashScreenWidget();
          }
          if (state is WeatherForecastLoadedState) {
            return const HomeScreen();
          }
          return Container();
        },
      ),
    );
  }
}
