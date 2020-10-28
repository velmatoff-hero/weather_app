abstract class WeatherEvent {}

class WeatherLoadEvent extends WeatherEvent {
  String input;

  WeatherLoadEvent({this.input});
}
