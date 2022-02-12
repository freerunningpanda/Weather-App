import 'package:flutter/material.dart';

import '../../widgets/background_widget.dart';
import '../../models/weather_forecast.dart';
import '../../api/weather_api.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<WeatherForecast> forecastObject;
  final String _cityName = 'Kiev';
  final items = ['By the hour', 'By the day'];
  String? dropdownValue;

  @override
  void initState() {
    super.initState();
    forecastObject =
        WeatherApi().fetchWeatherForecastWithCity(cityName: _cityName);

    forecastObject.then(
      (value) => print(value.list[0].weather[0].main),
    );
  }

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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: backGroundWidget(),
        child: Center(child: Text('text')),
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
