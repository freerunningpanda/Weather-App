import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/api/weather_api.dart';
import 'package:weather_app/widgets/splash_screen_widget.dart';

import '../../widgets/background_widget.dart';
import '../../models/weather_forecast.dart';
import '../main_screen/cubit/weather_forecast_daily_cubit.dart';
import '../../api/weather_repository.dart';
import '../../widgets/city_temp_view.dart';
import '../../widgets/weather_list.dart';

class HomeScreen extends StatefulWidget {
  final WeatherForecast? locationWeather;
  const HomeScreen({Key? key, this.locationWeather}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<WeatherForecast>? forecastObject;
  final String _cityName = 'Kiev';
  @override
  void initState() {
    super.initState();

    if (widget.locationWeather != null) {
      forecastObject = WeatherApi().fetchWeatherForecast(cityName: _cityName);
    }
  }

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
  final items = ['By the hour', 'By the day'];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              forecastObject = WeatherApi().fetchWeatherForecast();
            });
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                dropdownColor: Colors.yellow[100],
                value: dropdownValue,
                icon: Image.asset('assets/icons/arrow_down.png'),
                elevation: 16,
                style: const TextStyle(color: Colors.blueGrey),
                onChanged: (value) => setState(() => dropdownValue = value),
                items: items.map(buildMenuItem).toList(),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blueGrey,
      ),
      body: BlocBuilder<WeatherForecastDailyCubit, WeatherForecastDailyState>(
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
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
}
