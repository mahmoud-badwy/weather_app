import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/model/weather_model.dart';
import '../../data/repository/weather_api_service.dart';

// Define events for your Cubit
abstract class WeatherEvent {}

class GetWeatherEvent extends WeatherEvent {
  final String cityName;

  GetWeatherEvent(this.cityName);
}

// Define states for your Cubit
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  final WeatherModel weather;

  WeatherLoadedState(this.weather);
}

class WeatherErrorState extends WeatherState {
  final String errorMessage;

  WeatherErrorState(this.errorMessage);
}

class WeatherViewModel extends Cubit<WeatherState> {
  final WeatherApiService _weatherApiService = WeatherApiService();

  WeatherViewModel() : super(WeatherInitialState());

  void getWeather(String cityName) async {
    emit(WeatherLoadingState());

    try {
      final weatherData = await _weatherApiService.getWeatherData(cityName);
      final weatherModel = WeatherModel.fromJson(weatherData);

      emit(WeatherLoadedState(weatherModel));
    } catch (error) {
      emit(WeatherErrorState('Failed to fetch weather data'));
    }
  }
}
