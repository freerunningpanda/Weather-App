import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../models/weather_forecast.dart';
import '../models/hourly/weather_forecast_hourly.dart';
import '../utilities/constants.dart';
import '../utilities/geolocation.dart';

class WeatherApi {
  Future<WeatherForecast> fetchWeatherForecast(
      {String? cityName, bool isCity = false}) async {
    Geolocation geolocation = Geolocation();
    await geolocation.getLocation();

    Map<String, String?> parametres;

    if (isCity) {
      var queryParametres = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
        'q': cityName,
      };
      parametres = queryParametres;
    } else {
      var queryParametres = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
        'lat': geolocation.lat.toString(),
        'lon': geolocation.lon.toString(),
      };
      parametres = queryParametres;
    }

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPath, parametres);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecast.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }

  Future<WeatherForecastHourly> fetchWeatherForecastHourly(
      {bool isCity = false}) async {
    Geolocation geolocation = Geolocation();
    await geolocation.getLocation();

    Map<String, String?> parametres;

    if (isCity) {
      var queryParametres = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
      };
      parametres = queryParametres;
    } else {
      var queryParametres = {
        'APPID': Constants.weatherAppId,
        'units': 'metric',
        'exclude': 'current,daily,minutely,alerts',
        'lat': geolocation.lat.toString(),
        'lon': geolocation.lon.toString(),
      };
      parametres = queryParametres;
    }

    var uri = Uri.https(Constants.weatherBaseUrlDomain,
        Constants.weatherForecastPathHourly, parametres);

    log('request: ${uri.toString()}');

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      return WeatherForecastHourly.fromJson(json.decode(response.body));
    } else {
      throw Exception('Error response');
    }
  }
}
