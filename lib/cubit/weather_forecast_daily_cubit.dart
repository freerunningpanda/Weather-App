import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/weather_forecast.dart';
import '../../../api/weather_repository.dart';

part 'weather_forecast_daily_state.dart';

class WeatherForecastDailyCubit extends Cubit<WeatherForecastDailyState> {
  final WeatherRepository weatherRepository;
  WeatherForecastDailyCubit(this.weatherRepository)
      : super(WeatherForecastDailyInitial());

  Future<void> fetchWeatherWithCity(
      {String? cityName, bool isDaily = false}) async {
    try {
      emit(WeatherForecastDailyInitial());
      final loadWeather = await weatherRepository.fetchWeatherForecastWithCity(
          cityName: cityName);
      emit(WeatherForecastLoadedState(loadWeather));
    } catch (e) {
      emit(
        WeatherForecastErrorState(e.toString()),
      );
    }
  }
}
