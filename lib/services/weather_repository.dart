import 'package:weather_app/models/weather.dart';
import 'package:weather_app/services/weather_api_provider.dart';

class WeatherRepository {
  WeatherProvider _weatherProvider = WeatherProvider();

  Future<List<Weather>> getAllWeathers(String input) =>
      _weatherProvider.getWeather(input);
}
