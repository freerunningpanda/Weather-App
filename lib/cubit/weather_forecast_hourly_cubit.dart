import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/hourly/weather_forecast_hourly.dart';
import '../api/weather_repository.dart';

part 'weather_forecast_hourly_state.dart';

class WeatherForecastHourlyCubit extends Cubit<WeatherForecastHourlyState> {
  final WeatherRepository weatherRepository;
  WeatherForecastHourlyCubit(this.weatherRepository)
      : super(WeatherForecastHourlyInitial());

  Future<void> fetchWeatherForecastHourly({bool isDaily = false}) async {
    try {
      emit(WeatherForecastHourlyInitial());
      final loadWeather = await weatherRepository.fetchWeatherForecastHourly();

      emit(WeatherForecastLoadedState(loadWeather));
    } catch (e) {
      emit(
        WeatherForecastErrorState(e.toString()),
      );
    }
  }
}
