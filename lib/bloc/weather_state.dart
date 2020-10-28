import 'package:flutter/foundation.dart';

abstract class WeatherState {}

class WeatherEmptyState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  List<dynamic> loadedWeather;

  WeatherLoadedState({@required this.loadedWeather})
      : assert(loadedWeather != null);
}

class WeatherErrorState extends WeatherState {}
