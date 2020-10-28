import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/bloc/weather_event.dart';
import 'package:weather_app/bloc/weather_state.dart';
import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_repository.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weathersRepository;

  WeatherBloc({this.weathersRepository}) : super(WeatherEmptyState());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherLoadEvent) {
      yield WeatherLoadingState();
      try {
        if (event.input.isEmpty) {
          yield WeatherEmptyState();
        } else {
          final List<Weather> _loadedWeatherList =
              await weathersRepository.getAllWeathers(event.input);
          yield WeatherLoadedState(loadedWeather: _loadedWeatherList);
        }
      } catch (_) {
        yield WeatherErrorState();
      }
    }
  }
}
