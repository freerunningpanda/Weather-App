import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/widgets/splash_screen_widget.dart';

import '../../widgets/background_widget.dart';
import '../../models/weather_forecast.dart';
import '../main_screen/cubit/weather_forecast_daily_cubit.dart';
import '../../api/weather_repository.dart';
import '../../widgets/city_temp_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WeatherForecastDailyCubit(WeatherRepository()),
      child: const _HomeScreen(),
    );
  }
}

class _HomeScreen extends StatefulWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  State<_HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<_HomeScreen> {
  late Future<WeatherForecast> forecastObject;
  final String _cityName = 'Kiev';
  final items = ['By the hour', 'By the day'];
  String? dropdownValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
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
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 0.5),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(15.0)),
                      child: Column(
                        children: const [
                          SizedBox(height: 20),
                          CityTempView(),
                        ],
                      ),
                    ),
                  ),
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
