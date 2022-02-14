import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/splash_screen_widget.dart';

import '../../widgets/background_widget.dart';
import '../../models/weather_forecast.dart';
import '../../cubit/weather_forecast_daily_cubit.dart';
import '../../api/weather_repository.dart';
import '../../widgets/city_temp_view.dart';
import '../../widgets/weather_list_hourly.dart';
import '../../utilities/constants.dart';
import '../main_screen/home_screen.dart';

class WeatherHoursPage extends StatelessWidget {
  final WeatherForecast? locationWeather;
  const WeatherHoursPage({Key? key, this.locationWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherForecastDailyCubit(WeatherRepository()),
      child: const _WeatherHoursPageWidget(),
    );
  }
}

class _WeatherHoursPageWidget extends StatefulWidget {
  const _WeatherHoursPageWidget({Key? key}) : super(key: key);

  @override
  State<_WeatherHoursPageWidget> createState() =>
      _WeatherHoursPageWidgetState();
}

class _WeatherHoursPageWidgetState extends State<_WeatherHoursPageWidget> {
  late Future<WeatherForecast> forecastObject;
  final String _cityName = 'Kiev';
  final weatherSettingsMap = <WeatherSettings, String>{
    WeatherSettings.day: 'By the day',
    WeatherSettings.hour: 'By the hour',
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                onPressed: () {
                  setState(
                    () {
                      context
                          .read<WeatherForecastDailyCubit>()
                          .fetchWeatherWithCity(cityName: _cityName);
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
                  onSelected: (item) => onSelected(context, item),
                  itemBuilder: (context) => [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text('By the day'),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text('By the hour'),
                    ),
                  ],
                )
              ],
              backgroundColor: Colors.blueGrey,
            ),
            body: BlocBuilder<WeatherForecastDailyCubit,
                WeatherForecastDailyState>(
              builder: (context, state) {
                if (state is WeatherForecastDailyInitial) {
                  context
                      .read<WeatherForecastDailyCubit>()
                      .fetchWeatherWithCity(cityName: _cityName);
                  return splashScreenWidget();
                }
                if (state is WeatherForecastLoadedState) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: backGroundWidget(),
                    child: Column(
                      children: [
                        CityTempView(data: state.loadWeather),
                        WeatherListHourly(data: state.loadWeather),
                      ],
                    ),
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ));
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
            MaterialPageRoute(builder: (context) => const WeatherHoursPage()));
        break;
      default:
    }
  }

  // DropdownMenuItem<String> buildMenuItem(String item) {
  // switch (item) {
  //   case :

  //     break;
  //   default:
  // }

  //   return DropdownMenuItem(
  //     value: item,
  //     child: Text(
  //       item,
  //       style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
  //     ),
  //   );
  // }
}
