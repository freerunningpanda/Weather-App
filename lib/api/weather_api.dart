import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/weather_forecast.dart';
import '../utilities/constants.dart';
import '../utilities/geolocation.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecastWithCity(
      {String? cityName, bool isCity = false}) async {
    Geolocation geolocation = Geolocation();
    await geolocation.getLocation();

    Map<String, String?> parametres;

    if (isCity) {}

    var queryParametres = {
      'APPID': Constants.weatherAppId,
      'units': 'metric',
      'q': cityName,
    };

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, queryParametres);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
