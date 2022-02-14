import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/splash_screen_widget.dart';

import '../../widgets/background_widget.dart';
import '../../models/weather_forecast.dart';
import '../../cubit/weather_forecast_daily_cubit.dart';
import '../../api/weather_repository.dart';
import '../../widgets/city_temp_view.dart';
import '../../widgets/weather_list.dart';
import '../../utilities/constants.dart';
import '../../pages/weather_hours_page/weather_hours_page.dart';

class HomeScreen extends StatelessWidget {
  final WeatherForecast? locationWeather;
  const HomeScreen({Key? key, this.locationWeather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherForecastDailyCubit(WeatherRepository()),
      child: const _HomeScreenWidget(),
    );
  }
}

class _HomeScreenWidget extends StatefulWidget {
  const _HomeScreenWidget({Key? key}) : super(key: key);

  @override
  State<_HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<_HomeScreenWidget> {
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
                        WeatherList(data: state.loadWeather),
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
}
