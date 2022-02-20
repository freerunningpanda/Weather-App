import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home_screen/home_screen.dart';
import '/cubit/weather_forecast_hourly_cubit.dart';
import '/widgets/background_widget.dart';
import '/models/hourly/weather_forecast_hourly.dart';
import '/widgets/splash_screen_widget.dart';
import '/widgets/weather_list_hourly.dart';

class WeatherHourlyPage extends StatelessWidget {
  final WeatherForecastHourly? locationWeather;
  const WeatherHourlyPage({Key? key, this.locationWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const _WeatherHoursPageWidget();
  }
}

class _WeatherHoursPageWidget extends StatefulWidget {
  const _WeatherHoursPageWidget({Key? key}) : super(key: key);

  @override
  State<_WeatherHoursPageWidget> createState() =>
      _WeatherHoursPageWidgetState();
}

class _WeatherHoursPageWidgetState extends State<_WeatherHoursPageWidget> {
  late Future<WeatherForecastHourly> forecastObject;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastHourlyCubit, WeatherForecastHourlyState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                setState(
                  () {
                    context
                        .read<WeatherForecastHourlyCubit>()
                        .fetchWeatherForecastHourly();
                  },
                );
              },
              icon: const Icon(
                Icons.my_location,
                color: Colors.yellow,
              ),
            ),
            centerTitle: true,
            title: Image.asset(
              'assets/logo/logo.png',
              width: 100,
            ),
            actions: [
              PopupMenuButton<int>(
                color: Colors.yellow[200],
                icon: Image.asset('assets/icons/arrow_down.png'),
                onSelected: (item) => onSelected(context, item),
                itemBuilder: (context) => [
                  const PopupMenuItem<int>(
                    value: 0,
                    child: Center(
                      child: Text(
                        'By the day',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const PopupMenuItem<int>(
                    value: 1,
                    child: Center(
                      child: Text(
                        'By the hour',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              )
            ],
            backgroundColor: Colors.blueGrey,
          ),
          body: BlocBuilder<WeatherForecastHourlyCubit,
              WeatherForecastHourlyState>(
            builder: (context, state) {
              if (state is WeatherForecastHourlyInitial) {
                context
                    .read<WeatherForecastHourlyCubit>()
                    .fetchWeatherForecastHourly();
                return splashScreenWidget();
              }
              if (state is WeatherForecastHourlyLoadedState) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  decoration: backGroundWidget(),
                  child: Column(
                    children: [
                      WeatherListHourly(data: state.loadWeather),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      },
    );
  }

  void onSelected(BuildContext context, int item) {
    switch (item) {
      case 0:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const HomeScreen()));
        break;
      case 1:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const WeatherHourlyPage()));
        break;
      default:
    }
  }
}
