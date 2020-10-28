import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather.dart';

class WeatherProvider {
  //https://www.metaweather.com/api/location/search/?query=

  Future<List<Weather>> getWeather(String input) async {
    print(input);
    final response = await http
        .get('https://www.metaweather.com/api/location/search/?query=$input');
    if (response.statusCode == 200) {
      final List<dynamic> weatherJson = json.decode(response.body);
      return weatherJson.map((json) => Weather.fromJson(json)).toList();
    } else {
      throw Exception('Error fetching data');
    }
  }
}
