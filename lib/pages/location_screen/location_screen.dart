import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen/home_screen.dart';
import '/api/weather_repository.dart';
import '/cubit/weather_forecast_daily_cubit.dart';
import '/widgets/splash_screen_widget.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherForecastDailyCubit(WeatherRepository()),
      child: const _LocationScreen(),
    );
  }
}

class _LocationScreen extends StatefulWidget {
  const _LocationScreen({Key? key}) : super(key: key);

  @override
  State<_LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<_LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        if (state is WeatherForecastDailyInitial) {
          context.read<WeatherForecastDailyCubit>().fetchWeatherWithCity();
          return splashScreenWidget();
        }
        if (state is WeatherForecastLoadedState) {
          return const HomeScreen();
        }
        return Container();
      },
    );
  }
}
