class Constants {
  static const String weatherAppId = '1369dd6b5ae78fc9952261ab9aa236b4';
  static const String weatherAppIdHourly = '6f735c64776c94bc1257a8cc779ac194';
  static const String weatherBaseScheme = 'https://';
  static const String weatherBaseUrlDomain = 'api.openweathermap.org';
  static const String weatherForecastPath = '/data/2.5/forecast/daily';
  static const String weatherForecastPathHourly = '/data/2.5/onecall';
  static const String weatherImagesPath = '/img/w/';
  static const String weatherImagesUrl =
      weatherBaseScheme + weatherBaseUrlDomain + weatherImagesPath;
  static const String weatherCityInfo = 'weatherCityInfo';
  static const String weatherDailyList = 'weatherDailyList';
  static const String weatherDailyDetailed = 'weatherDailyDetailed';
  static const String weatherHourlyList = 'weatherHourlyList';
  static const String weatherHourlyDetailed = 'weatherHourlyDetailed';
}

enum WeatherSettings { day, hour }
